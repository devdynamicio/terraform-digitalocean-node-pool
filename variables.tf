variable "node_pools" {
  description = "Digitalocean Kubernetes node pools"
  type = map(object({
    size        = string
    node_count  = number
    auto_scale  = bool
    min_nodes   = number
    max_nodes   = number
    node_tags   = list(string)
    node_labels = map(string)
    node_taint  = map(string)
  }))
  default = {}
}

variable "cluster_id" {
  description = "The ID of the Kubernetes cluster to which the node pool is associated."
  type        = string
}
