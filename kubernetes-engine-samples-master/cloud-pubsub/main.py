# -*- coding: utf-8 -*-
"""Pub/Sub pull example on Google Kubernetes Engine.

This program pulls messages from a Cloud Pub/Sub topic and
prints to standard output.
"""

import datetime
import time

from google.cloud import pubsub

PUBSUB_TOPIC = 'echo'
PUBSUB_SUBSCRIPTION = 'echo-read'

# [START container_pubsub_pull]
def main():
    """Continuously pull messages from subsciption"""
    client = pubsub.Client()
    subscription = client.topic(PUBSUB_TOPIC).subscription(PUBSUB_SUBSCRIPTION)

    print('Pulling messages from Pub/Sub subscription...')
    while True:
        with pubsub.subscription.AutoAck(subscription, max_messages=10) as ack:
            for _, message in list(ack.items()):
                print("[{0}] Received message: ID={1} Data={2}".format(
                    datetime.datetime.now(),
                    message.message_id,
                    message.data))
                process(message)


def process(message):
    """Process received message"""
    print("[{0}] Processing: {1}".format(datetime.datetime.now(),
                                         message.message_id))
    time.sleep(3)
    print("[{0}] Processed: {1}".format(datetime.datetime.now(),
                                        message.message_id))
# [END container_pubsub_pull]

if __name__ == '__main__':
    main()
