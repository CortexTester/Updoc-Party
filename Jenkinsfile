node ('docker'){
    def registry = 'tester8cortex/updoc-party'
    def registryCredential = 'dockerhub'
    def app
    try{
        stage('clone repository'){
            checkout scm
        }
        stage('build image'){
            app = docker.build("${registry}")
        }
        stage('run unit testing'){
            sh "echo 'Testing...'"
        }
        stage('push image'){
            docker.logout()
            def VERSION = sh (
                script: 'grep version package.json | cut -c 15- | rev | cut -c 3- | rev',
                returnStdout: true
            ).trim()
            docker.withRegistry('', "${registryCredential}"){
                app.push("${VERSION}")
            }            
        }
    }
    catch (error) {
       stage "Cleanup after fail"{
            sh "echo ${error}"
            throw error
       }       
   }
    finally{
        sh 'docker system prune -a'
        // sh 'npm prune'
        sh 'docker rmi \$(docker images -q --filter=reference=tester8cortex/updoc-party:*) -f'
    }
}
// pipeline {
//     environment {
//         imageName = "tester8cortex/updoc-party"
//         version = "1.0.0"
//         registryCredential = "dockerhub"
//         appImage = ""
//     }
//     agent {
//         label 'docker'
//     }

//     stages {
//         stage("Cloning Git") {
//             steps {
//                 git  "https://github.com/CortexTester/Updoc-Party.git"
//             }
//         }
//         stage('Build image') {
//             steps {
//                 sh "docker build -t ${imageName}:${version} ."
//             }
//         }
//         stage('Test') {
//             steps {
//                 echo 'Testing..'
//             }
//         }
//         stage('push image') {    
//             steps {     
//                 sh "docker push ${imageName}:${version}"
//             }
//         }
//     }
// }