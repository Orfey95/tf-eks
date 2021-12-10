provider "kubernetes" {
  host                   = data.aws_eks_cluster.cluster.endpoint
  token                  = data.aws_eks_cluster_auth.cluster.token
  cluster_ca_certificate = base64decode(data.aws_eks_cluster.cluster.certificate_authority.0.data)
}

module "namespace" {
  source = "terraform-module/namespace/kubernetes"

  name        = "server"
  description = "server-namespace"
}

resource "kubernetes_service" "app" {
  metadata {
    name      = "app-service"
    namespace = "server"
  }
  spec {
    selector = {
      app = kubernetes_pod.nginx_pod.metadata.0.labels.app
    }
    port {
      port        = 8080
      target_port = 80
    }

    type = "LoadBalancer"
  }

  depends_on = [
    module.namespace,
  ]
}

resource "kubernetes_pod" "nginx_pod" {
  metadata {
    name      = "app-pod"
    namespace = "server"
    labels = {
      app = "app"
    }
  }

  spec {
    container {
      image = "nginx:1.7.9"
      name  = "app"
    }
  }

  depends_on = [
    module.namespace,
  ]
}
