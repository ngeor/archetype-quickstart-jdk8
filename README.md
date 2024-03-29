# archetype-quickstart-jdk8

[![Maven Central](https://img.shields.io/maven-central/v/com.github.ngeor/archetype-quickstart-jdk8.svg?label=Maven%20Central)](https://search.maven.org/search?q=g:%22com.github.ngeor%22%20AND%20a:%22archetype-quickstart-jdk8%22)
[![Java CI with Maven](https://github.com/ngeor/archetype-quickstart-jdk8/actions/workflows/maven.yml/badge.svg)](https://github.com/ngeor/archetype-quickstart-jdk8/actions/workflows/maven.yml)

A Maven archetype for a simple Java app, updated for Java 8.

**Archived project!**
This project is **archived** and will be **removed**.
It has moved [here](https://github.com/ngeor/kamino/tree/master/archetypes/archetype-quickstart-jdk8).

This is effectively the same as the maven-archetype-quickstart,
with the following changes:

- Java version set to 8
- jUnit 5
- fixed indentation and formatting (4 spaces)
- removed typo "rigourous" from `AppTest.java` because it is annoying

## Additional features

In addition to the improvements mentioned above,
the following new features are implemented:

- .gitignore file
- checkstyle rules
- enforcer plugin
- checkstyle plugin
- jacoco plugin
- javadoc plugin

## Usage

The artifactId is `archetype-quickstart-jdk8`
and the groupId is `com.github.ngeor`.

To create a new app based on it:

```
mvn archetype:generate -DgroupId=com.mycompany.myapp \
    -DartifactId=myapp \
    -DarchetypeGroupId=com.github.ngeor \
    -DarchetypeArtifactId=archetype-quickstart-jdk8 \
    -DarchetypeVersion=2.8.0 \
    -DinteractiveMode=false
```

Tip: double check `2.8.0` is the latest version, in case this README is outdated
(happens to the best of us).

## Contributing

If you want to make changes, you'll need to test the archetype locally.

- Clone the repository
- Use `mvn install` to have the archetype available locally

To test it, generate a dummy app. The command is the same as above, but
pass `-DarchetypeCatalog=local` to make sure it's not using the internet
