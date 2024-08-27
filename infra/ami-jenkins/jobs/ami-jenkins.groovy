multibranchPipelineJob('ami-jenkins-job') {
    branchSources {
        github {
            id('kubernetes-mlops-ami-jenkins')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('ami-jenkins')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}