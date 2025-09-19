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
        sh 'docker build -t my-homepage .'
      }
    }
    stage('Deploy Container') {
      steps {
        sh '''
          docker rm -f homepage-container || true
          docker run -d -p 4000:3000 --name homepage-container my-homepage
        '''
      }
    }
  }
}

