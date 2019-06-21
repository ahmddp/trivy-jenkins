#!/usr/bin/env groovy

pipeline {
    environment {
        SERVICE_NAME =  "trivy-scan"
    }

    agent any

    stages {

        stage('Set Tag & Common Environment Variables') {
            steps {
                script {
                    functions = load "${WORKSPACE}/cicd/JenkinsFunctions.groovy"
                    functions.SetTagAndEnv()
                }
            }
        }        

        stage('Build & Publish Docker image') {
            steps {
                script {
                    functions.BuildPublishDockerImage()
                }
            }
        }
    }
}