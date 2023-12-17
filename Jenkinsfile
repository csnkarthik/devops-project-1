@Library('devops-projects-shared-lib') _

pipeline {
    agent {
        label 'docker'
    }
    parameters {
        choice choices: ['create', 'delete'], description: 'Choose create or Delete', name: 'action'
        string defaultValue: 'javaapp', description: 'Name of the Image', name: 'ImageName'
        string defaultValue: 'v1', description: 'Tag of the Image', name: 'ImageTag'
        string defaultValue: 'csnkarthik', description: 'Name of the App', name: 'dockerHubUser'
    }
    environment {
        DOCKER_CREDENTIALS = credentials('docker_credentials')
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
        // stage('Unit Test'){
        //     when { expression { params.action == 'create' } }
        //     steps {         
        //         script{
        //             mvnTest()
        //         }      
        //     }
        // }        
        // stage('Integration Test'){
        //     when { expression { params.action == 'create' } }
        //     steps {           
        //         script{
        //             mvnIntegrationTest()
        //         }    
        //     }
        // }
        // stage('Static Code Analysis'){
        //     when { expression { params.action == 'create' } }
        //     steps {         
        //         script{
        //             def sonarcubeCredentials = 'sonar-api'
        //             staticCodeAnalysis(sonarcubeCredentials);
        //         }      
        //     }
        // }
        // stage('Quality Gate status check'){
        //     when { expression { params.action == 'create' } }
        //     steps {         
        //         script{
        //             def sonarcubeCredentials = 'sonar-api'
        //             qualityGateStatus(sonarcubeCredentials);
        //         }      
        //     }
        // }
        
        // stage('Maven build'){
        //     when { expression { params.action == 'create' } }            
        //     steps {         
        //         script{
        //             mvnBuild();
        //         }      
        //     }
        // }

        // stage('Docker Image build'){
        //     when { expression { params.action == 'create' } }            
        //     steps {         
        //         script{
        //             dockerBuild("${params.ImageName}", "${params.ImageTag}", "${params.dockerHubUser}");
        //         }
        //     }
        // }

        // stage('Docker Image Scane'){
        //     when { expression { params.action == 'create' } }            
        //     steps {         
        //         script{
        //             dockerImageScan("${params.ImageName}", "${params.dockerHubUser}");
        //         }
        //     }
        // }

        // stage('Docker Image push'){
        //     when { expression { params.action == 'create' } }            
        //     steps {         
        //         script{
        //             dockerImagePush("${params.ImageName}", "${params.ImageTag}", "${params.dockerHubUser}");
        //         }
        //     }
        // }

        stage('deploy to minikube'){
            when { expression { params.action == 'create' } }            
            steps {         
                sshagent(['minikube_cluster']) {
                    sh """
                        ssh -o StrictHostKeyChecking=no gayathrik@192.168.0.104    
                        scp ${WORKSPACE}/deploy/k8s-deployment.yaml gayathrik@192.168.0.104:~/Desktop/installs/devops-project-1/  

                        docker login -u ${DOCKER_CREDENTIALS_USR} -p ${DOCKER_CREDENTIALS_PSW}

                        ssh -o StrictHostKeyChecking=no gayathrik@192.168.0.104  kubectl apply -f ~/Desktop/installs/devops-project-1/k8s-deployment.yaml    
                                               
                    """
                }
            }
            //ssh -o StrictHostKeyChecking=no gayathrik@192.168.0.104  kubectl expose deployment java-app-v4 --type=NodePort --port=8080 
        }
       
    }
}