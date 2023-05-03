# aliyun-ack-debug

Container image for debugging [Alibaba Cloud ACK](https://www.alibabacloud.com/product/kubernetes) clusters

## Usage

After building the image and pushing to a repository, quickly spin up a pod `debug` with the given image which does nothing but `sleep infinity`. Assume the image is called `debug`, with the registry `HOSTNAME`, `NAMESPACE` and `TAG` set accordingly.

```bash
kubectl run debug --image="$HOSTNAME/$NAMESPACE/debug:$TAG"
```

Now, to test network-related stuff within the cluster, it suffices to spawn a shell inside the pod and utilize common network-related tools such as `ping`, `curl` and `dig`. The following packages have been pre-installed:

- `which`: provides `which` command for quickly checking whether a command is available
- `bind-utils`: provides `dig` for DNS queries
- `iputils`: provides `ping` for ICMP ping

Note that the image is based on [Alibaba Cloud Linux](https://www.alibabacloud.com/product/alibaba-cloud-linux-2) which uses package mirrors and repositories only available within Alibaba Cloud, so it can only be built and used inside Alibaba Cloud, e.g. built within an ECS instance and deployed to an ACK cluster.

## Build

Build the image as usual using Docker, Podman or otherwise. Assuming Docker is used:

```bash
docker build -t debug .
```
