pipeline {
    agent any
    parameters {
        choice(name: 'ENVIRONMENT', choices: ['dev', 'stage', 'prod'], description: 'Choose the environment to deploy to')
    }
    environment {
        AWS_ACCESS_KEY_ID = credentials('2667c195-1422-417f-b27a-58b0cc1e78c7')  
        AWS_SECRET_ACCESS_KEY = credentials('2667c195-1422-417f-b27a-58b0cc1e78c7')  
    }
    stages {
        stage('Terraform Init') {
            steps {
                script {
                    // Initialize Terraform for the chosen environment
                    bat "terraform init -backend-config=bucket=my-terraform-state-bucket -backend-config=key=env/${params.ENVIRONMENT}/terraform.tfstate -backend-config=region=us-east-1"
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                script {
                    // Run Terraform Plan for the selected environment
                    bat "terraform plan -var \"environment=${params.ENVIRONMENT}\" -out=plan.tfplan"
                }
            }
        }

        stage('Terraform Apply') {
            steps {
                script {
                    // Apply the changes to the selected environment
                    bat "terraform apply -var \"environment=${params.ENVIRONMENT}\" -auto-approve plan.tfplan"
                }
            }
        }

        stage('Terraform Destroy') {
            when {
                branch 'main' // Only destroy if we are on the 'main' branch (or other conditions)
            }
            steps {
                script {
                    // Optionally, ask before destroying. Here we just run it automatically.
                    bat "terraform destroy -var \"environment=${params.ENVIRONMENT}\" -auto-approve"
                }
            }
        }
    }
    post {
        always {
            // Cleanup, notifications, etc.
        }
    }
}
