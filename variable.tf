variable "RGname" {
    description = "Resource Groups - trying variables"
    default = "AR_RG1"
}
variable "location"{
    description = "locations"
    default = "centralUS"
}

variable "Vnet" {
    description = "Virtual network"
    default = "Vnet-1"
}

variable "prefix" {
    description = "This prefix will use for network.tf only"
    default = "ARnet"
}