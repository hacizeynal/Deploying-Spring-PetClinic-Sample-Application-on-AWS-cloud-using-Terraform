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
   
 stage ('Terraform apply') { 
  steps {
   sh '''
   cd Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform/
   terraform destroy --auto-approve
   ''' 
   }
        post { 
        always { 
            cleanWs()
         }
        }
       }
  }
}