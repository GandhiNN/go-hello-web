#!/usr/bin/env groovy

/* This will start an executor on a Jenkins agent with
 * the docker label */  
node('docker') {
    /* Setup vars */
    String appName = "basic-html"
    String goPath = "/go/src/github.com/GandhiNN/${applicationName}"

    /* Checkout the code from GitHub */
    /* Stages allow Jenkins to visualize the different 
     * sections of our build steps in the UI */
    stage('Clone SCM Repository') {
         checkout scm
    }

    /* Start a docker container using the golang:1.8.0-alpine image
     * mount the current directory to goPath */
    stage('Build Go Binaries') {
        docker.image("golang:1.8.0-alpine").inside("-v ${pwd()}:${goPath}") {
            // build the Mac x64 binary
            sh "cd ${goPath} && GOOS=darwin GOARCH=amd64 go build -o binaries/amd64/darwin/${appName}.darwin.amd64"
            // build the Windows x64 binary
            sh "cd ${goPath} && GOOS=windows GOARCH=amd64 go build -o binaries/amd64/windows/${appName}.windows.amd64.exe"
            // build the Linux x64 binary
            sh "cd ${goPath} && GOOS=linux GOARCH=amd64 go build -o binaries/amd64/linux/${appName}.linux.amd64"
        }
    }

    stage("Archive artifacts") {
        /* Archive the binary files in Jenkins so we can 
         * retrieve them later should we need to audit them */
         archiveArtifacts artifacts: 'binaries/**', fingerprint: true
    }
}