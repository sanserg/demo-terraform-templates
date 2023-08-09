output "vm_public_ip" {
  value = "${aws_instance.my_aws_instance.public_ip}"
}

output "sample_message" {
  value = "This is just a sample message"
}

output "vm_ssh_private_key" {
  value = "${tls_private_key.ssh.private_key_pem}"
  sensitive = true
}

output "camtags_tagsmap" {
  value = "${module.camtags.tagsmap}"
}

output "camtags_tagslist" {
  value = "${module.camtags.tagslist}"
}
