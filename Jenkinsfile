pipeline {
    agent any

    stages {
        stage('Cloning Git') {
          steps {
              git([url: 'https://github.com/Alina5757/sspr_3_InternetLab2.git', branch: 'master'])
          }
        }
        stage('Build') {

			steps {
				bat 'docker build -t Alina5757/sspr_3_InternetLab2:latest .'
			}
		}
        stage('Test') {
            steps {
				bat 'FOR /F "tokens=*" %%i IN (\'docker ps -a -q\') DO docker stop %%i'
				bat 'docker rm "test_sspr"'
				bat 'docker run -d --name "test_sspr" Alina5757/sspr_3_InternetLab2:latest bash'
				bat 'docker exec "test_sspr" sh -c "dotnet vstest TestProject.dll"'
				bat 'docker stop "test_sspr"'
            }
        }

        stage("Push Image To Docker Hub") {
            steps {
                withCredentials([string(credentialsId: 'dockerhub', variable: 'aln505')]) {
                    bat "docker login --username aln505 --password ${dockerhub}"
                    bat 'docker push mlnrzm/sspr4:latest'
                }
            }
        }
    }
    post {
		always {
			script {
				node {
					bat 'docker logout'
				}
            }
		}
	}
}