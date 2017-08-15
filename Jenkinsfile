pipeline {
  agent any
  stages {
    stage('build dev') {
      steps {
        sh '''
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
  }
  environment {
    ACRPASS = 'RgO=4/sGz2+P=hzYa4qOo6ox8z1L/pRo'
  }
}