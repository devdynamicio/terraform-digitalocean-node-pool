# Digitalocean Kubernetes node pools Terraform module

Terraform Module for create node pools in [DigitalOcean Kubernetes](https://www.digitalocean.com/products/kubernetes) service.

[![SWUbanner](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/banner2-direct.svg)](https://github.com/vshymanskyy/StandWithUkraine/blob/main/docs/README.md)

## Requirements

This module requires Terraform version `0.13.0` or newer.

## Examples

```hcl
module "kubernetes" {
  source             = "../../"
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
```

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.0 |
| <a name="requirement_digitalocean"></a> [digitalocean](#requirement\_digitalocean) | >= 2.19.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_digitalocean"></a> [digitalocean](#provider\_digitalocean) | >= 2.19.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [digitalocean_kubernetes_node_pool.this](https://registry.terraform.io/providers/digitalocean/digitalocean/latest/docs/resources/kubernetes_node_pool) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_auto_scale"></a> [auto\_scale](#input\_auto\_scale) | Enable auto-scaling of the number of nodes in the node pool within the given min/max range. | `bool` | `false` | no |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the Kubernetes cluster to which the node pool is associated. | `string` | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A map of key/value pairs to apply to nodes in the pool. The labels are exposed in the Kubernetes API as labels in the metadata of the corresponding Node resources. | `map(string)` | `null` | no |
| <a name="input_max_nodes"></a> [max\_nodes](#input\_max\_nodes) | If auto-scaling is enabled, this represents the maximum number of nodes that the node pool can be scaled up to. | `number` | `null` | no |
| <a name="input_min_nodes"></a> [min\_nodes](#input\_min\_nodes) | If auto-scaling is enabled, this represents the minimum number of nodes that the node pool can be scaled down to. | `number` | `null` | no |
| <a name="input_name"></a> [name](#input\_name) | A name for the node pool. | `string` | n/a | yes |
| <a name="input_node_count"></a> [node\_count](#input\_node\_count) | The number of Droplet instances in the node pool. If auto-scaling is enabled, this should only be set if the desired result is to explicitly reset the number of nodes to this value. If auto-scaling is enabled, and the node count is outside of the given min/max range, it will use the min nodes value. | `number` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | The slug identifier for the type of Droplet to be used as workers in the node pool. | `string` | n/a | yes |
| <a name="input_tags"></a> [tags](#input\_tags) | A list of tag names to be applied to the Kubernetes cluster. | `set(string)` | `null` | no |
| <a name="input_taint"></a> [taint](#input\_taint) | A list of taints applied to all nodes in the pool. | <pre>set(object(<br>    {<br>      effect = string<br>      key    = string<br>      value  = string<br>    }<br>  ))</pre> | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_actual_node_count"></a> [actual\_node\_count](#output\_actual\_node\_count) | A computed field representing the actual number of nodes in the node pool, which is especially useful when auto-scaling is enabled. |
| <a name="output_id"></a> [id](#output\_id) | A unique ID that can be used to identify and reference the node pool. |
| <a name="output_nodes"></a> [nodes](#output\_nodes) | A list of nodes in the pool. Each node exports the following attributes: |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
