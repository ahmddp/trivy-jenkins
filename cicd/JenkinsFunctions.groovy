def SetTagAndEnv()
{
    dir("${env.SERVICE_NAME}") {
        script {
            env.IMAGE_NAME = "nginx"
        }
    }
}

def BuildPublishDockerImage()
{
    dir("${env.SERVICE_NAME}") {
        echo "Build and publish docker image here"
    }
}

def ScanDockerImage()
{
    dir("${env.SERVICE_NAME}") {

        def statusCode = sh script:"./../cicd/scanDockerImage.sh ${env.IMAGE_NAME}", returnStatus:true
        if (statusCode!=0) {
            currentBuild.result = 'FAILURE'
            error "Docker Image couldn't pass Vulnerability scan."
        }        
    }
}

return this