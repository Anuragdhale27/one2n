# Node Metrics Collector CronJob

## Overview
This project defines a Kubernetes CronJob that pulls node metrics like CPU, memory, and disk usage from a Node Exporter instance running on the nodes. The metrics are stored in timestamped files.

## Design
- **Package Manager**: Helm (to install prometheus, metrics server and node exporter)
- **Metrics Collector Script**: A Bash script that pulls metrics from Prometheus Node Exporter and writes them to a timestamped file.
- **Dockerfile**: A file to containerize the Bash script.
- **Kubernetes YAML Files**: Kubernetes CronJob definition to run the metrics collection every minute. The Persistent Volume (PV) and Persistent Volume Claim (PVC) to persist files across pod restarts.
- **Debug Pod**: A pod definition to access and debug the data stored on the node.

## Deployment

1. Build and push the Docker image:
   ```
   docker build -t 27300627/metrics-collector .
   ```
   ``` 
   docker push 27300627/metrics-collector
   ```

2. Deploy the Kubernetes object
   ```
   kubectl apply -f cronjob.yaml
   kubectl apply -f pv.yaml
   kubectl apply -f pvc.yaml
   kubectl apply -f debug-pod.yaml
   ```

3. Access the debug pod
    ```
    kubectl exec -it debug-pod -- /bin/sh
    cd /mnt/pv
    ls
    ```
