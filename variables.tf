variable "domain_name" {
    description = "The domain name of the parent zone."
    type        = string
}

variable "subdomain_name" {
    description = "The subdomain name to delegate to the child zone."
    type        = string
}

variable "name_servers" {
    description = "The name servers of the child zone."
    type        = list(string)
}
  
