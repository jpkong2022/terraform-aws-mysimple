output "internal_availability_zone" {
  value = data.aws_availability_zones.available.names[0]
}

output "cloud_instance_id" {
  value = data.aws_instance.default.id
  }

output "availability_zone" {
  value = data.aws_instance.default.availability_zone
  }
  
output "cloud_private_dns_name" {
  value = data.aws_instance.default.private_dns
  }
  
output "disk_size" {
  value = var.volume_size
  }
  
output "public_ip_address" {
  value = data.aws_instance.default.public_ip
  }

output "instance_type" {
  value = var.instance_type
  } 

output "key_pair" {
  value = var.key_pair
  } 

output "mac_address" {
  value = data.aws_network_interface.default.mac_address
  }
 
output "power_state" {
  value =data.aws_instance.default.instance_state
  }

output "primary_dns_name" {
  value = data.aws_instance.default.public_dns
  }

output "public_dns_name" {
  value = data.aws_instance.default.public_dns
  }

output "hostname" {
  value = data.aws_instance.default.public_dns
  }

output "private_ip_address" {
  value = data.aws_instance.default.private_ip
  }
 
output "region" {
  value = var.region
  }
 
output "subnet_id" {
  value = var.subnet_id
  }

output "type_of_os_image" {
  value = var.instance_type
  }

output "vpc_id" {
  value = var.vpc_id
  }

output "network_interface_id" {
  value = data.aws_instance.default.network_interface_id
  }

output "volume_id" {
  value = data.aws_instance.default.ebs_block_device.*.volume_id
  }
