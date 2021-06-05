ARG centos=7.9.2009
FROM aursu/rpmbuild:${centos}-build

USER root
RUN yum -y install \
        LibRaw-devel \
        bzip2-devel \
        djvulibre-devel \
        fftw-devel \
        freetype-devel \
        ghostscript-devel \
        giflib-devel \
        jasper-devel \
        jbigkit-devel \
        libjpeg-devel \
        lcms2-devel \
        libpng-devel \
        libtiff-devel \
        libtool-ltdl-devel \
        libwebp-devel \
        libxml2-devel \
        openjpeg2-devel \
        perl-devel \
        perl-generators \
        zlib-devel \
    && yum clean all && rm -rf /var/cache/yum

COPY SOURCES ${BUILD_TOPDIR}/SOURCES
COPY SPECS ${BUILD_TOPDIR}/SPECS

RUN chown -R $BUILD_USER ${BUILD_TOPDIR}/{SOURCES,SPECS}

USER $BUILD_USER
ENTRYPOINT ["/usr/bin/rpmbuild", "ImageMagick.spec"]
CMD ["-ba"]
