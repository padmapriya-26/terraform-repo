#vpc resource
#gcloud compute networks create networkname --subnet-mode=custom
resource "google_compute_network" "tf_vpc" {
    name = var.network_name
    auto_create_subnetworks   = false
    description = "creating a vpc through terraform"
}
#create a subnet resource
#gcloud compute networks subnet create subnetname
#region,range,network name
resource "google_compute_subnetwork" "tf_subnet" {
    name = "i27-subnet"
    network = google_compute_network.tf_vpc.id
    region = "us-central1"
    ip_cidr_range = var.cidr_range
}
#firewall creation
#name,network,direction(ingress/engress ),allow/deny,port allow,source,target-tags  
resource "google_compute_firewall" "tf_ssh" {
    name = "i27-allow-ssh"
    direction = "INGRESS"
    network = google_compute_network.tf_vpc.id

    allow {
        ports = var.ports
        protocol = "tcp"
    }
    priority = var.priority
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["i27-ssh-nw-tags"]

}
resource "google_compute_firewall" "tf_http" {
     name = "i27-allow-http"
    network = google_compute_network.tf_vpc.name

    allow {
        protocol = "tcp"
        ports = ["80"]
        
    }
    priority = 1001
    source_ranges = ["0.0.0.0/0"]
    target_tags = ["i27-http-nw-tags"]
    direction = "INGRESS"

}
