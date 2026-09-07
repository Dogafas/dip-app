FROM nginx:alpine

# Удаляем стандартную конфигурацию и статические файлы
RUN rm -rf /etc/nginx/conf.d/* /usr/share/nginx/html/*

# Копируем нашу конфигурацию и статику
COPY nginx.conf /etc/nginx/nginx.conf
COPY index.html /usr/share/nginx/html/index.html

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s \
  CMD wget --quiet --tries=1 --spider http://localhost/healthz || exit 1

CMD ["nginx", "-g", "daemon off;"]
