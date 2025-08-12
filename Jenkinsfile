pipeline {
    agent {
        node {
            label 'AGENT-1'
        }
    }
    // environment {
    //     packageVersion = ''
    //     nexusUrl = '98.83.155.227:8081'
    // }

    options {
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
        ansiColor('xterm')
    }
    // # We are getting the below parameter values from catalogue Jenkinsfile
    parameters {
            string(name: 'version', defaultValue: '', description: 'What is the artifact version?')
            string(name: 'environment', defaultValue: '', description: 'What is the environment?')
    }

    stages {
        stage('Print the Artifact version') {
            steps {
                script {
                    sh """
                        echo "version: ${params.version}"
                        echo "environment: ${params.environment}"
                    """
                }
            }
        }
        stage('Terraform Init') {
            steps {
                sh """
                    cd terraform 
                    terraform init --backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('Terraform Plan') {
            steps {
                sh """
                    cd terraform 
                    terraform plan -var="app_version=${params.version}"
                    # app_version will be set for the variable file "app_version" in terraform variables
                """
            }
        }
        stage('Terraform Plan') {
            steps {
                sh """
                    cd terraform 
                    terraform plan -var="app_version=${params.version}"
                    # app_version will be set for the variable file "app_version" in terraform variables
                """
            }
        }
    }
    post { 
        always { 
            echo 'Deleting the directory'
            deleteDir()
        }
        failure {
            echo 'The pipeline is Failed, Please send some alerts'
        }
        success {
            echo 'Pipeline executed successfully'
        }
    }
}
