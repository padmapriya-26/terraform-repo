resource "google_compute_instance" "myvm" {
    name = var.vm_name
    machine_type = var.machine_type
    zone = var.zone
    boot_disk {
      initialize_params {
        image = "projects/academic-veld-465813-n7/global/images/image-1"
      }
    }
    network_interface {
      subnetwork = google_compute_subnetwork.tf_subnet.id
      access_config {
        
      }
    }
    tags = [
        tolist (google_compute_firewall.tf_ssh.target_tags)[0],
        tolist (google_compute_firewall.tf_http.target_tags)[0]
    ]
  
}