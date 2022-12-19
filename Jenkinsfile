pipeline {
agent any
tools {
  terraform 'terraform'
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

  stage ("WAIT TIME TILL DEPLOYMENT") {
    steps{
      sleep time: 300, unit: 'SECONDS'
      echo "Waiting 5 minutes for deployment to complete prior starting health check testing"
    }  
    }

  stage ('Check healh status') {
    environment {
      PUBLIC_DYNAMIC_URL = "${sh(script:'cd Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform/ && terraform output -raw application_public_public_dns', returnStdout: true).trim()}"
    } 
    steps {
      sh "curl -X GET http://${env.PUBLIC_DYNAMIC_URL}:8080/actuator/health/custom"

      echo "Application is UP running successfully ! :) "
        }
      }
    }
  }