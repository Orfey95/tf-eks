# Deploy EKS cluster with Terraform

Description of infrastructure:
- One VPC with two public subnets;
- EKS cluster with one worker node.

After deploying the infrastructure, the Kubernetes configuration follows:
- Creating one Namespace;
- Creating one service (LoadBalancer type);
- Creating one pod with Nginx application.

Output parameters:
- cluster_id - EKS cluster ID;
- cluster_endpoint - Endpoint for EKS control plane;
- kubectl_config - kubectl config for cluster access.

How to use:
1) Clone this repository;
2) Run `terraform init`;
3) Run `terraform apply`;
4) After completing the deployment of the infrastructure, you will receive a kubeconfig for authorization in the cluster;
5) Go to the cluster and look at the service address for the deployed application;
6) Open the service address with port 8080 in your browser.

![nginx](/images/nginx.png)

