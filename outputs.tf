output "actual_node_count" {
  description = "A computed field representing the actual number of nodes in the node pool, which is especially useful when auto-scaling is enabled."
  value       = digitalocean_kubernetes_node_pool.this.actual_node_count
}

output "id" {
  description = "A unique ID that can be used to identify and reference the node pool."
  value       = digitalocean_kubernetes_node_pool.this.id
}

output "nodes" {
  description = "A list of nodes in the pool. Each node exports the following attributes:"
  value       = digitalocean_kubernetes_node_pool.this.nodes
}
