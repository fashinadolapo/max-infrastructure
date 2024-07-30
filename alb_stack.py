from aws_cdk import (
    aws_elasticloadbalancingv2 as elbv2,
    core
)

class ALBStack(core.Stack):
    def __init__(self, scope: core.Construct, id: str, vpc, **kwargs) -> None:
        super().__init__(scope, id, **kwargs)

        # Create Application Load Balancer
        alb = elbv2.ApplicationLoadBalancer(
            self, 'ALB',
            vpc=vpc,
            internet_facing=True,
            load_balancer_name='max-alb'
        )

        # Create listener
        listener = alb.add_listener(
            'Listener',
            port=80,
            default_action=elbv2.ListenerAction.forward(
                target_groups=[alb.add_target_group(
                    'TargetGroup',
                    port=80,
                    protocol=elbv2.ApplicationProtocol.HTTP
                )]
            )
        )
