variable "region" {
 description = "This is a variable of type string"
 type        = string
 default     = "us-east-1"
}
variable "access_key" {
 description = "This is a variable of type string"
 type        = string
 default     = "Default string value for this variable"
}
variable "secret_key" {
 description = "This is a variable of type string"
 type        = string
 default     = "Default string value for this variable"
}
variable "token" {
 description = "This is a variable of type string"
 type        = string
 default     = "Default string value for this variable"
}
variable "bucket_name" {
 description = "This is a variable of type string"
 type        = string
 default     = "max-bucket"
}
variable "dynamodb_table" {
 description = "This is a variable of type string"
 type        = string
 default     = "max-iac-locks"
}
variable "vpc_name" {
 description = "This is a variable of type string"
 type        = string
 default     = "vpc-serverless"
}
variable "vpc_cidr" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.0.0/16"
}
variable "availability-zone-a" {
 description = "This is a variable of type string"
 type        = string
 default     = "us-east-1a"
}
variable "availability-zone-b" {
 description = "This is a variable of type string"
 type        = string
 default     = "us-east-1b"
}
variable "availability-zone-c" {
 description = "This is a variable of type string"
 type        = string
 default     = "us-east-1c"
}
variable "public_subnets-a" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.2.0/24"
}
variable "public_subnets-b" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.4.0/24"
}
variable "public_subnets-c" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.6.0/24"
}
variable "private_subnets-a" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.1.0/24"
}
variable "private_subnets-b" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.3.0/24"
}
variable "private_subnets-c" {
 description = "This is a variable of type string"
 type        = string
 default     = "176.24.5.0/24"
}
variable "security_group" {
 description = "This is a variable of type string"
 type        = string
 default     = "vpc-serverless-security-group"
}
variable "cluster_name" {
 description = "This is a variable of type string"
 type        = string
 default     = "max-serverless-cluster"
}
variable "cluster-iam-name" {
 description = "This is a variable of type string"
 type        = string
 default     = "eks-serverless-cluster-iam-role"
}
variable "fargate_role_name" {
 description = "This is a variable of type string"
 type        = string
 default     = "eks-serverless-pod-execution-role"
}
variable "namespace" {
 description = "This is a variable of type string"
 type        = string
 default     = "default"
}