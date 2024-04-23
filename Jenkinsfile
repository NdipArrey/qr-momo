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
                sh 'docker login -u ndiparrey -p Nmanny06NE'
                sh 'docker build -t qr-momo:v2 .'
                sh 'docker tag qr-momo:v2 ndiparrey/qr-momo:v2'
                sh 'docker push ndiparrey/qr-momo:v2'
            }
        }
    }





































        
    



