# Node Metrics Collector CronJob

## Overview
This project defines a Kubernetes CronJob that pulls node metrics like CPU, memory, and disk usage from a Node Exporter instance running on the nodes. The metrics are stored in timestamped files.

## Design
- **Metrics Collector Script**: A Bash script that pulls metrics from Prometheus Node Exporter.
- **Dockerfile**: A file to containerize the Bash script.
- **Kubernetes YAML Files**: Definitions for the Persistent Volume (PV), Persistent Volume Claim (PVC), and CronJob.
- **Debug Pod**: A pod definition to access and debug the data stored on the node.
- **Package Manager**: Helm (installed prometheus, metrics server and node exporter)

## Components

1. **metrics-collector.sh**: Bash script that pulls metrics and writes them to a timestamped file.
2. **Dockerfile**: Used to containerize the script.
3. **cronjob-metrics.yaml**: Kubernetes CronJob definition to run the metrics collection every minute.
4. **Persistent Storage**: Can be configured to persist files across pod restarts.

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
   ```

3. Access the debug pod
    ```
    kubectl exec -it debug-pod -- /bin/sh
    cd /mnt/pv
    ls
    ```
