resource "helm_release" "k8sgpt_operator" {
  name       = "k8sgpt-operator"
  repository = "https://charts.k8sgpt.ai/"
  chart      = "k8sgpt-operator"
  namespace  = "k8sgpt-operator-system"
  create_namespace = true

  # Esto instala el operador que permite crear recursos tipo "K8sGPT"
  # Una vez instalado, podrás configurar el backend (OpenAI, Amazon Bedrock, etc.)
  # mediante kubectl o un manifiesto adicional.
  
  set {
    name  = "serviceMonitor.enabled"
    value = "true" # Integración con Prometheus si está disponible
  }
}