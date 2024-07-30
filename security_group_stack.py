from aws_cdk import (
    aws_ec2 as ec2,
    core
)

class SecurityGroupStack(core.Stack):
    def __init__(self, scope: core.Construct, id: str, vpc, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        # Create security group
        security_group = ec2.SecurityGroup(
            self, 'SecurityGroup',
            vpc=vpc,
            description='Allow inbound traffic on port 80'
        )

        # Allow inbound traffic on port 80
        security_group.add_ingress_rule(
            peer=ec2.Peer.any_ipv4(),
            connection=ec2.Port.tcp(80),
            description='Allow inbound traffic on port 80'
        )
