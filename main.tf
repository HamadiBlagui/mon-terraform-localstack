resource "local_file" "mon_succes" {
  filename = "${path.module}/felicitations.txt"
  content  = "Bravo Hamadi ! Tu as surmonté les erreurs d'installation et Terraform fonctionne enfin !"
}