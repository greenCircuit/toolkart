variable "vm_name" {
  type        = string 
  description = "vm name"
}

variable "iso" {
  type        = string 
  description = "iso to boot"
}

variable "cpu_count" {
  type        = number 
  description = "number of cpu to use"
}

variable "mem_size" {
  type        = number 
  description = "ram"
}

variable "disk_size" {
    type      = string
}

