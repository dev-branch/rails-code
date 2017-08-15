pipeline {
  agent any
  stages {
    stage('build dev') {
      steps {
        sh '''
          echo 'eee'
          echo $EEE
          echo 'done'
          echo "building development docker container image"
          docker build -t chyld/calc .
        '''
      }
    }
    stage('test') {
      steps {
        sh '''
          echo "running rspec tests"
          docker run --rm -e "RAILS_ENV=development" chyld/calc rspec
        '''
      }
    }
    stage('clean') {
      steps {
        sh '''
          docker system prune -f
        '''
      }
    }
    stage('build prod') {
      steps {
        sh '''
          echo "building production docker container image"
          docker build -t azurechyld.azurecr.io/railscalc:v1 --build-arg OPTIONS="--without development test" .
        '''
      }
    }
    stage('docker login') {
      steps {
        sh '''
          echo "login to azure container registry"
          docker login --username=azurechyld --password=______ azurechyld.azurecr.io
        '''
      }
    }
    stage('docker push') {
      steps {
        sh '''
          echo "push production docker container image to azure registry"
          docker push azurechyld.azurecr.io/railscalc:v1
        '''
      }
    }
  }
  environment {
    AAA = 'bbb'
    CCC = 'ddd'
    EEE = credentials('registry_pass')
  }
  post {
    always {
      echo "always"
    }
    success {
      echo "success"
    }
    failure {
      echo "failure"
    }
  }
}
