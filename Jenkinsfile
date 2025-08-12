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
    stages {
        stage('Get the package version and environment') {
            steps {
                sh """
                    echo "Artifact version: ${params.version}"
                    echo "Environment: ${params.environment}"
                """
            }
        }    
    }

}