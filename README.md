# ARGOCD EXAMPLES

INSTALL TOOLS MINIKUBE, KUBECTL, ARGOCDCLI, TERRAFORM

## INIT K8S CLUSTER

```BASH
minikube start --driver=docker --memory=6g --cpus=2 --disk-size "10GB" --kubernetes-version=1.28.2
```

## INSTALL ARGOCD IN K8S WITH TERRAFORM

```BASH
cd terraform
terraform init
terraform apply --auto-approve
terraform destroy --auto-approve
```

## EXPOSE ARGOCD UI

```BASH
kubectl port-forward svc/argocd-server -n argocd 8080:80
argocd admin initial-password -n argocd
```

## APP

```BASH
cd environments/staging/my-app
kubectl apply -f application.yaml
kubectl delete -f application.yaml
```

## KUBESEAL SECRET

Generate secrets

```bash
./sealed-secrets.sh
```

## DELETE OLD FILES IN MINIKUBE

```BASH
minikube ssh
cd /mnt/data
sudo su
rm -drf *
```

## EXPOSE ENDPOINTS

### API-GATEWAY

<http://localhost:8888>

```bash
kubectl port-forward svc/api-gateway -n default 8888:8080
```

## OTHER ENDPOINTS

```bash
kubectl port-forward svc/api-gateway -n default 32080:8080
kubectl port-forward svc/albums -n default 32002:8080
kubectl port-forward svc/mysql -n default 3306:3306
kubectl port-forward svc/zipkin -n default 9411:9411
kubectl port-forward svc/postgres -n default 5432:5432
```
