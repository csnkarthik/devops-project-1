@Library('devops-projects-shared-lib') _

pipeline {
    agent {
        label 'docker'
    }
    parameters {
        choice choices: ['create', 'delete'], description: 'Choose create or Delete', name: 'action'
    }
    stages{
        
        when { expression { param.action == 'create' } }
        stage('Git Checkout'){
            steps {                
                gitCheckout(
                    branch: 'main',
                    url: 'https://github.com/csnkarthik/devops-project-1.git'
                )
            }
        }
        
        stage('Unit Test'){
            when { expression { param.action == 'create' } }
            steps {         
                script{
                    mvnTest()
                }      
            }
        }        
        stage('Integration Test'){
            when { expression { param.action == 'create' } }
            steps {           
                script{
                    mvnIntegrationTest()
                }    
            }
        }

        stage('Static Code Analysis'){
            when { expression { param.action == 'create' } }
            steps {         
                script{
                    staticCodeAnalysis();
                }      
            }
        }
    }
}