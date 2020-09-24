data "archive_file" "lambda_zip" {
  type        = "zip"
  source_file = "${path.module}/lambda/xpto.py"
  output_path = "${path.module}/lambda/xpto.zip"
}

resource "null_resource" "test" {
  triggers {
    always_run = "${uuid()}"
  }
  provisioner "local-exec" {
    command = "ls -l *"
  }
}

output "hash" {
  value = "${data.archive_file.lambda_zip.output_md5}"
}

output "path" {
  value = "${data.archive_file.lambda_zip.output_path}"
}