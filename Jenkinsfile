pipeline {
    environment {
        imageName = "tester8cortex/updoc-party"
        version = "1.0.0"
        registryCredential = "dockerhub"
        appImage = ""
    }
    agent {
        label 'docker'
    }

    stages {
        stage("Cloning Git") {
            steps {
                git  "https://github.com/CortexTester/Updoc-Party.git"
            }
        }
        stage('Build image') {
            steps {
                sh "docker build -t ${imageName}:${version} ."
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('push image') {    
            steps {     
                sh "docker push ${imageName}:${version}"
            }
        }
    }
}