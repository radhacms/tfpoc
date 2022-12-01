# tf - terraform project to create VPC and WEBSERVER. It contains two module networking , webserver

Networking module creates 

- 1 Private VPC in us-west-2
- 1 Public and 1 Private Subnet in us-west-2a avaialability zone
- 1 NAT Gateway
- 1 Internet Gateway
- 1 Elastic IP for the internet gateway

Web server module creates
- apache httpd2 webserver listens on 80 in above public subnet

How to use it ?
- clone this git repo
- Setup your aws credential using
```
export ENVIRONMENT=pocenv
export AWS_ACCESS_KEY_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_DEFAULT_REGION=
cd $PWD/tf/stages/$ENVIRONMENT/

```
- Run terraform commands

```
cd $PWD/tf/stages/$ENVIRONMENT/
terraform init
terraform plan
terraform apply --auto-approve

```
- Test in browser using public ip of webserver instance

4. To delete created resources

```
cd $PWD/tf/stages/$ENVIRONMENT/
terraform destroy
```
 
## TODO ( as best parctice )

* dynamic ami id lookup based on region using map and filter function
* loop ingress using dynamic foreach. currently it is hardcoded
* we can also use workspace for maintaining different environments.
* remote state file and dynamodb lock.

# k8s - kubernetes project to create deployment whioch uses RDS

### Prerequisties
- "aws_rds_cluster"(aurora_cluster),"aws_rds_cluster_instance", "aws_db_subnet_group", "aws_security_group", "aws_db_parameter_group", "aws_rds_cluster_parameter_group", "aws_security_group", engine is created via terraform.
- Create RDS Database
- Create DB Security Group
- Create DB Subnet Group in RDS
- Create RDS Database

### configure k8s yaml with proper values.
- external names in k8s/mysql-service-external.yaml
- k8s/secret.yaml
- k8s/deployment.yaml

### apply k8s manifests
- kubectl apply -f k8s

### test by changing service as LoadBalancer type.


