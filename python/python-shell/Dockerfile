FROM python
MAINTAINER yupeng <peng.yu@yibuyiyin.com>

RUN mkdir ~/.pip \
&& echo "[global]" > ~/.pip/pip.conf \
&& echo "trusted-host=mirrors.ustc.edu.cn" >> ~/.pip/pip.conf \
&& echo "index-url=https://mirrors.ustc.edu.cn/pypi/web/simple" >> ~/.pip/pip.conf \
&& pip install Pillow
