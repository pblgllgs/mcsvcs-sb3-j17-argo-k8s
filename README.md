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

Replace 1-secrets.yml with the new file 1-sealed-secrets.yml

```bash
cd environments/staging/my-app
kubeseal --controller-name sealed-secrets -o yaml -n staging  <1-secrets.yml> 1-sealed-secrets.yml
```

## DELETE OLD FILES IN MINIKUBE

```BASH
minikube ssh
cd /mnt/data
sudo su
rm -drf *
```