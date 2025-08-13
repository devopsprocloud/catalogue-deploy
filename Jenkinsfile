pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    parameters {
        string(name: 'version', defaultValue: '', description: 'What is the Artifact Version?')
        string(name: 'environment', defaultValue: '', description: 'What is the environment?')
        
    }
   
    options {
        ansiColor('xterm')
        disableConcurrentBuilds()
    }
    environment {
        APP_VERSION = "${params.version}"
        ENVIRONMENT = "${params.environment}"
    }

    stages {
        stage('Get the package version and environment') {
            steps {
                sh """
                    echo "Artifact version: ${params.version}"
                    echo "Environment: ${params.environment}"
                """
            }
        }
        stage('Terraform init') {
            steps {
                sh """
                    cd terraform
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('terraform Plan') {
            steps {
                sh """
                    cd terraform 
                    terraform plan -var-file="${params.environment}/${params.environment}.tfvars" -var="app_version=${params.version}" 
                """
            }
        }
        // stage('Terraform Apply') {
        //     steps {
        //         sh """
        //             cd terraform 
        //             terraform apply -var-file="${params.environment}/${params.environment}.tfvars" -var="app_version=${params.version}" -auto-approve
                    
        //         """
        //     }
        // }
        stage('Terraform Plan') {
            steps {
                sh '''
                    cd terraform
                    terraform plan \
                    -var-file="$ENVIRONMENT/$ENVIRONMENT.tfvars" \
                    -var="app_version=$APP_VERSION"
                '''
            }
        }   
    }
    post {
        // always {
        //     echo 'Deleting the Directory'
        //     deleteDir()
        // }
        failure {
            echo 'Pipeline Script execution Failed'
        }
        success {
            echo 'Pipeline Scrip Executed Successfully'
        }
    }

}

