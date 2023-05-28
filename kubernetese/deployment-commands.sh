master $ kubectl create deployment nginx --image=nginx:1.16
deployment.apps/nginx created
 
master $ kubectl rollout status deployment nginx
Waiting for deployment "nginx" rollout to finish: 0 of 1 updated replicas are available...
deployment "nginx" successfully rolled out
 
master $
 
 
master $ kubectl rollout history deployment nginx
deployment.extensions/nginx
REVISION CHANGE-CAUSE
1     <none>
 
master $

#revision flag
master $ kubectl rollout history deployment nginx --revision=1
--deployment.extensions/nginx with revision #1
 
 #record flag
 master $ kubectl set image deployment nginx nginx=nginx:1.17 --record
 master $ kubectl rollout history deployment nginx 
 deployment.extensions/nginx
 
 master $ kubectl edit deployments. nginx --record
 master $ kubectl rollout history deployment nginx
 master $ kubectl rollout history deployment nginx --revision=3
 
 #undo
 controlplane $ kubectl rollout history deployment nginx
 controlplane $ kubectl rollout history deployment nginx --revision=3
 controlplane $ kubectl rollout undo deployment nginx --to-revision=1 # rollback to specific revision 
