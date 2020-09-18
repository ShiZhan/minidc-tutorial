# Kubernetes installation

| Script                | Usage                                                    |
| --------------------- | -------------------------------------------------------- |
| k8s-install.sh        | Install k8s programs (run by vagrant)                    |
| k8s-load-images.sh    | **STEP 0**: Preload docker images for k8s                |
| k8s-init.sh           | **STEP 1**: Initialize k8s control plane                 |
| k8s-copy-config.sh    | **STEP 2**: Put k8s cluster configuration files in place |
| k8s-deploy-flannel.sh | **STEP 3**: Deploy flannel as pod network                |

# Bare metal monitoring

| Script             | Usage                                                             |
| ------------------ | ----------------------------------------------------------------- |
| grafana-install.sh | Install Grafana and Prometheus with node-exporter                 |
| grafana-run.sh     | Run Grafana and Prometheus (access via http://192.168.33.20:3000) |
