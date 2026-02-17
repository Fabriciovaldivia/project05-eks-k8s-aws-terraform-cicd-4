resource "aws_iam_role" "eks_cluster" {
  name = "project03-eks-role"

  assume_role_policy = data.aws_iam_policy_document.eks_assume.json
}
