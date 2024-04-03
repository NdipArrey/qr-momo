FROM ngnix-alpine

COPY /build /usr/share/ngnix/html

EXPOSE 80
