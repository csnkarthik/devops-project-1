@Library('devops-projects-shared-lib') _

pipeline {
    agent {
        label 'docker'
    }

    stages{
        stage('git checkout'){
            steps {                
                // git branch: 'main', url: 'https://github.com/csnkarthik/devops-project-1.git'
                gitCheckout(
                    branch: 'main',
                    url: 'https://github.com/csnkarthik/devops-project-1.git'
                )
            }
        }        
        stage('Unit Test'){
            steps {         
                script{
                    mvnTest();
                }      
            }
        }

        stage('Unit Test'){
            steps {           
                script{
                    mvnIntegrationTest();                

                }    
            }
        }
    }
}