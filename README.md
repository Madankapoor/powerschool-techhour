# k8s for Developers - Tech Hour Aug

This demo can be tried out in any k8s cluster. 
You can try it out on 
1. Minikube. 
2. Orielly Sandbox (For quick setup) https://learning.oreilly.com/scenarios/kubernetes-sandbox/9781492062820/


## Demo 1 

Rolling Deployments Demo

To do a recorded deployment
```bash
kubectl apply -f ./rollingdeployment/deployment-latest.yaml --record 
```

To check the status of the deployment 
```bash
kubectl rollout status deployment/nginx-deployment 
```

To check the history of deployments
```bash
kubectl rollout history  deployment/nginx-deployment 
```

To revert to previous deployment
```bash 
kubectl rollout undo  deployment/nginx-deployment 
```

## Demo 2 

