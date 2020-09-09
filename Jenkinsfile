pipeline {
	agent any
	
	parameters {
		string(name: 'Cluster_Owner', description: 'Cluster Owner', trim: true)
		string(name: 'GSA_name', description: 'GCP service account', trim: true)
		string(name: 'KSA_name', description: 'kubernetes service account', trim: true)
		string(name: 'Namespace', description: 'kubernetes namespace', trim: true)
		booleanParam(name: 'deploy_k8s_annotation', defaultValue: true, description: "Checked if you have GKE")
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
				sh (script:"""
					#gcloud iam service-accounts list|awk '{print \$1}'|grep  ^${GSA_name}\$|wc -l
					#gcloud iam service-accounts describe "${GSA_name}@bankentan-project.iam.gserviceaccount.com"
					#gcloud container clusters get-credentials tanyongjia-cluster --zone asia-northeast2-a
					#kubectl describe namespace ${Namespace}
					#kubectl describe serviceaccount ${KSA_name} --namespace ${Namespace}
					
					KSA=`kubectl get serviceaccount --namespace ${Namespace} |awk '{print \$1}'|grep "^${KSA_name}\$"| wc -l`
					if [ $KSA == 1 ];then
						echo "kube service account is in"
					else
						currentBuild.result = "FAILURE"
						return
					
				""")
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
