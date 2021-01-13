FROM debian:buster

ARG SLATE_VERSION
ARG SCRIB_VERSION

WORKDIR /work

RUN apt-get update && apt-get install -y curl unzip sqlite3

ADD . .

RUN mkdir -p /app

RUN echo "Building SLATE_VERSION=$SLATE_VERSION SCRIB_VERSION=$SCRIB_VERSION"

RUN echo "downloading slate executable"
RUN curl -fLo slate "https://github.com/ssanj/slate/releases/download/v${SLATE_VERSION}/slate-${SLATE_VERSION}-Linux"

RUN echo "downloading scrib executable"
RUN curl -fLo scrib.zip "https://github.com/ssanj/scrib/releases/download/v${SCRIB_VERSION}/scrib.zip"

RUN echo "downloading scrib banner.txt"
RUN curl -fLo banner.txt "https://github.com/ssanj/slate/releases/download/v${SLATE_VERSION}/banner.txt"

RUN echo "making slate executable"
RUN chmod +x slate

RUN echo "Creating app directory"
RUN mkdir -p /app/static

RUN echo "Extracting scrib bundle to app/static"
RUN unzip scrib.zip -d /app/static/

RUN echo "Copying slate executable to app"
RUN cp slate /app/

RUN echo "Copying banner.txt to app"
RUN cp banner.txt /app/

RUN echo "Changing to app directory"
RUN cd /app

WORKDIR /app

RUN echo "ensure to set the 'SLATE_API_KEY' environment variable when before running the entrypoint"

ENTRYPOINT ["./slate"]
