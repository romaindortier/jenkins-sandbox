set -e
java -Djenkins.install.runSetupWizard=false -jar /usr/share/jenkins/jenkins.war &
sh /wait4jenkins.sh
java -jar jenkins-cli.jar -s http://localhost:8080 install-plugin analysis-core analysis-collector checkstyle dry phing plot pmd
java -jar jenkins-cli.jar -s http://localhost:8080 safe-restart
# curl https://raw.githubusercontent.com/sebastianbergmann/php-jenkins-template/master/config.xml |
# java -jar jenkins-cli.jar -s http://localhost:8080 create-job php-template
# java -jar jenkins-cli.jar -s http://localhost:8080 reload-configuration
