variable "liste_utilisateurs" {
  type    = list(string)
  default = ["Hamadi", "khouloud", "yolanda", "zaylouna", "yasmine"]
}


resource "local_file" "messages_multiples" {
  # On dit à Terraform de créer autant de fichiers qu'il y a de noms dans la liste
  count    = length(var.liste_utilisateurs)
  
  # On crée un nom de fichier différent pour chacun
  filename = "${path.module}/message_${var.liste_utilisateurs[count.index]}.txt"
  
  # On personnalise le contenu
  content  = "Bravo ${var.liste_utilisateurs[count.index]} ! Ce fichier a ete cree automatiquement par Terraform."
}