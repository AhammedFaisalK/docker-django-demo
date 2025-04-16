pipeline {
    agent any
    
    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }
        
        stage('Build Docker Image') {
            steps {
                sh 'docker build -t django-jenkins-docker-demo .'
            }
        }
        
        stage('Run Tests') {
            steps {
                sh 'docker run --rm django-jenkins-docker-demo python manage.py test'
            }
        }
        
        stage('Prepare for Deployment') {
            steps {
                echo 'Docker image built and tested successfully'
                echo 'In a real scenario, this is where we would deploy the application'
                echo 'Image is ready with tag: django-jenkins-docker-demo'
            }
        }
    }
    
    post {
        failure {
            echo 'Pipeline failed!'
        }
        success {
            echo 'Pipeline completed successfully! Image is ready for deployment when needed.'
        }
    }
}