create-traefik-conf:
	kubectl create secret generic traefik-conf --from-file=traefik.toml --namespace=kube-system

delete-traefik-conf:
	- kubectl delete secret traefik-conf --namespace=kube-system

