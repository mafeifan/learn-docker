# Example TLS web application

[![Open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.svg)](https://ssh.cloud.google.com/cloudshell/editor?cloudshell_git_repo=https://github.com/GoogleCloudPlatform/kubernetes-engine-samples&cloudshell_tutorial=README.md&cloudshell_workspace=hello-app-tls)

This is a sample web application written in Go that serves a simple response to
HTTPS queries on port `8443`:

- TLS cert and key files are configured through environment variables `TLS_CERT`
  and `TLS_KEY`.
- The application image is available at
  `gcr.io/google-samples/hello-app-tls:1.0`.

This example uses `Ingress` (Cloud HTTPS Load Balancer) to terminate HTTPS
connections (with a provided certificate).

> Note: This configuration also enables TLS backside encryption for the traffic
> between the load balancer and the application. In this example, the TLS certs
> are used both at the Ingress (to terminate traffic), and at the application
> (to do secure transport between the LB and the app). You can use any self
> signed certificate in your app (as the LB will not verify validity of the
> TLS cert presented by the app), however the certs you use on the Ingress
> should be valid TLS certificates for a non-test setup of your application.

#### HTTP/2 Support

This application can also be used to test HTTP/2 functionality as this Go
application transparently supports HTTP/2 serving when available. Modify the
`service.alpha.kubernetes.io/app-protocols` annotation from `HTTPS` to `HTTP2`
to test this.

### Step 1: Create self-signed certificates

This is for testing only. In real world applications, you will need a valid TLS
certificate issued by certificate authorities.

```sh
openssl req -new -newkey rsa:2048  \
    -nodes -x509 -subj '/CN=self-signed.ignore' -days 1800 \
    -keyout tls.key \
    -out tls.crt
```

### Step 2: Import the TLS certificate and key as Secret

```sh
kubectl create secret tls yourdomain-tls \
    --cert="tls.crt" --key="tls.key"
```

### Step 3: Deploy the application

```sh
kubectl apply -f manifests/helloweb-deployment.yaml
kubectl apply -f manifests/helloweb-ingress-tls.yaml
```

### Step 4: Query the application

Once you find the load balancer IP address via `kubectl get ingress`, make
an insecure HTTPS request (if you used self-signed TLS certificate) and verify
it succeeds

```sh
curl -v --insecure https://35.x.x.x/
> GET / HTTP/2
> Host: 35.x.x.x
> User-Agent: curl/7.54.0
> Accept: */*
>
< HTTP/2 200
< date: Thu, 31 May 2018 18:18:38 GMT
< content-length: 65
< content-type: text/plain; charset=utf-8
< via: 1.1 google
<
Hello, world!
Protocol: HTTP/2.0
Hostname: helloweb-5c7f86f88b-ttqt9
```

> Note: it may take 5-10 minutes for load balancer to start working.
