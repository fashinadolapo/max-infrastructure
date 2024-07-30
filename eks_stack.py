from aws_cdk import (
    aws_eks as eks,
    core
)

class EKSStack(core.Stack):
    def __init__(self, scope: core.Construct, id: str, vpc, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        # Create EKS cluster
        cluster = eks.Cluster(
            self, 'EKS',
            vpc=vpc,
            cluster_name='max-eks',
            version=eks.KubernetesVersion.V1_21,
            default_capacity=1,
            instance_type=eks.InstanceType('t3.medium')
        )
