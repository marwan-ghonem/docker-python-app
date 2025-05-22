pipeline {
    agent any

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-creds') // ID of Docker Hub creds
        IMAGE_NAME = "marwanghonem/python-app"
        IMAGE_TAG = "${BUILD_NUMBER}"
    }

    stages {
        stage('Clone Repo') {
            steps {
                git branch: 'main', url: 'https://github.com/marwan-ghonem/docker-python-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                echo "🔨 Building Docker Image: $IMAGE_NAME:$IMAGE_TAG"
                sh "docker build -t $IMAGE_NAME:$IMAGE_TAG ."
            }
        }

        stage('Login to Docker Hub') {
            steps {
                echo "🔐 Logging in to Docker Hub"
                sh 'echo "${DOCKERHUB_CREDENTIALS_PSW}" | docker login -u "${DOCKERHUB_CREDENTIALS_USR}" --password-stdin'
            }
        }

        stage('Push Image') {
            steps {
                echo "📤 Pushing Docker Image"
                sh "docker push $IMAGE_NAME:$IMAGE_TAG"
            }
        }
    }

    post {
        success {
            echo "✅ Pipeline completed successfully!"
        }
        failure {
            echo "❌ Pipeline failed!"
        }
    }
}
