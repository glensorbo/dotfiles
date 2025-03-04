---
id: kubectl
aliases:
  - kubernetes
tags:
  - k8s
  - kubernetes
---

# Kubernetes

<!--toc:start-->

- [Kubernetes](#kubernetes)
  - [To get pods](#to-get-pods)
  - [To get services](#to-get-services)
  - [To get events / logs / warnings](#to-get-events-logs-warnings)
  - [To get persistence volumes](#to-get-persistence-volumes)
  <!--toc:end-->

## To get pods

```bash
kubectl get pods
```

```shell
NAME                     READY   STATUS    RESTARTS   AGE
api-6b4c48cc7b-rkb55     1/1     Running   0          18h
cdf-744b48f495-h9pwj     1/1     Running   0          105m
mssql-6448846cb-db69m    1/1     Running   0          20h
nginx-58dfb69b75-d9vcr   1/1     Running   0          6m1s
```

## To get services

```bash
kubectl get services
```

```shell
NAME            TYPE        CLUSTER-IP    EXTERNAL-IP   PORT(S)    AGE
api             ClusterIP   10.0.4.4      <none>        8080/TCP   20h
cdf-service     ClusterIP   10.0.39.135   <none>        8081/TCP   104m
mssql           ClusterIP   10.0.181.37   <none>        1433/TCP   20h
nginx-service   ClusterIP   10.0.198.13   <none>        8080/TCP   20h
```

## To get events / logs / warnings

```bash
kubectl events --types=Warning
```

## To get persistence volumes

```bash
kubectl get pvc
```

```shell
NAME        STATUS   VOLUME     CAPACITY   ACCESS MODES   STORAGECLASS                 VOLUMEATTRIBUTESCLASS   AGE
matomo      Bound    pvc-<id>   1Gi        RWO            managed-csi-premium-retain   <unset>                 2d18h
matomo-db   Bound    pvc-<id>   5Gi        RWO            managed-csi-premium-retain   <unset>                 2d18h
```
