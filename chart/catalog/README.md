# refarch-cloudnative-micro-catalog: Spring Boot Microservice with Elasticsearch Database

## Introduction
This chart will deploy a Spring Boot Application with a Elasticsearch database onto a Kubernetes Cluster. It will also deploy the Inventory Application along with its MySQL database.

![Application Architecture](https://raw.githubusercontent.com/ibm-cloud-architecture/refarch-cloudnative-micro-catalog/master/static/catalog.png?raw=true)

Here is an overview of the chart's features:
- Leverage [`Spring Boot`](https://projects.spring.io/spring-boot/) framework to build a Microservices application.
- Uses [`Spring Data JPA`](http://projects.spring.io/spring-data-jpa/) to persist data to Elasticsearch database.
- Uses [`Elasticsearch`](https://www.mysql.com/) as the catalog database.
- Uses [`Docker`](https://docs.docker.com/) to package application binary and its dependencies.
- Uses [`Helm`](https://helm.sh/) to package application and Elasticsearch deployment configuration and deploy to a [`Kubernetes`](https://kubernetes.io/) cluster. 

## Chart Source
The source for the `Catalog` chart can be found at:
* https://github.com/ibm-cloud-architecture/refarch-cloudnative-micro-catalog/tree/master/chart/catalog

The source for the `Elasticsearch` chart can be found at:
* https://github.com/helm/charts/tree/master/incubator/elasticsearch

The source for the `Inventory` chart can be found at:
* https://github.com/ibm-cloud-architecture/refarch-cloudnative-micro-inventory/tree/master/chart/inventory

The source for the `MySQL` chart can be found at:
* https://github.com/helm/charts/tree/master/stable/mysql

Lastly, the source for the `alexeiled/curl` Docker Image can be found at:
* https://github.com/alexei-led/curl

## APIs
* Get all items in catalog:
    + `http://${WORKER_NODE_IP}:${NODE_PORT}/micro/items`

## Deploy Catalog Application to Kubernetes Cluster from CLI
To deploy the Catalog Chart and its Elasticsearch dependency Chart to a Kubernetes cluster using Helm CLI, follow the instructions below:
```bash
# Clone catalog repository:
$ git clone http://github.com/refarch-cloudnative-micro-catalog.git

# Go to Chart Directory
$ cd refarch-cloudnative-micro-catalog/chart/catalog

# Download Elasticsearch Dependency Chart
$ helm repo add incubator http://storage.googleapis.com/kubernetes-charts-incubator
$ helm repo add ibmcase-charts https://raw.githubusercontent.com/ibm-cloud-architecture/refarch-cloudnative-kubernetes/master/docs/charts
$ helm dependency update

# Deploy Catalog and Elasticsearch to Kubernetes cluster
$ helm upgrade --install catalog --set service.type=NodePort .
```