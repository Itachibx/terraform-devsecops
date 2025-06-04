pipeline {
    agent any

    environment {
    GOOGLE_APPLICATION_CREDENTIALS = credentials('gcp-sa-key') // id google cloud
    TF_IN_AUTOMATION = "true"
    PATH = "/var/lib/jenkins/.local/bin:$PATH"  // sửa đường dẫn chứa checkov
}

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Terraform Init') {
            steps {
                dir('dev') {
                    sh 'terraform init'
                }
            }
        }

        stage('Checkov') {
            steps {
                dir('dev') {
                    sh 'checkov -d .'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir('dev') {
                    sh 'terraform plan'
                }
            }
        }

        //  auto apply, run stage
        /*
        stage('Terraform Apply') {
            steps {
                dir('dev') {
                    sh 'terraform apply -auto-approve'
                }
            }
        }
        */
    }

    post {
        always {
            echo 'Pipeline finished.'
        }
    }
}


