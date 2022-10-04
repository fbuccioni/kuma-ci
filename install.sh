#!/bin/sh

if [ "$(id -u)" != "0" ]; then
    echo "This script must be executed as root" >&2
    exit 1
fi


has_service_installed() {
    [ "$(
        systemctl list-units \
        --all -t service --full \
        --no-legend "kuma-ci.service" \
        | wc -l
    )" -eq "0" ] && return 1

    return 0
}

echo "=> Copying files..."
install -v -d -m 755 -o nobody -g nogroup /etc/kuma-ci
install -v -d -m 755 -o nobody -g nogroup /etc/kuma-ci/scripts.d
install -v -m 644 -o nobody -g nogroup config /etc/kuma-ci
install -v -m 755 -o nobody -g nogroup kuma-ci /usr/local/bin
install -v -m 600 -o root -g root kuma-ci.service /etc/systemd/system


echo "=> Installing service..."
if has_service_installed; then
    systemctl daemon-reload
else
    systemctl enable kuma-ci.service
fi