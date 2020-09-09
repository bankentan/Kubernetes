pipeline {
	agent any
	
	parameters {
		string(name: 'Cluster_Owner', description: 'Cluster Owner', trim: true)
		string(name: 'GSA_name', description: 'GCP service account', trim: true)
		string(name: 'KSA_name', description: 'kubernetes service account', trim: true)
		string(name: 'Namespace', description: 'kubernetes namespace', trim: true)
		booleamParam(name: 'deploy_k8s_annotation', defaultValue: true, description: "Checked if you have GKE")
	}

	stages {
		stage('GKE credentials'){
			steps {
				sh (script:"""
					echo "get GKE credentials"
					gcloud auth list
				""")
			}
		}
		
		stage('get Google service account'){
			steps {
				script {
					GSA = """${sh(
						returnStdout: true,
						script: 'gcloud iam service-accounts describe ${GSA_name}\@bankentan-project.iam.gserviceaccount.com'
					}""";
				}
				
				sh(
					script:"""
						echo "${GSA}"
					"""
				)
			}
		}
		
		stage('get k8s service account'){
			steps {
				script {
					echo "${KSA_name}"
					sleep 5
				}
			}
		}
		
		stage('get k8s namespace'){
			steps {
				script {
					echo "${Namespace}"
					sleep 5	
				}
			}
		}	
	}
}
