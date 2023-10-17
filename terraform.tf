# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}

# Configure the OpenStack Provider
provider "openstack" {
  user_name   = "Ashish.Godse"
  tenant_name = "Ashish.Godse"
  password    = "pwd"
  auth_url    = "https://preprod.jpe2b.jaws.jio.com:13000"
  region      = "RegionOne"
}

provider "openstack" {
  user_name   = var.os_username
  tenant_name = var.os_project_name
  password    = var.os_password_input
  auth_url    = var.os_auth_url
  region      = var.os_region_name
}


# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
    name            = "basic"
    image_id        = "ad091b52-742f-469e-8f3c-fd81cadf0743"
    flavor_id       = "3"
    # key_pair        = "my_key_pair_name"
    security_groups = ["default"]

    metadata = {
      this = "that"
    }

    network {
      name = "my_network"
    }
  
}

########################################

# Define required providers
terraform {
required_version = ">= 0.14.0"
  required_providers {
    openstack = {
      source  = "terraform-provider-openstack/openstack"
      version = "~> 1.51.1"
    }
  }
}




# Create a web server
resource "openstack_compute_instance_v2" "test-server" {
    name            = "basic"
    image_id        = "98aaf2f8-f0e0-45ca-955b-54cf498aa610"
    flavor_id       = "2"
    # key_pair        = "my_key_pair_name"
    security_groups = ["default"]

    metadata = {
    this = "that"
    }

    network {
    name = "my_network"
    }
  
}

resource "openstack_networking_network_v2" "terraform" {
  name           = "terraform"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "terraform" {
  name            = "terraform"
  network_id      = "${openstack_networking_network_v2.terraform.id}"
  cidr            = "10.0.0.0/24"
  ip_version      = 4
  dns_nameservers = ["8.8.8.8", "8.8.4.4"]
}

resource "openstack_networking_router_v2" "terraform" {
  name                = "terraform"
  admin_state_up      = "true"
  external_network_id = "${data.openstack_networking_network_v2.terraform.id}"
}

resource "openstack_networking_router_interface_v2" "terraform" {
  router_id = "${openstack_networking_router_v2.terraform.id}"
  subnet_id = "${openstack_networking_subnet_v2.terraform.id}"
}



# terraform-provider-openstack/openstack
# terraform.local/local/openstack