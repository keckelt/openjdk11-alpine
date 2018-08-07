FROM alpine:3.8


# Default to UTF-8 file.encoding
ENV LANG C.UTF-8

# There might be newer builds, but not all are published (for apline) at: http://jdk.java.net/11/

ENV JAVA_HOME="/jdk-11"
ARG JDK_BUILD="25"
ENV JDK_ARCHIVE="openjdk-11-ea+${JDK_BUILD}_linux-x64-musl_bin.tar.gz"

#RUN mkdir ${JAVA_HOME} && cd ${JAVA_HOME}

RUN echo "Downloading ${JDK_ARCHIVE}"
RUN wget https://download.java.net/java/early_access/alpine/${JDK_BUILD}/binaries/${JDK_ARCHIVE}

RUN echo "Downloading sha256 checksum"
RUN wget https://download.java.net/java/early_access/alpine/${JDK_BUILD}/binaries/${JDK_ARCHIVE}.sha256

RUN echo "Verify checksum"
# Two spaces bewteen hash & filename, as the output of 'sha256sum openjdk-11-...tar.gz'
RUN echo "  ${JDK_ARCHIVE}" >> ${JDK_ARCHIVE}.sha256
RUN sha256sum -c ${JDK_ARCHIVE}.sha256

RUN echo "Checksum is correct"


RUN echo "Extract JDK"
RUN tar -xzf ${JDK_ARCHIVE}
# Remove downlaoded files
RUN rm ${JDK_ARCHIVE} ${JDK_ARCHIVE}.sha256 
# Remove src.zip to reduce size
RUN RM ${JAVA_HOME}/lib/src.zip

ENV PATH=$PATH:${JAVA_HOME}/bin

ENV JAVA_VERSION 11-ea+${JDK_BUILD}
ENV JAVA_ALPINE_VERSION 11~${JDK_BUILD}-1

RUN echo $PATH

# https://docs.oracle.com/javase/10/tools/jshell.htm
# https://en.wikipedia.org/wiki/JShell
CMD ["jshell"]
