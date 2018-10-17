// node ('docker'){
//     def registry = 'tester8cortex/updoc-party'
//     def registryCredential = 'dockerhub'
//     def app
//     try{
//         stage('clone repository'){
//             checkout scm
//         }
//         stage('build image'){
//             app = docker.build("${registry}")
//         }
//         stage('run unit testing'){
//             sh "echo 'Testing...'"
//         }
//         stage('push image'){
//              def VERSION = sh (
//                 script: 'grep version package.json | cut -c 15- | rev | cut -c 3- | rev',
//                 returnStdout: true
//             ).trim()
//             sh "echo 'version' + ${VERSION}"
//             // app.push()
//             // docker.withRegistry('', "${registryCredential}"){
//                 // app.push("${VERSION}")
//             // }            
//         }
//     }
//     catch (error) {
//        stage "Cleanup after fail"{
//             sh "echo ${error}"
//             throw error
//        }       
//    }
//     finally{
//         sh 'docker system prune -f'
//         // sh 'npm prune'
//         sh 'docker rmi \$(docker images -q --filter=reference=tester8cortex/updoc-party:*) -f'
//     }
// }
pipeline {
    environment {
        imageName = "tester8cortex/updoc-party"
        version = "1.0.0"
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

    post{
        failure{
            echo "failed"
        }
        always{
            sh "docker system prune -f"
        }
    }
}