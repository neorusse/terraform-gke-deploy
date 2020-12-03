#!/bin/bash

set -ex

#--- Function to authenticate to docker hub ---#
docker_hub_auth() {
    if [[ $TRAVIS_BRANCH == "develop" ]] || \
        [[ $GITHUB_REF == "refs/heads/develop" ]] || \
        [[ $TRAVIS_BRANCH == "staging" ]] || \
        [[ $GITHUB_REF == "refs/heads/staging" ]] || \
        [[ $GITHUB_EVENT_NAME == "release" ]] || \
        [[ ! -z $TRAVIS_TAG ]]; then

        docker login -u=$DOCKER_ID -p=$DOCKER_PASSWD
    fi

}

#--- Build docker image and push---#
build_and_push_image() {

    if [[ $GITHUB_EVENT_NAME == "release" ]] || [[ ! -z $TRAVIS_TAG ]]; then

        docker build -t $REGISTRY_OWNER/activity:$APPLICATION_NAME-$APPLICATION_ENV-$TRAVIS_COMMIT -f docker-deploy/Dockerfile .
        echo "-------- Building Image Done! ----------"

        echo "++++++++++++ Push Image built -------"
        docker push $REGISTRY_OWNER/activity:$APPLICATION_NAME-$APPLICATION_ENV-$TRAVIS_COMMIT

    fi

    #--- Logout from docker ---#
    echo "--------- Logout dockerhub --------"
    docker logout
}


#--- main function ---#
main() {
    if [[ $TRAVIS_EVENT_TYPE != "pull_request" ]]; then

        #--- Run the auth fucntion ---#
        docker_hub_auth

        #--- Run the build function ---#
        build_and_push_image
    fi
}

#--- Run the main function ---#
main