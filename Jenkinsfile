pipeline {
    environment {
        registry = "tester8cortex/updoc-party"
        registryCredential = "dockerhub"
        dockerImage = ""
    }
    agent any

    stages {
        stage('Cloning Git') {
           checkout scm
        }
        stage('Build image') {
            steps {
                dockerImage = docker.build registry 
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Push image') {
            def PACKAGE_VERSION=sh (
                script:'grep version package.json | cut -c 15- | rev | cut -c 3- |rev',
                returnStdout: true
            ).trim()            
            script {
                docker.withRegistry( ‘’, registryCredential ) {
                dockerImage.push("${PACKAGE_VERSION}")
                }
            }
        }
    }
}