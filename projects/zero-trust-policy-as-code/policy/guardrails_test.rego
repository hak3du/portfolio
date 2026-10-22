package terraform.guardrails

import rego.v1

test_public_ssh_is_denied if {
  count(deny) == 1 with input as {
    "resource_changes": [{
      "address": "aws_security_group.admin",
      "type": "aws_security_group",
      "change": {
        "actions": ["create"],
        "after": {"ingress": [{
          "from_port": 22,
          "to_port": 22,
          "protocol": "tcp",
          "cidr_blocks": ["0.0.0.0/0"],
          "ipv6_cidr_blocks": []
        }]}
      }
    }]
  }
}

test_public_rdp_is_denied if {
  count(deny) == 1 with input as {
    "resource_changes": [{
      "address": "aws_security_group.rdp",
      "type": "aws_security_group",
      "change": {
        "actions": ["create"],
        "after": {"ingress": [{
          "from_port": 3389,
          "to_port": 3389,
          "protocol": "tcp",
          "cidr_blocks": ["0.0.0.0/0"],
          "ipv6_cidr_blocks": []
        }]}
      }
    }]
  }
}

test_unencrypted_ebs_is_denied if {
  count(deny) == 1 with input as {
    "resource_changes": [{
      "address": "aws_ebs_volume.data",
      "type": "aws_ebs_volume",
      "change": {
        "actions": ["create"],
        "after": {"encrypted": false}
      }
    }]
  }
}

test_disabled_s3_public_access_guard_is_denied if {
  count(deny) == 1 with input as {
    "resource_changes": [{
      "address": "aws_s3_bucket_public_access_block.data",
      "type": "aws_s3_bucket_public_access_block",
      "change": {
        "actions": ["create"],
        "after": {
          "block_public_acls": true,
          "ignore_public_acls": true,
          "block_public_policy": false,
          "restrict_public_buckets": true
        }
      }
    }]
  }
}

test_private_ssh_rule_is_allowed if {
  count(deny) == 0 with input as {
    "resource_changes": [{
      "address": "aws_security_group.admin",
      "type": "aws_security_group",
      "change": {
        "actions": ["create"],
        "after": {"ingress": [{
          "from_port": 22,
          "to_port": 22,
          "protocol": "tcp",
          "cidr_blocks": ["10.0.0.0/16"],
          "ipv6_cidr_blocks": []
        }]}
      }
    }]
  }
}

test_destroy_only_change_is_ignored if {
  count(deny) == 0 with input as {
    "resource_changes": [{
      "address": "aws_ebs_volume.old",
      "type": "aws_ebs_volume",
      "change": {
        "actions": ["delete"],
        "after": null
      }
    }]
  }
}
