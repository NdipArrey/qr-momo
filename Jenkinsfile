pipeline {
    agent any
        
    triggers {
        pollSCM '* * * * *'
    }
    environment {
        CI = false     //do not treat error as warnings
    }

    stages {
        stage('Build') {
             steps {
                sh 'echo "Building.." '
                sh 'npm install'
                sh 'npm run build'

             }
        }        

    

        stage('Delivery'){
            steps {
              withCredentials([usernamePassword(credentialsId: 'Dockerhub', usernameVariable: 'USERNAME',   passwordVariable: 'PASSWORD')]) {  
                sh 'docker login -u $USERNAME -p $PASSWORD'
                sh 'docker build -t qr-momo:v2 .'
                sh 'docker tag qr-momo:v1 ndiparrey/qr-momo:v2'
                sh 'docker push ndiparrey/qr-momo:v2'

              }
            }
        }
        stage('sonarqube analysis') {
            environment {
                scannerHome = tool "sonarscanner"
            }
            steps{
                withSonarQubeEnv('sonarqube') {
                    sh "${scannerHome}/bin/sonar-scanner"
                }
            }
        }
    }




































        
    }

}

