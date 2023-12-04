@Library('devops-projects-shared-lib') _

pipeline {
    agent {
        label 'docker'
    }
    parameters {
        choice choices: ['create', 'delete'], description: 'Choose create or Delete', name: 'action'
    }
    stages{
        
        stage('Git Checkout'){
            
            when { expression { params.action == 'create' } }
            steps {                
                gitCheckout(
                    branch: 'main',
                    url: 'https://github.com/csnkarthik/devops-project-1.git'
                )
            }
        }
        
        stage('Unit Test'){
            when { expression { params.action == 'create' } }
            steps {         
                script{
                    mvnTest()
                }      
            }
        }        
        stage('Integration Test'){
            when { expression { params.action == 'create' } }
            steps {           
                script{
                    mvnIntegrationTest()
                }    
            }
        }
        stage('Static Code Analysis'){
            when { expression { params.action == 'create' } }
            steps {         
                script{
                    def sonarcubeCredentials = 'sonar-api'
                    staticCodeAnalysis(sonarcubeCredentials);
                }      
            }
        }
    }
}