pipelineJob('helm-autoscaler-eks-remote-job') {
    triggers {
        githubPush()
    }
    definition {
        cpsScm {
            lightweight(true)
            scm {
                git {
                    remote {
                        url('https://github.com/Ajay6601/kubernetes-mlops.git')
                        credentials('git-credentials-id')
                    }
                    branch('main')
                }
            }
            scriptPath('Jenkinsfile')
        }
    }
}
