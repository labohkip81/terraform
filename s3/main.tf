provider "aws" {
    region = "eu-west-2" 
}

resource "aws_s3_bucket" "labans-new-s3" {

    bucket = "labans-bucket-s3"
  
}

resource "aws_s3_object" "provisioning_source_files" {
    bucket = aws_s3_bucket.labans-new-s3.id
    for_each = fileset("myapp/", "**/*.*")
    key = each.value
    source = "myapp/${each.value}"
    content_type = each.value
  
}