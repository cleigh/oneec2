# pass information from resrources

output "app_private_ip" {
    value = "${aws_instance.app.private_ip}"

}

output "hostname" {
     value = "${aws_instance.app.tags.name}"
}
