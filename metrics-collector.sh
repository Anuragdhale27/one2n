timestamp=$(date +"%Y%m%d%H%M%S")
output_file="/metrics/node_metrics_$timestamp.txt"

curl -s http://10.0.132.104:9100/metrics | grep -E 'node_cpu_seconds_total|node_memory_Mem|node_filesystem_size' > $output_file

echo "Metrics collected and stored in $output_file"
