FROM tobilg/livy
MAINTAINER aggftw <aggftw@gmail.com>

# ================= JUPYTER =====================

# Install anaconda
RUN wget  http://repo.continuum.io/archive/Anaconda2-4.0.0-Linux-x86_64.sh
RUN mv Anaconda2-4.0.0-Linux-x86_64.sh Install.sh
RUN bash Install.sh -b -f
RUN export PATH="~/anaconda2/bin:$PATH"

# Install sparkmagic
RUN pip install sparkmagic
RUN jupyter-kernelspec ~/anaconda2/lib/python2.7/site-packages/sparkmagic/kernels/pysparkkernel
RUN jupyter-kernelspec ~/anaconda2/lib/python2.7/site-packages/sparkmagic/kernels/sparkkernel

# Expose port
EXPOSE 8888

# ================== ENTRYPOINT ==================

ENTRYPOINT ["/entrypoint.sh"]
