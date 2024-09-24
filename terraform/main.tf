terraform {
  backend "remote" {
    organization = "KansoCloud"

    workspaces {
      name = "hcp-with-git"
    }
  }
}
