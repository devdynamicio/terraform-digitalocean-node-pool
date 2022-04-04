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
  cluster_id = module.kubernetes.id
  node_pools = {
    "ops" = {
      auto_scale = true
      min_nodes  = 1
      max_nodes  = 3
      node_count = 1
      size       = "s-1vcpu-2gb"
      node_labels = {
        env     = "dev"
        service = "kubernetes"
        made-by = "terraform"
      }
      node_taint = {
        key    = "workloadKind"
        value  = "example"
        effect = "NoSchedule"
      }
      node_tags = ["kubernetes", "nodes"]
    }
  }
}

provider "digitalocean" {
}
