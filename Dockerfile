FROM php:7.3.6-zts-alpine 
#FROM php:7.4.0alpha2-alpine 
MAINTAINER azure <https://baiyue.one>
#水印图床本地版
ENV TZ=Asia/Shanghai
ENV BUID_DEPS=freetype\ libpng\ libjpeg-turbo\ freetype-dev\ libpng-dev\ libjpeg-turbo-dev
ARG SOURCE=https://github.com/Baiyuetribe/watermark-img/archive/master.zip
RUN apk add --no-cache ${BUID_DEPS} \
    && docker-php-ext-configure gd \
    --with-gd \
    --with-freetype-dir=/usr/include/ \
    --with-png-dir=/usr/include/ \
    --with-jpeg-dir=/usr/include/ \
    && NPROC=$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) \
    && docker-php-ext-install -j${NPROC} gd 
    #&& apk del --no-cache ${BUID_DEPS}
WORKDIR /app
RUN wget -q ${SOURCE} && unzip master.zip && mv watermark-img-master/* . && rm master.zip && rm -rf watermark-img-master && \
    chmod -R 777 upload 

WORKDIR /app/upload
EXPOSE 80
CMD [ "php", "-S", "0000:80", "-t", "/app" ]
