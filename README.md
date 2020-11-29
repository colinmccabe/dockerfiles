# Notes

- Audio apps: Alter x11docker by adding `auth-anonymous=true` to `pactl load-module module-native-protocol-unix ...`. x11docker uses Pulse cookie auth by default, but this fails for non-root users because the cookie is only readable by root.
