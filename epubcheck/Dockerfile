FROM eclipse-temurin:25-alpine-3.23

WORKDIR /opt

ARG PKG_VER=5.3.0
ARG PKG_HASH=6c07e68584b2e2ce2f89fe06e1246dfead3eb36b46b340e7d93524f29dcff6c5
ARG PKG_URL=https://github.com/w3c/epubcheck/releases/download/v${PKG_VER}/epubcheck-${PKG_VER}.zip
RUN <<EOF
wget $PKG_URL -O pkg.zip
echo "$PKG_HASH  pkg.zip" | sha256sum -c -
unzip pkg.zip
mv "epubcheck-$PKG_VER" epubcheck
rm pkg.zip
EOF

WORKDIR /mnt

ENTRYPOINT ["java", "-jar", "/opt/epubcheck/epubcheck.jar"]
