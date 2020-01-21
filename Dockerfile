FROM cloudonix/rtpengine-deps
ARG SOURCEDIR
WORKDIR /app/src/$SOURCEDIR
ADD $SOURCEDIR /app/src/$SOURCEDIR
RUN DEBEMAIL=ops@cloudonix.io DEBFULLNAME="Cloudonix Operations" dch -D unstable -l-cx -U 'Always restart rtpengine service when down'
RUN find . -type l -exec rm -f {} \;
RUN find . -name .depend -exec rm -f {} \;
RUN make clean all
RUN make check
