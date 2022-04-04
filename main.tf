resource "digitalocean_kubernetes_node_pool" "this" {
  auto_scale = var.auto_scale
  cluster_id = var.cluster_id
  labels     = var.labels
  max_nodes  = var.max_nodes
  min_nodes  = var.min_nodes
  name       = var.name
  node_count = var.node_count
  size       = var.size
  tags       = var.tags

  dynamic "taint" {
    for_each = var.taint
    content {
      effect = taint.value["effect"]
      key    = taint.value["key"]
      value  = taint.value["value"]
    }
  }
}
