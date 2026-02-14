# Despliegue del Operador K8sGPT para análisis de errores con IA
resource "helm_release" "k8sgpt_operator" {
  name             = "k8sgpt-operator"
  repository       = "https://charts.k8sgpt.ai/"
  chart            = "k8sgpt-operator"
  namespace        = "k8sgpt-operator-system"
  create_namespace = true

  set {
    name  = "serviceMonitor.enabled"
    value = "true" # Habilita métricas para Prometheus
  }

  # Asegura que Prometheus esté instalado antes de intentar crear ServiceMonitors
  depends_on = [helm_release.kube_prometheus_stack]
}