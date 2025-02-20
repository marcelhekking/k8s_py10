minikube_start:
	minikube start --driver docker

minikube_stop:
	minikube stop

minikube_apply:
	kubectl apply -f webapp.yaml
	kubectl apply -f postgres-config.yaml
	kubectl apply -f postgres-secret.yaml
	kubectl apply -f postgres.yaml
	kubectl apply -f postgres-volume.yaml
	kubectl apply -f volume_claim.yaml