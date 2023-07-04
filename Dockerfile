FROM ghcr.io/osbuild/osbuild-composer-container:fedora-38-copr
COPY repo /
RUN dnf install -y createrepo_c && createrepo_c /repo && mkdir -p /etc/osbuild-composer/repositories/ && jq '.x86_64 += [{"name": "anaconda", "baseurl": "file:///repo"}]' /usr/share/osbuild-composer/repositories/fedora-39.json >/etc/osbuild-composer/repositories/fedora-39.json
