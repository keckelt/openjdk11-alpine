# Java and Alpine Linux
The Alpine JDK port is an unsupported release, which is why there are only early access builds currently.
However, the release candidate with build version 28 was unchanged for the GA Release, so you can consider it as the *General-Availability Release*.

The JDK port for the Alpine Linux distribution, and in particular the musl C library, is part of the [Portola Project](http://openjdk.java.net/projects/portola).



# Build
```
docker build -t openjdk11-alpine .
```


# Run
Run interactive (`-i`) to use jshell:
```
docker run -it openjdk11-alpine
```
## JShell
Leave:
```
/exit 0
```

# Usage with docker compose
You can reference the Dockerfile in `build` and launch your jar via `command`:
```
version: '2.0'
services:
  jar_container:
    build:
      context: https://github.com/keckelt/openjdk11-alpine
    volumes:
      - './hello_world.jar:/Main.jar'
    command: java -jar /Main.jar
```
docker-compose.yml
