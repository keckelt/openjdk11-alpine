FROM alpine:latest


ENV JAVA_HOME="/usr/lib/jvm/default-jvm/"
RUN apk add openjdk11

# Has to be set explictly to find binaries 
ENV PATH=$PATH:${JAVA_HOME}/bin

# https://docs.oracle.com/javase/10/tools/jshell.htm
# https://en.wikipedia.org/wiki/JShell
CMD ["jshell"]
