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
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | The ID of the Kubernetes cluster to which the node pool is associated. | `string` | n/a | yes |
| <a name="input_node_pools"></a> [node\_pools](#input\_node\_pools) | Digitalocean Kubernetes node pools | <pre>map(object({<br>    size        = string<br>    node_count  = number<br>    auto_scale  = bool<br>    min_nodes   = number<br>    max_nodes   = number<br>    node_tags   = list(string)<br>    node_labels = map(string)<br>    node_taint  = map(string)<br>  }))</pre> | `{}` | no |

## Outputs

No outputs.
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
