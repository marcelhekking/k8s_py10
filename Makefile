start:
	minikube start --driver docker

stop:
	minikube stop

postgres_volumes:
	kubectl apply -f postgres-secret.yaml
	kubectl apply -f postgres-volume.yaml
	kubectl apply -f volume_claim.yaml

postgres:
	kubectl apply -f postgres.yaml

webapp:
	kubectl apply -f webapp.yaml

delete_postgres_volumes:
	kubectl delete pvc postgres-pvc
	kubectl delete pv postgres-pv

delete_services:
	kubectl delete service webapp-service
	kubectl delete service postgres-service

delete_deployments:
	kubectl delete deployment webapp-deployment
	kubectl delete deployment postgres-deployment

clean_all:
	kubectl delete all --all
	minikube stop
	minikube delete
