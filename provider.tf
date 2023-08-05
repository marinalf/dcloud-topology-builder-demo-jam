terraform {
  required_providers {
    dcloud = {
      version = ">=0.1.14"
      source  = "cisco-open/dcloud"
    }
  }
}

provider "dcloud" {
  tb_url = "https://tbv3-production.ciscodcloud.com/api"
  auth_token = var.browser_token # or set your environment with "export TB_AUTH_TOKEN=<browser_token>". 
  # Find token with Chrome Dev Tools/Application/Local Storage/tb_p_a value
}
