pipeline {
    agent any

    stages{

            stage('Build survey page') {
                steps {
                    script {
                        sh 'rm -rf *.war'
                        sh 'jar -cvf swe645project3.war /test/swe645project3 .'
                        sh 'echo ${BUILD_TIMESTAMP}'
                        sh "docker login -u ashritmr -p ${env.docker}"
                        sh 'docker build -t ashritmr/swe645assignment3:${BUILD_TIMESTAMP} .'

                   }
                }
            }

            stage('Push to Docker Hub') {
                steps {
                    script {
                        sh 'docker push ashritmr/swe645assignment3:${BUILD_TIMESTAMP}'

                    }
                }
            }

          stage('Deploying Rancher to single node') {
             steps {
                script{
                    sh "kubectl set image deployment/project3 container-0=ashritmr/swe645assignment3:${BUILD_TIMESTAMP}"
                }
             }
          }

        stage('Deploying Rancher to Load Balancer') {
           steps {
              script{
                  sh "kubectl set image deployment/project3lb container-0=ashritmr/swe645assignment3:${BUILD_TIMESTAMP}"
              }
           }
        }
    }
}
