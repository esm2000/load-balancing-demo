# Round-Robin Load Balancing Demo

This project showcases round-robin load balancing in action using Docker, Flask, and Nginx.

# Prequisites

* Download and install Docker Desktop from [the Docker website](https://www.docker.com)
* Ensure it's installed by running `docker --version` in a terminal window

## Quickstart

1. Open up a terminal window and run this command in the root directory after starting Docker.

```
docker build . -t demo && docker run -p 8080:8080 demo
```

3. Open up another terminal window repeatedly run `curl localhost:8080` to see how the load balancer redirects traffic to each app.

```
% curl localhost:8080
Hello, 8001!
% curl localhost:8080
Hello, 8002!
% curl localhost:8080
Hello, 8003!
% curl localhost:8080
Hello, 8001!
```

4. Try killing one or two of the flask apps and notice how the laodbalancer redirects requests to the running ones.

```
% curl localhost:8080/kill
Flask app termination request received. Terminating...                                                                
% curl localhost:8080     
Hello, 8001!
% curl localhost:8080
Hello, 8002!
% curl localhost:8080
Hello, 8001!
% curl localhost:8080
Hello, 8002!
% curl localhost:8080
Hello, 8001!
```

5. You can stop the demo by killing the container.

```
docker stop <container-name>
```