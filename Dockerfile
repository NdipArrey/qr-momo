FROM nginx-alpine

COPY /build /usr/share/ngnix/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
