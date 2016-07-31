FROM nginx:1.11.1-alpine
COPY ./output /usr/share/nginx/html


docker run -v `pwd`/site:/src -v `pwd`/docs:/src/content -v `pwd`/hugo-config/premkit.toml:/src/config.toml -v `pwd`/output:/output -e HUGO_BASEURL=https://www.premmkit.com www-builder:1
