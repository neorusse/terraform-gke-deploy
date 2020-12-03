#!/bin/bash

set +ex

#--- Function to provision the GKE cluster ---#
provision_cluster() {

    #--- Initialize terraform ---#
    echo " ----- inititalizing terraform workspace --------- "
    terraform init

    #--- Run terraform command to plan infrastructure ---#
    echo "----- show plan ------------"
    terraform plan

    #--- Apply the changes ---#
    echo "------ Provisioning the GKE Cluster ------"
    terraform apply || echo "Resources exist"

}

#--- Retrieve cluster access credentials & automatically configure kubectl ---#
install_kubectl() {
    
    echo "++++++++++++ install kubectl ++++++++++++"
    gcloud container clusters get-credentials $(terraform output kubernetes_cluster_name) --region $(terraform output region)
    
    # fetch cluster nodes
    kubectl get nodes

    echo "+++ Kubectl installed and configured to access cluster +++++"
}

#--- Main function ---#
main() {
    cd infrastructure

    #--- Run the provision cluster function ---#
    provision_cluster

    #--- Install kubectl ---#
    install_kubectl

    cd ..

}

#--- Run the main function ---#
main