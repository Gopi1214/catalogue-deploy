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
    }

    // Build
    stages {
        stage('Get the app version') { 
            steps {
                sh """
                  echo "version is: ${params.version}"
                  echo "version is: ${params.environment}"
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