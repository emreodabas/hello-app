
## K8s Resources

### Machine Types -- Selected from AWS EC2 instances

1- a1.medium for default  1vCPU     2 GiB
2- t2.nano for minimal    1vCPU     0.5 GiB
3- the lowest 			  0.25vCPU 	256 MiB

### Applications

* Spring (emreodabas/hello-app-spring-boot)
  * redis-zulu11
* Micronaut
* Quarkus
* Golang (emreodabas/hello-app-golang)
* NodeJS (emreodabas/hello-app-nodejs)


 All applications' resource yaml defined in related folder

### Imperative kubectl commands

  !!Check all-commands file for all instances.

 `kubectl apply -R -f spring`

#### Create Deploy && Services && Limits

`kubectl create deploy redis-zulu13 -n spring  --image=emreodabas/hello-app-spring-boot:redis-zulu13`

 `kubectl expose deploy redis-zulu13 -n spring --port 8080 --type=NodePort`

`kubectl set resources deploy redis-zulu13 -n spring  --limits=cpu=1,memory="2Gi" --requests=cpu=1,memory="2Gi"`

#### Patch Resource Requests && Limits

 ##### _a1.medium patch_
 
` kubectl patch deploy redis-zulu13 -n spring       \
-p='[{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/cpu", "value": "1"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/memory", "value": "2Gi"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/cpu", "value": "1"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/memory", "value": "2Gi"}]'`


 ##### _t2.nano patch_
 
` kubectl patch deploy redis-zulu13 -n spring       \
-p='[{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/cpu", "value": "1"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/memory", "value": "0.5Gi"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/cpu", "value": "1"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/memory", "value": "0.5Gi"}]'
`

 ##### _the lowest patch_
 
` kubectl patch deploy redis-zulu13 -n spring       \
-p='[{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/cpu", "value": "0.5"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/requests/memory", "value": "256Mi"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/cpu", "value": "0.5"}] \
    [{"op": "replace", "path": "/spec/template/spec/containers/0/resources/limits/memory", "value": "256Mi"}]'
`
