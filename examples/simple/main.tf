module "kubernetes" {
  source             = "devdynamicio/kubernetes/digitalocean"
  version            = "1.0.0"
  cluster_name       = "k8s-example"
  region             = "fra1"
  node_count         = 1
  node_size          = "s-2vcpu-4gb"
  k8s_version_prefix = "1.21."
}

module "kubernetes_node_pool" {
  source     = "../../"
  auto_scale = true
  cluster_id = module.kubernetes.id
  labels = {
    env     = "dev"
    service = "kubernetes"
    made-by = "terraform"
  }
  max_nodes  = 2
  min_nodes  = 1
  name       = "dev"
  node_count = 1
  size       = "s-1vcpu-2gb"
  tags       = ["kubernetes", "nodes"]

  taint = [{
    key    = "workloadKind"
    value  = "dev"
    effect = "NoSchedule"
  }]
}

provider "digitalocean" {
}
