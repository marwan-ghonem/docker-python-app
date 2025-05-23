pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_TAG', defaultValue: 'latest', description: 'Tag for Docker image')
        choice(name: 'DEPLOY_ENV', choices: ['dev', 'test', 'prod'], description: 'Choose deploy environment')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run test suite?')
    }

    environment {
        DOCKERHUB_CREDENTIALS = credentials('docker-creds') // update with your actual Jenkins Docker creds ID
        IMAGE_NAME = "marwanghonem/python-app"
    }

    stages {
        stage('Checkout') {
            steps {
                git url: 'https://github.com/marwan-ghonem/docker-python-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:${IMAGE_TAG} .'
            }
        }

        stage('Run Tests') {
            when {
                expression { return params.RUN_TESTS }
            }
            steps {
                sh 'echo "Running tests..."'
                // Replace with actual test command if needed
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([usernamePassword(credentialsId: env.DOCKERHUB_CREDENTIALS, passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh """
                        echo "$PASS" | docker login -u "$USER" --password-stdin
                        docker push $IMAGE_NAME:${IMAGE_TAG}
                    """
                }
            }
        }
    }
}
