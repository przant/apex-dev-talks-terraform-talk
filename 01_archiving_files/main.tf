resource "local_file" "source_dir" {
  filename = "${var.source_dir}/.keep"
  content  = "# This file ensures the output directory exists"
}

resource "local_file" "output_dir" {
  filename = "${var.output_dir}/.keep"
  content  = "# This file ensures the output directory exists"
}

resource "archive_file" "zip_file" {
  type             = "zip"
  source_dir       = var.source_dir
  output_path      = "${var.output_dir}/${var.archive_name}"
  output_file_mode = "0666"

  excludes = [for file in fileset(var.source_dir, "**/*") : file if !contains(var.files_to_include, file)]

  depends_on = [
    local_file.source_dir,
    local_file.output_dir
  ]
}