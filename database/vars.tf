variable "engine_version" {
  type        = string
  description = "Database engine version. Should contain major and minor version."
  default     = "14.10"
}

variable "instance_class" {
  type        = string
  description = "Database instance class"
  default     = "db.t3.micro"
}