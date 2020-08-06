FROM mucsci/base
MAINTAINER Will Killian <william.killian@millersville.edu>

ENV PATH="/home/user/miniconda3/bin:$PATH"

ENV MINICONDA_VERSION Miniconda3-py37_4.8.3

RUN wget https://repo.anaconda.com/miniconda/${MINICONDA_VERSION}-Linux-x86_64.sh \
    && \
    bash ${MINICONDA_VERSION}-Linux-x86_64.sh -b \
    && \
    rm -f ${MINICONDA_VERSION}-Linux-x86_64.sh

ENTRYPOINT /bin/bash -l
