# Create namespace apps
 kubectl create ns apps
# Install nginx ingress controller:
 kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.5.1/deploy/static/provider/cloud/deploy.yaml