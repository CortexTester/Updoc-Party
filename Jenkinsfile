pipeline {
    environment {
        registry = "tester8cortex/updoc-party"
        registryCredential = "dockerhub"
        dockerImage = ""
    }
    agent any

    stages {
        stage("Cloning Git") {
            steps {
                git  "https://github.com/CortexTester/Updoc-Party.git"
            }
        }
        stage('Build image') {
            steps {
                script {
                    dockerImage = docker.build registry + ":1.0.0" 
                }
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('push image') {         
            script {
                docker.withRegistry( ‘’, registryCredential ) {
                dockerImage.push()
                }
            }
        }
    }
}