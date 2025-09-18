pipeline {
  agent any
  stages {
    stage('Checkout') {
      steps {
        checkout scm
      }
    }
    stage('Install') {
      steps {
        sh 'npm ci'
      }
    }
    stage('Deploy') {
      steps {
        sh 'pm2 stop myapp || true'
        sh 'pm2 start index.js --name myapp --update-env'
        sh 'pm2 save'
      }
    }
  }
  post {
    always {
      sh 'pm2 ls || true'
    }
  }
}

