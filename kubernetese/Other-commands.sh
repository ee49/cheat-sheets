#command to test if the service is up
for i in {1..35}; do
   kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/info 2>&1` && echo "$test OK" || echo "Failed"';
   echo ""
done

#sample output from app: Hello, Application Version: v1 ; Color: blue OK


#Kubernetese commands:
kubectl replace -f <yaml file> # if we want to modify and apply changesto the replicaset.
kubectl scale --replicas=6 -f replicaset-definition.yaml # to scale existing replicaset.
kubectl scalse --replicas=6 replicaset <rs name> # to scale on the fly using replicaset Name. This change will not be saved
kubectl expose pod redis --port=6379 --name redis-service --dry-run=client -o yaml
or kubectl create service clusterip redis --tcp=6379:6379 --dry-run=client -o yaml
kubectl create -f deployment-definition.yml
kubectl get deployments
kubectl apply -f deplyment-definition.yml // kubectl set image deployment/myapp-deployment nginx=nginx:1.9,1
kubectl rollout status deployment/myapp-deploymet
kubectl rollout history deployment/mapp-deployment
kubectl rollout undo deployment/<deployment name>
kubectl describe deployment <deployment name>


#Tip:
kubectl [command] [TYPE] [NAME] -o <output_format>

Here are some of the commonly used formats:


-o jsonOutput a JSON formatted API object.
-o namePrint only the resource name and nothing else.
-o wideOutput in the plain-text format with any additional information.y6tt
-o yamlOutput a YAML formatted API object.

#Examples:
master $ kubectl get pods -o wide  
master $ kubectl create namespace test-123 --dry-run -o json
{
    "kind": "Namespace",
    "apiVersion": "v1",
    "metadata": {
        "name": "test-123",
        "creationTimestamp": null
    },
    "spec": {},
    "status": {}
}
master $ kubectl create namespace test-123 --dry-run -o yaml
apiVersion: v1
kind: Namespace
metadata:
  creationTimestamp: null
  name: test-123
spec: {}
status: {}


k run redis --image=redis:alpine --labels="tier=db" --dry-run=client -o yaml # to create yaml file quickly

#Namespace commands:
kubectl get pods --namespace=dev
kubectl config set-context $(kubectl config current-context) --namespace=<existing namespace> # to set/change the namespace
kubectl get pods --namespace=default
kubectl get pods --all-nampespaces

#configmap Sample:
spec:
  containers:
    - envFrom:
      - configMapRef: 
          name: webapp-config-map  #configmap name
      image: kodekloud/webapp-color


#multicontainer-example.yml
apiVersion: v1
kind: Pod
metadata:
  labels:
    run: yellow
  name: yellow
spec:
  containers:
  - image: busybox
    name: lemon
    command: ["sleep", "1000"]
  - image: redis
    name: gold

#log into individual container:
k exec -it podname --container main-app -- /bin/bash
k log podname # this will print logs from the concerened pods.


#Liveness and Readiness:
#test script:
for i in {1..20}; do
   kubectl exec --namespace=kube-public curl -- sh -c 'test=`wget -qO- -T 2  http://webapp-service.default.svc.cluster.local:8080/ready 2>&1` && echo "$test OK" || echo "Failed"';
   echo ""
done

