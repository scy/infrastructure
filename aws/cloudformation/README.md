# CloudFormation Templates

## `cloudtrail.template`

This template defines a global CloudTrail trail and signed logging to S3. Nothing too fancy there.

I should never have to delete the single stack created from this template, but when I do, manual intervention will be necessary because the S3 bucket can't be removed unless it's empty.

## `policy.template`

This template defines a basic set of users and policies.

### The `scy` user

This is the user I usually work as.

Note that the template doesn't create a login profile for this user. This is because I would have to specify the password unencrypted in the template. How about no. You have to set a password manually after creating the stack.

However, deleting this user (for example when deleting the stack for whatever reason) will fail if it has a password. You'll have to _remove_ it manually as well before deleting the stack.

### The `CloudFormationUsers` group

Members of this group have _almost_ full access to CloudFormation. (Note that this does not automatically mean that they have access to the _services_ and _resources_ CloudFormation works with.)

They are not allowed to delete stacks at the moment. A whitelist of stacks will be added if the need arises.

They also are not allowed to create or update stacks if the stack's name starts with `x-`. These stacks are created and maintained by more privileged accounts. Examples would be the policy stack itself, or the CloudTrail stack.

### The `CloudFrontAdmins` group

Members of this group have admin access to the CloudFront features I currently use, which means: read access to everything, creating/updating/deleting distributions.

### The `DNSAdmins` group

Members of this group have read access to registered domains, check unregistered ones for availability and see billing data. They are also allowed to create/update/delete hosted zones and their record sets. For interoperability with EC2, they can describe VPCs and regions as well.