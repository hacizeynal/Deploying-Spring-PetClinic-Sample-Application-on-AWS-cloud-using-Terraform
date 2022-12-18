pipeline {
agent any
tools {
  terraform 'terraform'
}
environment {
    PUBLIC_DYNAMIC_URL = ''
}

 stages { 
  stage ('Checkout Git Repo') { 
     steps { 
       cleanWs()
       sh  'git clone https://github.com/hacizeynal/Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform.git'
      }
      } 
  
  stage ('Terraform init') { 
    steps {
    sh '''
    cd Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform/
    terraform init
    ''' 
    }
   }
   
  stage ('Terraform plan') { 
    steps {
    sh '''
    cd Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform/
    terraform plan
    ''' 
    }
    }
   
  stage ('Terraform apply/destroy') { 
    steps {
    sh '''
    cd Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform/
    terraform apply --auto-approve
    ''' 
    }
   }
  stage ('Check healh status') {
    environment{
      env.PUBLIC_DYNAMIC_URL = '$(terraform output -raw application_public_public_dns)'
  
    } 
    steps {
        echo "URL is ${env.PUBLIC_DYNAMIC_URL}" 
        }
      }
    }
  }