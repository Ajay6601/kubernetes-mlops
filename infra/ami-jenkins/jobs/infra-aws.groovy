multibranchPipelineJob('infra-aws-job') {
    branchSources {
        github {
            id('kubernetes-mlops-infra-aws')
            scanCredentialsId('git-credentials-id')
            repoOwner('Ajay6601')
            repository('infra-aws')
            buildForkPRMerge(true)
            buildOriginBranch(false)
            buildOriginBranchWithPR(false)
        }
    }
}