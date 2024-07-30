import * as ec2 from 'aws-cdk-lib/aws-ec2';
import * as cdk from 'aws-cdk-lib';

    // 👇 Create a SG for a web server
    const webserverSG = new ec2.SecurityGroup(this, 'web-server-sg', {
      vpc,
      allowAllOutbound: true,
      description: 'security group for a web server',
    });

    webserverSG.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(22),
      'allow SSH access from anywhere',
    );

    webserverSG.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(80),
      'allow HTTP traffic from anywhere',
    );

    webserverSG.addIngressRule(
      ec2.Peer.anyIpv4(),
      ec2.Port.tcp(443),
      'allow HTTPS traffic from anywhere',
    );

    webserverSG.addIngressRule(
      ec2.Peer.ipv4('123.123.123.123/16'),
      ec2.Port.allIcmp(),
      'allow ICMP traffic from a specific IP range',
    );
  }
}
