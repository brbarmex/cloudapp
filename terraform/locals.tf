locals {

  my_ip = chomp(data.http.my_ip.response_body)

  tags = {
    app            = "cloud_app_sample"
    infra          = "iac"
    iac_automation = "terraform"
    owner          = "brbarme-x"
  }
}