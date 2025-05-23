pipeline {
    agent any

    parameters {
        string(name: 'IMAGE_TAG', defaultValue: 'latest', description: 'Tag for Docker image')
        choice(name: 'DEPLOY_ENV', choices: ['dev', 'test', 'prod'], description: 'Choose deploy environment')
        booleanParam(name: 'RUN_TESTS', defaultValue: true, description: 'Run test suite?')
    }

    environment {
<<<<<<< HEAD
        DOCKERHUB_CREDENTIALS = 'docker-creds' // MUST match the ID in Jenkins Credentials
=======
        DOCKERHUB_CREDENTIALS = 'docker' // Jenkins credential ID
>>>>>>> main
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
<<<<<<< HEAD
                sh 'docker build -t $IMAGE_NAME:${IMAGE_TAG} .'
=======
                sh "docker build -t ${IMAGE_NAME}:${params.IMAGE_TAG} ."
>>>>>>> main
            }
        }

        stage('Run Tests') {
            when {
                expression { return params.RUN_TESTS }
            }
            steps {
<<<<<<< HEAD
                sh 'echo "Running tests..."'
                // Replace with actual test command if needed
            }
        }

        stage('Debug Credentials') {
            steps {
                echo "Using credentials ID: ${env.DOCKERHUB_CREDENTIALS}"
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: env.DOCKERHUB_CREDENTIALS,
                        usernameVariable: 'USER',
                        passwordVariable: 'PASS'
                    )
                ]) {
                    sh '''
                        echo "$PASS" | docker login -u "$USER" --password-stdin
                        docker push $IMAGE_NAME:${IMAGE_TAG}
                    '''
                }
            }
        }
=======
                echo 'Running tests...'
                sh 'echo "Tests completed (placeholder)"'
            }
        }

        stage('Push to DockerHub') {
            steps {
                withCredentials([
                    usernamePassword(
                        credentialsId: env.DOCKERHUB_CREDENTIALS,
                        usernameVariable: 'USER',
                        passwordVariable: 'PASS'
                    )
                ]) {
                    sh """
                        echo "$PASS" | docker login -u "$USER" --password-stdin
                        docker push ${IMAGE_NAME}:${params.IMAGE_TAG}
                    """
                }
            }
        }
>>>>>>> main
    }
}
