# Copyright IBM Corp. 2014, 2026

variable "prefix" {
  type = string
}

variable "instances" {
  type = number
}

variable "delay_time" {
  type = string
}

required_providers {
  random = {
    source  = "hashicorp/random"
    version = "~> 3.5.1"
  }

  null = {
    source  = "hashicorp/null"
    version = "~> 3.2.2"
  }

  time = {
    source = "hashicorp/time"
    version = "~> 0.14.1"
  }
}

provider "random" "this" {}
provider "null" "this" {}
provider "time" "this" {}

component "pet" {
  source = "./pet"

  inputs = {
    prefix = var.prefix
  }

  providers = {
    random = provider.random.this
  }
}

component "delay_gate" {
  source = "./delay"

  inputs = {
    trigger = component.pet.name
  }

  providers = {
    time = provider.time.this
  }
}

component "nulls" {
  source = "./nulls"

  inputs = {
    pet       = component.pet.name
    instances = var.instances
    delay_dependency = component.delay_gate.ready
  }

  providers = {
    null = provider.null.this
  }
}
