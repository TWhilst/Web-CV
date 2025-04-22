#!/bin/bash
var_os=`curl -s http://169.254.169.254/latest/meta-data/ami-id`
if [ $var_os == "ami-0e449927258d45bc4" ]
then
sudo su -
aws s3 mb s3://toche-portfolio-ami-0e449927258d45bc4
yum install -y git
git clone https://github.com/TWhilst/Web-CV.git
cd Web-CV
aws s3 cp profile.png s3://toche-portfolio-ami-0e449927258d45bc4
aws s3 cp style.css s3://toche-portfolio-ami-0e449927258d45bc4
aws s3 cp index.html s3://toche-portfolio-ami-0e449927258d45bc4
aws s3api put-public-access-block --bucket toche-portfolio-ami-0e449927258d45bc4 --public-access-block-configuration "BlockPublicAcls=false,IgnorePublicAcls=false,BlockPublicPolicy=false,RestrictPublicBuckets=false"
aws s3api put-bucket-policy --bucket toche-portfolio-ami-0e449927258d45bc4 --policy file://policy.json
aws s3 website s3://portfolio1-ami-0e449927258d45bc4 --index-document index.html
aws s3api put-bucket-lifecycle --bucket toche-portfolio-ami-0e449927258d45bc4 --lifecycle-configuration file://lifecycle-conf.json
fi