pipeline {
agent any
stages {
stage('Checkout') {
steps {
git 'https://github.com/jielin2019-gbg/fooproject.git' } }
stage('Build') {
steps {
bat "mvn compile"
} }
stage('Test') {
steps {
bat "mvn test"
}
post {
always {
junit '**/TEST*.xml'
} } } } }