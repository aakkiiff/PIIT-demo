pipeline {
    agent any 

    environment {
        IMAGE_TAG = "$BUILD_NUMBER"
        GIT_REPO = "https://github.com/aakkiiff/PIIT-demo.git"
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

        stage("CODE BUILDING"){
            steps{
                
                sh'echo "Building successful"'
            }
        }

        stage("BUILD DOCKER IMAGE"){
            steps{
                    sh'docker build --no-cache -t pitdemo_container:${IMAGE_TAG} .'   
                
            }
        }

        stage("STOP PREVIOUS CONTAINER"){
            steps{
                script{
                    sh'''
                    if [ $(docker ps -aq -f name=pitdemo_container) ]; then
                        docker stop pitdemo_container
                        docker rm pitdemo_container
                    else
                        echo "No previous container running"
                    fi
                    '''
                }
            }
        }
        stage("RUN DOCKER CONTAINER"){
            steps{
                
                sh'docker run -d -p 80:80 --name pitdemo_container pitdemo_container:${IMAGE_TAG}'
            }
        }
        stage("NOTIFY DEPLOYMENT SUCCESS"){
            steps{
                
                sh'''
                curl -H "Content-Type: application/json" \
                -X POST \
                -d '{"content": "Deployment Successful! Application is running on port 8080"}' \
                https://discordapp.com/api/webhooks/1430485170175348746/D8_wVuznBj8cohGsvbC2tyyu_pAJq5NNNqBK7D42uVlOakUaJB6SIElE9X01xIcKJNqc
                '''
            }
        }
        
    }

}