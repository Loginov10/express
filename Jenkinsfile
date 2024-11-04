pipeline {
    agent any

    stages {
        stage('Install dependencies') {
            steps {
                sh 'npm install'
            }
        }
        stage('Run tests') {
            steps {
                sh 'npm test'
            }
        }
        stage('Build Docker image') {
            steps {
                script {
                    def app = docker.build("ronyg1/myapp:latest")
                }
            }
        }
        stage('Push Docker image') {
            steps {
                script {
                    docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-credentials') {
                        app.push()
                    }
                }
            }
        }
    }
}

