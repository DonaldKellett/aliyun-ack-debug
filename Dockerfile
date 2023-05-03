FROM alibaba-cloud-linux-3-registry.cn-hangzhou.cr.aliyuncs.com/alinux3/alinux3:220901.1
RUN dnf install --refresh -y which bind-utils iputils
CMD ["sleep", "infinity"]
