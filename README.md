# zeebe-metrics-test

This repository just demonstrates the usage of [grafana](https://grafana.com/) dashboards using [prometheus](https://prometheus.io/) metrics from a [zeebe](https://zeebe.io/) cluster as datasource.

It provisions the following services through a [docker-compose file](./docker-compose.yml):

- zeebe cluster consisting of a single node
- [hazelcast](https://hazelcast.com/) exporter as middleware for connecting further exporters to the zeebe cluster
- [simple-monitor](https://github.com/zeebe-io/zeebe-simple-monitor) app as an UI to operate with the zeebe cluster
- prometheus service reading the metrics from the zeebe cluster
- grafana service using prometheus as datasource with dashboards already [provisioned](./grafana/provisioning)
- [provisioning zeebe](./zeebe-provision), creating a test workflow definition and creating instances every 10s
- [script-worker](https://github.com/zeebe-io/zeebe-script-worker) for executing tasks of type `script`
- [http-worker](https://github.com/zeebe-io/zeebe-http-worker) for exectuting tasks of type `http`

## Usage

```
docker-compose build
```

followed by 

```
docker-compose up
```

When all of the services are ready, the corresponding UIs can be accessed at:
- Grafana: http://localhost:3000
- Zeebe Simple Monitor: http://localhost:8082
- Prometheus metrics: http://localhost:9600/metrics
- Health check workers: http://localhost:8080/actuator/health and http://localhost:8081/actuator/health