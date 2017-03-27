#!/bin/bash

echo "Current branch: ${TRAVIS_BRANCH}"

# Import GPG key
gpg --passphrase=${GPG_PASSPHRASE} --no-use-agent --output - keys.asc | gpg --import

# define a custom version for the pom
CUSTOM_VERSION=1.0.${TRAVIS_BUILD_NUMBER}

echo "Will use version ${CUSTOM_VERSION}"

# replace version in pom
sed -i -e "s/1.0-SNAPSHOT/${CUSTOM_VERSION}/g" pom.xml

# debugging purposes
cat pom.xml

# install archetype locally
mvn -V -B -s settings.xml -P gpg clean install

# create a dummy app based on it
cd target
mvn archetype:generate -DgroupId=myapp \
    -DartifactId=myapp \
    -DarchetypeGroupId=com.github.ngeor \
    -DarchetypeArtifactId=archetype-quickstart-jdk8 \
    -DarchetypeVersion=${CUSTOM_VERSION} \
    -DinteractiveMode=false \
    -DarchetypeCatalog=local

# test the dummy app
cd myapp
mvn test

# publish to nexus
if [ "${TRAVIS_BRANCH}" == "master" ]; then
    echo "publishing to maven"
    cd ../..
    mvn -V -B -s settings.xml -P gpg deploy
fi

gpg --fingerprint --with-colons ${GPG_KEY} |\
    grep "^fpr" |\
    sed -n 's/^fpr:::::::::\([[:alnum:]]\+\):/\1/p' |\
    xargs gpg --batch --delete-secret-keys

gpg --batch --yes --delete-key ${GPG_KEY}