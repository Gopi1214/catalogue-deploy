pipeline {
    agent { 
        node { 
            label 'AGENT-1' 
            } 
        }
    options {
        ansiColor('xterm')
        timeout(time: 1, unit: 'HOURS')
        disableConcurrentBuilds()
    }
    // environment { 
    //     packageVersion = ''
    //     nexusURL = '172.31.94.66:8081'
    // }
    parameters {
        string(name: 'version', defaultValue: '', description: 'what is the artifact version?')
        string(name: 'environment', defaultValue: '', description: 'what is the environment?')
        choice(name: 'options', choices: ['apply', 'destroy'], description: 'pick option u want?')
    }

    // Build
    stages {
        stage('Get the app version') { 
            steps {
                sh """
                  echo "version is: ${params.version}"
                  echo "environment is: ${params.environment}"
                """
            }
        }
        stage('terraform init') { 
            steps {
                sh """
                  cd terraform
                  terraform init -backend-config=${params.environment}/backend.tf -reconfigure
                """
            }
        }
        stage('terraform plan') { 
            steps {
                sh """
                  cd terraform
                  terraform plan -var-file=${params.environment}/${params.environment}.tfvars -var ="app_version=${params.version}"
                """
            }
        }
        stage('terraform apply') { 
            when { 
                expression { 
                    params.options ==  "apply"
                } 
            }
            steps {
                sh """
                  cd terraform
                  terraform apply -var-file=${params.environment}/${params.environment}.tfvars -var ="app_version=${params.version}" -auto-approve
                """
            }
        }
        stage('terraform destroy') {
             when { 
                expression { 
                    params.options ==  "destroy"
                } 
            } 
            steps {
                sh """
                  cd terraform
                  terraform destroy -var-file=${params.environment}/${params.environment}.tfvars -var ="app_version=${params.version}" -auto-approve
                """
            }
        }

    }
    // Post Build
    post { 
        always { 
            echo 'I will always say Hello again!'
        }
        failure { 
            echo 'I will run when the job has failed!'
        }
        success { 
            echo 'I will run when the job is success!'
        }
        aborted { 
            echo 'I will run when the job is aborted manually!'
        }
    }
}