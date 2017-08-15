pipeline {
  agent any
  stages {
    stage('build') {
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
  }
}
