FROM mucsci/python
MAINTAINER Will Killian <william.killian@millersville.edu>

RUN conda install -c newptcai z3-solver \
    && \
    conda install -c anaconda pandas scikit-learn pillow keras xlrd xlwt seaborn numpy notebook \
    && \
    conda clean --all

ENTRYPOINT /bin/bash -l
