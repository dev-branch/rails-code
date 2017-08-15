pipeline {
  agent any
  stages {
    stage('s1') {
      steps {
        sh '''echo hello'''
        sh '''echo "more"'''
        sh '''echo "yes"'''
      }
    }
    stage('s2') {
      steps {
        sh '''
              echo "building docker image"
              docker build --rm -t chyld/demo3 .
        '''
      }
    }
    stage('s3') {
      steps {
        sh '''
          docker run --rm -e "RAILS_ENV=development" chyld/demo3 rspec
        '''
      }
    }
    stage('s4') {
      steps {
        sh '''
          # docker rmi chyld/demo3
          # docker system prune -f
          echo "tests passed!"
        '''
      }
    }
  }
}
