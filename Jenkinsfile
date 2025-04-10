pipeline {
    agent any
    environment {
        DOCKER_HUB_REPO = "ajay6601/kubernetes-mlops"
        DOCKER_HUB_CREDENTIALS_ID = "kubernetes-mlops"
    }
    stages {
        stage('Checkout Github') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'kubernetes-mlops', url: 'https://github.com/Ajay6601/kubernetes-mlops.git']])
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                script {
                    // Build the Docker image and assign it to a variable
                    dockerImage = docker.build("${DOCKER_HUB_REPO}:latest")
                }
            }
        }
        stage('Push Image to DockerHub') {
            steps {
                script {
                    echo 'Pushing Docker image to DockerHub...'
                    docker.withRegistry('https://registry.hub.docker.com', "${DOCKER_HUB_CREDENTIALS_ID}") {
                        dockerImage.push('latest')
                    }
                }
            }
        }
        stage('Install Kubectl & ArgoCD CLI') {
            steps {
                sh '''
                echo 'Installing Kubectl and ArgoCD CLI...'
                curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
                chmod +x kubectl
                mv kubectl /usr/local/bin/kubectl
                curl -sSL -o /usr/local/bin/argocd https://github.com/argoproj/argo-cd/releases/latest/download/argocd-linux-amd64
                chmod +x /usr/local/bin/argocd
                '''
            }
        }
        stage('Apply Kubernetes & Sync App with ArgoCD') {
            steps {
                echo 'Applying Kubernetes and syncing with ArgoCD...'
                script{
                    kubeconfig(credentialsId: 'kubeconfig', serverUrl: 'https://192.168.49.2:8443') {
                    sh '''
                    argocd login 35.239.210.209:32594 --username admin --password $(kubectl get secret -n argocd argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d) --insecure
                    argocd app sync kubernetes-mlops
                    '''
                }
            }
        }
    }
}
