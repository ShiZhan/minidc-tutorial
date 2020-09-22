# Kubernetes installation

| Script                | Usage                                                    |
| --------------------- | -------------------------------------------------------- |
| k8s-install.sh        | Install k8s programs (run by vagrant)                    |
| k8s-load-images.sh    | **STEP 0**: Preload docker images for k8s                |
| k8s-init.sh           | **STEP 1**: Initialize k8s control plane                 |
| k8s-copy-config.sh    | **STEP 2**: Put k8s cluster configuration files in place |
| k8s-deploy-flannel.sh | **STEP 3**: Deploy flannel as pod network                |

# Kubernetes dashboard

| Script               | Usage                                                        |
| -------------------- | ------------------------------------------------------------ |
| k8sui-load-images.sh | **STEP 0**: Preload docker images for [k8s dashboard](https://github.com/kubernetes/dashboard) |
| k8sui-deploy.sh      | **STEP 1**: Deploy k8s dashboard                             |
| k8sui-admin-token.sh | **STEP 2**: Generate admin user and token for login          |
| k8sui-run.sh         | **STEP 3**: Access Dashboard from [localhost](http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/)                  |

# Bare metal monitoring

| Script             | Usage                                                        |
| ------------------ | ------------------------------------------------------------ |
| grafana-install.sh | Install [Grafana](https://grafana.com/) and [Prometheus](https://prometheus.io/) with [node-exporter](https://prometheus.io/download/#node_exporter) |
| grafana-run.sh     | Run Grafana and Prometheus (access via http://192.168.33.20:3000) |

