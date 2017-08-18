pipeline {
  agent any
    environment {
    ACR_PASS = credentials('ACR_PASS')
  }
  stages {
    stage('build dev') {
      steps {
        sh '''
          echo "building development docker container image"
          docker build -t chyld/calc -f Dockerfile.dev .
        '''
      }
    }
    stage('test') {
      steps {
        sh '''
          echo "running rspec tests"
          docker run --rm chyld/calc rspec
        '''
      }
    }
    stage('build prod') {
      steps {
        sh '''
          echo "building production docker container image"
          docker build -t azurechyld.azurecr.io/calc:v$BUILD_NUMBER -f Dockerfile.prod .
        '''
      }
    }
    stage('registry login') {
      steps {
        sh '''
          echo "login to azure container registry"
          docker login --username=azurechyld --password=$ACR_PASS azurechyld.azurecr.io
        '''
      }
    }
    stage('registry push') {
      steps {
        sh '''
          echo "push production docker container image to azure registry"
          docker push azurechyld.azurecr.io/calc:v$BUILD_NUMBER
        '''
      }
    }
    stage('deploy k8s') {
      steps {
        sh '''
          echo "deploy kubernetes to azure"
          kubectl apply -f deployment.yaml
        '''
      }
    }
  }
  post {
    always {
      echo "pruning docker images from system"
      sh '''docker system prune -f'''
    }
    success {
      echo "success-1"
    }
    failure {
      echo "failure!"
    }
  }
}
