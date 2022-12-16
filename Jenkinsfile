pipeline {
agent any
tools {
  terraform 'terraform'
}
 stages { 
   stage ('Checkout Repo') { 
     steps { 
       cleanWs()
       sh  'git clone https://github.com/hacizeynal/Deploying-Spring-PetClinic-Sample-Application-on-AWS-cloud-using-Terraform.git'
      }
      } 

stage ('Terraform version') { 
  steps {
   sh '''
    terraform --version
   ''' 
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
   terraform plan
   ''' 
   }
   }
   
 stage ('Terraform apply') { 
  steps {
   sh '''
   cd terraform-test/
   terraform apply --auto-approve
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