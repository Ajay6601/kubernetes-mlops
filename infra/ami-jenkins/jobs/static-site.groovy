multibranchPipelineJob('static-site-job') {
    branchSources {
        github {
            id('kubernetes-mlops-static-site')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('static-site')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}