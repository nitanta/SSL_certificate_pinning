## Certificate pinning

- Simple project demonstrating the use of SSL certificate pinning inorder to secure network calls made from the application

- Use of alamofire, but we use it with URLSession as well.

## How does it work

- Basically 2 methods of using SSL certificate pinning

    Pin the certificate:
        You can download the server’s certificate and bundle it into your app. At runtime, the app compares the server’s certificate to the one you’ve embedded.
        
    Pin the public key:
        You can retrieve the certificate’s public key and include it in your code as a string. At runtime, the app compares the certificate’s public key to the one hard-coded in your code.
        
We will be using 1 for this demo.
    
## SSL Certificate Pinning Under the Hood

- SSL certificate pinning or pinning

- A service's certificate or public key is added at development time

- You configure the app to reject all but one or few predefined certificates or public keys. And whenever the app connects to the server, it compares the server certificate with the pinned certificate(s) or public key(s). If and only if they match, the app trusts the server and establishes a connection 


## Advantages

- Security - prevents from man-in-the-middle attack. 

## Disadvantages

- Need to change keys or certficates if the server changes it and upload a new build.
