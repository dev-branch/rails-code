pipeline {
  agent any
  stages {
    stage('s1') {
      steps {
        sh '''echo hello

'''
      }
    }
    stage('s2') {
      steps {
        sh '''echo "building docker image"
docker build -t chyld/demo3 .
'''
      }
    }
  }
}