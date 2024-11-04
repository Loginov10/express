
pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'ronyg1' // ID ваших учётных данных для Docker Hub
        DOCKER_IMAGE_NAME = 'ronyg1/myapp:latest' // Укажите ваше имя пользователя и название образа
    }

    stages {
        stage('Build Docker Image') {
            steps {
                script {
                    // Сборка Docker-образа
                    def app = docker.build(DOCKER_IMAGE_NAME)
                }
            }
        }
        stage('Run Tests') {
            steps {
                script {
                    // Запуск тестов
                    // Здесь мы можем запускать тесты, используя `docker run`
                    docker.image(DOCKER_IMAGE_NAME).inside {
                        sh 'npm install'  // Установите зависимости, если это необходимо
                        sh 'npm test'     // Запуск тестов
                    }
                }
            }
        }
        stage('Push Docker Image') {
            steps {
                script {
                    // Публикация образа в Docker Hub
                    docker.withRegistry('https://registry.hub.docker.com', DOCKER_CREDENTIALS) {
                        app.push()
                    }
                }
            }
        }
    }
    post {
        always {
            // Очистка образов и контейнеров
            sh 'docker system prune -af'
        }
    }
}

