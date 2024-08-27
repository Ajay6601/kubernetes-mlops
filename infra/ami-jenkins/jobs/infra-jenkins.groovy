multibranchPipelineJob('infra-jenkins-job') {
    branchSources {
        github {
            id('kubernetes-mlops-infra-jenkins')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('infra-jenkins')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}