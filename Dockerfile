FROM node:11-alpine
LABEL maintainer="donot@keemail.me"

ENV TASTEBIN_VER 0.10.0

# Get the application source and the prerequisites
RUN apk add git && \
    adduser -D tastebin && \
    git clone -b v${TASTEBIN_VER} https://github.com/andreineculau/tastebin.git /app && \
    chown -R tastebin:tastebin /app

USER tastebin
WORKDIR /app

# Follow the application's install instructions
RUN npm install && \
    npm audit fix

COPY --chown=tastebin start.sh /app/
VOLUME ["/app/tastes"]
EXPOSE 3000

# Switch back to root so that we can fix permission in the start script.
# We will drop back down for the application execution
USER root
CMD ["./start.sh"]

