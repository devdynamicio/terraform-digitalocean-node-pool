variable "auto_scale" {
  description = "Enable auto-scaling of the number of nodes in the node pool within the given min/max range."
  type        = bool
  default     = false
}

variable "cluster_id" {
  description = "The ID of the Kubernetes cluster to which the node pool is associated."
  type        = string
}

variable "labels" {
  description = "A map of key/value pairs to apply to nodes in the pool. The labels are exposed in the Kubernetes API as labels in the metadata of the corresponding Node resources."
  type        = map(string)
  default     = null
}

variable "max_nodes" {
  description = "If auto-scaling is enabled, this represents the maximum number of nodes that the node pool can be scaled up to."
  type        = number
  default     = null
}

variable "min_nodes" {
  description = "If auto-scaling is enabled, this represents the minimum number of nodes that the node pool can be scaled down to."
  type        = number
  default     = null
}

variable "name" {
  description = "A name for the node pool."
  type        = string
}

variable "node_count" {
  description = "The number of Droplet instances in the node pool. If auto-scaling is enabled, this should only be set if the desired result is to explicitly reset the number of nodes to this value. If auto-scaling is enabled, and the node count is outside of the given min/max range, it will use the min nodes value."
  type        = number
  default     = null
}

variable "size" {
  description = "The slug identifier for the type of Droplet to be used as workers in the node pool."
  type        = string
}

variable "tags" {
  description = "A list of tag names to be applied to the Kubernetes cluster."
  type        = set(string)
  default     = null
}

variable "taint" {
  description = "A list of taints applied to all nodes in the pool."
  type = set(object(
    {
      effect = string
      key    = string
      value  = string
    }
  ))
  default = []
}
