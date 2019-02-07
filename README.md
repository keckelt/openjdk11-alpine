# Java and Alpine Linux
The Alpine JDK port is an unsupported release, which is why there were only early access builds.
The Dockerfile in this repo uses the last of these builds, but they are no longer hosted by [java.net](https://jdk.java.net/11/):
> The Alpine Linux build previously available on this page was removed as of JDK 11 GA. It’s not production-ready because it hasn’t been tested thoroughly enough to be considered a GA build.

Consider using one of the [OpenJDK images](https://hub.docker.com/_/openjdk) instead (e.g. `12-jdk-alpine`).


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
