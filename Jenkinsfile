pipeline{

  agent any
  environment{
    PROJECT = "bankentan-project"
	TARGET_ENV_FOLDER = "dev"
  }
  
  stages{
    stage("check env"){
	  steps{
	    dir("${WORKSPACE}/terraform/${TARGET_ENV_FOLDER}"){
		  script{
		    sh("pwd")
			sh("ls -l")
		  }
		}
	  }
	}
  
    stage("terraform apply"){
	  steps{
	    dir("${WORKSPACE}/terraform/${TARGET_ENV_FOLDER}"){
          sh(script:"""
		    terraform init -no-color -backend=true -backend-config=bucket=bankentan -backend-config=prefix=terraform/state/sa-impersonation/${TARGET_ENV_FOLDER}
		    terraform workspace select ${PROJECT} 2> /dev/null || terraform workspace new ${PROJECT}
		    terraform destroy -no-color -auto-approve -var=gcp_project=${PROJECT} -var-file=policy-binding.tfvars
		    terraform show -no-color
		  """)
		}
	  }
	}
  }
  
  post{
    always{
	  echo "Clean up the job workspace"
	  cleanWs()
	}
  }
}
