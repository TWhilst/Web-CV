#!/bin/bash
var_os=`curl -s http://169.254.169.254/latest/meta-data/ami-id`
if [ $var_os == "ami-0e449927258d45bc4" ]
then
sudo su -
aws s3 mb s3://toche-portfolio-ami-0e449927258d45bc4
yum install -y git
git clone https://github.com/TWhilst/Web-CV.git
aws s3 cp Web-CV/profile.png s3://toche-portfolio-ami-0e449927258d45bc4
aws s3 cp Web-CV/style.css s3://toche-portfolio-ami-0e449927258d45bc4
aws s3 cp Web-CV/index.html s3://toche-portfolio-ami-0e449927258d45bc4
fi