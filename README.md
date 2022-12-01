# tfpoc - terraform project to create VPC and WEBSERVER. It contains two module networking , webserver

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
cd $PWD/stages/$ENVIRONMENT/

```
- Run terraform commands

```
terraform init
terraform plan
terraform apply --auto-approve

```
#TODO ( as best parctice )

* dynamic ami id lookup based on region using map and filter function
* loop ingress using dynamic foreach. currently it is hardcoded
* we can also use workspace for maintaining different environments.
* remote state file and dynamodb lock.
