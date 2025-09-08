variable "project_id" {
    type = string
    default = "academic-veld-465813-n7"
  
}
variable "region" {
    type = string
    default = "us-central1"
  
}
variable "zone" {
    type = string
    
  
}
variable "vm_name" {
    type = string
    default = "vm-3"

  
}
variable "machine_type" {
    type = string
    default = "e2-small"
  
}
variable "network_name" {
    type = string
    default = "nett"
  
}
variable "cidr_range" {
    type = string
    
  
}
variable "ports" {
    type = list(string)
    
    default = [ "22","80" ]  
}
variable "priority" {
    type = number
    default = 1002
  
}