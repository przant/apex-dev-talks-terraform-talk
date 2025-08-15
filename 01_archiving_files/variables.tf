variable "archive_name" {
  description = "Name of the zip archive to create"
  type        = string
  default     = "my-terraform-archive.zip"
}

variable "source_dir" {
  description = "Directory containing files to archive"
  type        = string
  default     = "./sample_files"
}

variable "output_dir" {
  description = "Directory where the zip file will be created"
  type        = string
  default     = "."
}

variable "files_to_include" {
  description = "The comma separated value string of files to zip"
  type        = list(string)
  default     = ["00text_file.txt", "01jpeg_file.jpeg", "02python_file.py"]
}
