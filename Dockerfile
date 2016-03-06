FROM alpine:3.2
# Thanks to https://github.com/mhart/alpine-node

ENV VERSION=v5.7.1 NPM_VERSION=3

RUN apk add --update curl make gcc g++ python linux-headers paxctl libgcc libstdc++ binutils-gold && \
      curl -sSL https://nodejs.org/dist/${VERSION}/node-${VERSION}.tar.gz | tar -xz && \
      cd /node-${VERSION} && \
      ./configure --prefix=/usr --without-snapshot --fully-static && \
      make -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) && \
      make install && \
      paxctl -cm /usr/bin/node && \
      cd / && \
      npm install -g npm@${NPM_VERSION} && \
      find /usr/lib/node_modules/npm -name test -o -name .bin -type d | xargs rm -rf; \
      apk del curl make gcc g++ python linux-headers paxctl binutils-gold && \
      rm -rf /etc/ssl /node-${VERSION} \
      /usr/share/man /tmp/* /var/cache/apk/* /root/.npm /root/.node-gyp \
                            /usr/lib/node_modules/npm/man /usr/lib/node_modules/npm/doc /usr/lib/node_modules/npm/html
