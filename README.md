# k8s for Developers - Tech Hour Aug

This demo can be tried out in any k8s cluster. 
You can try it out on 
1. Minikube. 
2. Orielly Sandbox (For quick setup) https://learning.oreilly.com/scenarios/kubernetes-sandbox/9781492062820/


## Demo 1 - Rolling Deployments

Pod creation via imperative commands.
```bash
kubectl run nginx --image=nginx
```

Generating YAML via imperative command.

```bash
kubectl run nginx --image=nginx --dry-run -o yaml > pod.yaml
```

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

## Demo 2 - Service

We are using minikube for demo. Lets expose the nginx deployment on the nodeport.

To get the ip address of the minikube `minikube ip`

```bash
kubectl apply -f ./service/service-nodeport.yaml
```

To see the auto allocated nodePort
```bash
kubectl get svc | grep nginx-service 
kubectl get svc | grep nginx-service | cut -d':' -f 2 | cut -d'/' -f 1
```


```bash
curl http://192.168.64.8:32690/

curl http://$(minikube ip):$(kubectl get services | grep nginx-service | cut -d':' -f 2 | cut -d'/' -f 1)/
```


## Demo 3 - Helm

Helm chart - Test generated Yaml files
```bash
helm template customnginx ./helm/referencechart
```

Install or upgrade helm chart 
```
helm upgrade customnginx ./helm/referencechart --install --wait
```

```
helm upgrade customnginx ./helm/referencechart --install --wait -f ./helm/custom/values.yaml
```