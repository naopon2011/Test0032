################################################################################
# AWSの変数定義
################################################################################
variable "aws_region" {
  type        = string
  description = "AWSのリージョン"
  default     = "us-east-1"
}

variable "aws_vpc_name" {
  description = "VPCの名前"
  type        = string
}

variable "aws_vpc_cidr" {
  description = "VPCで使用するアドレス帯"
  type        = string
  default     = "10.0.0.0/16"
}

variable "aws_pub_subnet_cidr" {
  description = "AWSのパブリックサブネットで使用するアドレス帯"
  type        = string
  default     = "10.0.0.0/24"
}

variable "aws_pri1_subnet_cidr" {
  description = "AWSのプライベートサブネット１で使用するアドレス帯"
  type        = string
  default     = "10.0.1.0/24"
}

variable "aws_pri2_subnet_cidr" {
  description = "AWSのプライベートサブネット2で使用するアドレス帯"
  type        = string
  default     = "10.0.2.0/24"
}

variable "aws_az1_name" {
  description = "Availability zone"
  type        = string
  default     = "ap-northeast-1a"
}

variable "aws_instance_key" {
  description = "インスタンス接続用のシークレットキー名"
  type        = string
}

variable "aws_win_ami" {
  description = "Windowsのami"
  type        = string
  default     = "ami-06323ff1c3178cee1"
}

variable "aws_win_instance_type" {
  description = "Windowsのinstance type"
  type        = string
  default     = "t3.medium"
}

variable "aws_ac_ami" {
  description = "App Connectorのami"
  type        = string
  default     = "ami-05b60713705a935c2"
}

variable "aws_ac_instance_type" {
  description = "App Connectorのinstance type"
  type        = string
  default     = "t3.medium"
}

variable "aws_cc_ami" {
  description = "Cloud Connectorのami"
  type        = string
  default     = "ami-09db530e8a9188750"
}

variable "aws_cc_instance_type" {
  description = "Cloud Connectorのinstance type"
  type        = string
  default     = "t3.medium"
}

variable "aws_ac_provision_key" {
  description = "AWS App Connector用のProvisioning Key"
  type        = string
}
################################################################################
# ZPAの変数定義
################################################################################
variable "zpa_client_id" {
  type        = string
  description = "Zscaler Private Access Client ID"
  sensitive   = true
}

variable "zpa_client_secret" {
  type        = string
  description = "Zscaler Private Access Secret ID"
  sensitive   = true
}

variable "zpa_customer_id" {
  type        = string
  description = "Zscaler Private Access Tenant ID"
}

variable "aws_ac_group" {
  type        = string
  description = "AWS用のApp Connector Groupの名前"
}

variable "name_prefix" {
  type        = string
  description = "The name prefix for all your resources"
  default     = "zscc"
  validation {
    condition     = length(var.name_prefix) <= 12
    error_message = "Variable name_prefix must be 12 or less characters."
  }
}

variable "cc_callhome_enabled" {
  type        = bool
  description = "determine whether or not to create the cc-callhome-policy IAM Policy and attach it to the CC IAM Role"
  default     = true
}

variable "cc_vm_prov_url" {
  type        = string
  description = "Zscaler Cloud Connector Provisioning URL"
}

variable "aws_secret_name" {
  type        = string
  description = "AWS Secrets Manager Secret Name for Cloud Connector provisioning"
}

variable "http_probe_port" {
  type        = number
  description = "Port number for Cloud Connector cloud init to enable listener port for HTTP probe from GWLB Target Group"
  default     = 50000
  validation {
    condition = (
      tonumber(var.http_probe_port) == 80 ||
      (tonumber(var.http_probe_port) >= 1024 && tonumber(var.http_probe_port) <= 65535)
    )
    error_message = "Input http_probe_port must be set to a single value of 80 or any number between 1024-65535."
  }
}
