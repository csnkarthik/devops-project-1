@Library('devops-projects-shared-lib') _

pipeline {
    agent {
        label 'docker'
    }
    stages{
        stage('git checkout'){
            steps {                
                gitCheckout(
                    branch: 'main',
                    url: 'https://github.com/csnkarthik/devops-project-1.git'
                )
            }
        }        
        stage('Unit Test'){
            steps {         
                script{
                    mvnTest()
                }      
            }
        }
        stage('Integration Test'){
            steps {           
                script{
                    mvnIntegrationTest()
                }    
            }
        }
    }
}