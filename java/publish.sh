#!/usr/bin/env bash
set -x

VERSION="${1:-*}"

mvn -X deploy:deploy-file \
  -Dfile=target/rocksdbjni-$VERSION.jar \
  -DpomFile=pom.xml \
  -Djavadoc=target/rocksdbjni-$VERSION-javadoc.jar \
  -Dsources=target/rocksdbjni-$VERSION-sources.jar \
  -DrepositoryId=space-intellij-dependencies \
  -Durl=https://packages.jetbrains.team/maven/p/ij/intellij-dependencies

