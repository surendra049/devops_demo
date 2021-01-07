pipeline {
  environment {
    registry = "surendra049/httpd"
    registryCredential = 'dockerHub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Cloning Git') {
      steps {
        git 'https://github.com/surendra049/devops_demo.git'
      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
     stage ('K8S Deploy') {
        steps{
		script { 
			kubernetesDeploy(
				configs: 'httpd.yaml',
				kubeconfigId: 'K8S',
				
           )           
          }
       }
	}
     
  }
}