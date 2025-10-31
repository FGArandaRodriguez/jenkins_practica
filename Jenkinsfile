pipeline {
    agent any
    stages {
        stage('Checkout') { 
            steps {
                git 'https://github.com/raulmendez/jenkins_practica.git'
            }
        }
        stage('Build') {
            steps {
                sh 'docker build -t flask-app .'
            }
        }
        stage('Test') {
            steps {
                sh 'pytest --maxfails=1 --disable-warnings -q'
            }
        }
        stage('Run Container') {
            steps {
                sh 'docker run -d -p 5000:5000 --name flask-ci flask-app'
            }
        }
    }

    post {
        always {
            sh 'docker ps -a'
        }
        success {
            echo 'chingón, se está haciendo el Build y las pruebas Todo exitoso como tu'
        }
        failure {
            echo 'chingón, falló eres un pendejo'
        }
    }   
}