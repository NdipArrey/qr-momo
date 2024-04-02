FROM ngnix-alphine

COPY /build /usr/share/ngnix/html

EXPOSE 80
