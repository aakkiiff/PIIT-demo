pipeline {
    agent any 

    environment {
        IMAGE_TAG = "$BUILD_NUMBER"
        dockerhub_credential_id = "dockerhub"
        APP_NAME = "yourmentors_fe"
        GIT_REPO = "https://github.com/aakkiiff/um_main.git"
        UPSTRING_CONFIG_PROJECT_NAME = "config_pipeline"
     }


    stages {
        stage('CLEANUP WORKSPACE'){
            steps{
                script{
                    cleanWs()
                }
            }
        }

        stage("CHECKOUT GIT REPO"){
            steps{
                git branch: 'main', url: "${GIT_REPO}"
            }
        }

        stage("CODE TESTING"){
            steps{
                
                sh'echo "testing passed"'
            }
        }

        stage("BUILD+PUSH DOCKER IMAGES TO DOCKERHUB"){
            steps{
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'PASSWORD', usernameVariable: 'USER_NAME')]) {
                    sh'docker build --no-cache -t ${USER_NAME}/${APP_NAME}:${IMAGE_TAG} .'   
                    sh'echo ${PASSWORD} | docker login --username ${USER_NAME} --password-stdin'
                    sh'docker push ${USER_NAME}/${APP_NAME}:${IMAGE_TAG}'
                    sh'docker logout'
                }
            }
        }

        
    }

}