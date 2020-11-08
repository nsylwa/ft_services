minikube stop
minikube delete
minikube start --vm-driver=virtualbox
eval $(minikube docker-env)

# BUILD IMAGES  
docker build -t nginx_img srcs/nginx
#docker build -t wordpress_img srcs/wordpress

minikube addons enable metallb


# APPLY SERVICES
kubectl apply -f ./srcs/nginx/nginx.yaml
#kubectl apply -f ./srcs/wordpress/wordpress.yaml
kubectl apply -f ./srcs/configmap.yaml


minikube dashboard
