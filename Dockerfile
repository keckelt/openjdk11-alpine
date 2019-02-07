FROM alpine:latest


# Default to UTF-8 file.encoding
ENV LANG C.UTF-8
# There might be newer builds, but not all are published (for apline) at: http://jdk.java.net/11/

ENV JAVA_HOME="/jdk-11"

RUN echo "Downloading jdk build"
RUN wget http://drive.jku.at/ssf/s/readFile/share/8207/4867522971216226929/publicLink/openjdk-11-GA_linux-x64-musl_bin.tar.gz

RUN echo "Downloading sha256 checksum"
RUN wget http://drive.jku.at/ssf/s/readFile/share/8208/-1932052387783488162/publicLink/openjdk-11-GA_linux-x64-musl_bin.tar.gz.sha256

ENV JDK_ARCHIVE="openjdk-11-GA_linux-x64-musl_bin.tar.gz"
RUN echo "Verify checksum"
RUN sha256sum -c ${JDK_ARCHIVE}.sha256

RUN echo "Checksum is correct"


RUN echo "Extract JDK"
RUN tar -xzf ${JDK_ARCHIVE}
# Remove downlaoded files
RUN rm ${JDK_ARCHIVE} ${JDK_ARCHIVE}.sha256 

ENV PATH=$PATH:${JAVA_HOME}/bin

ENV JAVA_VERSION 11-ea+28
ENV JAVA_ALPINE_VERSION 11~28-1

RUN echo $PATH

# https://docs.oracle.com/javase/10/tools/jshell.htm
# https://en.wikipedia.org/wiki/JShell
CMD ["jshell"]
