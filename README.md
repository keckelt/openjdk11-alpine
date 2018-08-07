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
