# bucket 
resource "aws_s3_bucket" "testbucket" {
  bucket = "test-bucket-app1"

  tags = {
    Name = "test-bucket-app1"
  }

}
