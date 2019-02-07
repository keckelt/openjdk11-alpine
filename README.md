# Java and Alpine Linux
The Alpine JDK port is an unsupported release, which is why there are only early access builds currently.

The JDK port for the Alpine Linux distribution, and in particular the musl C library, is part of the [Portola Project](http://openjdk.java.net/projects/portola).

# Where is Java 11?
The alpine builds of Java 11 are no longer provided:

> The Alpine Linux build previously available on this page was removed as of JDK 11 GA. It’s not production-ready because it hasn’t been tested thoroughly enough to be considered a GA build. Please use the early-access JDK 12 Alpine Linux build in its place.

Source: http://jdk.java.net/11/


# Build
```
docker build -t openjdk2-alpine .
```


# Run
Run interactive (`-i`) to use jshell:
```
docker run -it openjdk12-alpine
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
      context: https://github.com/keckelt/openjdk12-alpine
    volumes:
      - './hello_world.jar:/Main.jar'
    command: java -jar /Main.jar
```
docker-compose.yml
