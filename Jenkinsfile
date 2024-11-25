pipeline {
    agent any

    environment {
        DOCKER_CREDENTIALS = 'ronyg1'  // ID учетных данных для Docker Hub
        DOCKER_IMAGE_NAME = 'ronyg1/myapp:latest'  // Имя образа Docker, которое будет использоваться
    }

    stages {
        stage('Checkout SCM') {
            steps {
                // Извлекаем исходный код проекта из Git
                checkout scm
            }
        }

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
                    // Запуск тестов внутри контейнера Docker
                    docker.image(DOCKER_IMAGE_NAME).inside {
                        sh 'npm install'  // Установка зависимостей, если необходимо
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
                        // Push образа в реестр Docker
                        docker.image(DOCKER_IMAGE_NAME).push()
                    }
                }
            }
        }
    }

    post {
        always {
            // Очистка неиспользуемых контейнеров и образов Docker после выполнения pipeline
            sh 'docker system prune -af'
        }

        success {
            // Действия при успешном завершении
            echo 'Pipeline успешно завершен!'
        }

        failure {
            // Действия при ошибке в pipeline
            echo 'Pipeline завершился с ошибкой.'
        }
    }
}
