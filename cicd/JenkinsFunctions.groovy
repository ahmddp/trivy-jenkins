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

    sh script:"./../cicd/createArtifact.sh"
    archiveArtifacts artifacts: 'FullScanReport.txt', fingerprint: true
}


return this