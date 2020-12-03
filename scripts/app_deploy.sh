#!/bin/bash

set +ex

#@--- Function to deploy the app ---@#
deploy_app() {

    echo "----- Deploy and access K8s Dashboard ------"
    kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.0.0-beta8/aio/deploy/recommended.yaml

    echo "-- creating a proxy server that will give us access to the dashboard ----"
    kubectl proxy

    cd k8s-manifests

    echo "----- Authenticate to K8s Dashboard ------"
    kubectl apply -f k8s-dashboard-admin-rbac.yaml

    echo "----- Hurray! deployment successfull ------"

}

#--- Main Function ---#
main() {

    if [[ $TRAVIS_EVENT_TYPE != "pull_request" ]]; then

        #--- Run deployment functio ---#
        deploy_app
    fi

}

#@--- Run the main function ---@#
main