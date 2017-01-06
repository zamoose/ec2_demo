# Simple EC2 Ansible Spin-Up Demo
## In Brief
This project will spin up an EC2 `t1.micro`<sup id="a0">[0](#footnote0)</sup> instance (using AWS credentials you supply) and will install and configure an Nginx web server and create a static HTML document that displays "Automation for the People".

## Prerequisites/Requirements
In order for this project to function correctly, you must be running [Ansible](https://github.com/ansible/ansible) locally. Unfortunately, Ansible-as-master-provisioner does not currently run directly on Windows hosts, so you must be running either Mac OS X or a flavor of Linux in order to run these steps correctly<sup id="a1">[1](#footnote1)</sup>.

Additionally, you *must* have the Python [Boto](https://pypi.python.org/pypi/boto/) library installed in order for Ansible to be able to use the provided AWS dynamic inventory script.

### Installing Ansible and Boto
#### Linux
Linux users may use their distributions' repositories and respective package managers in order to install Ansible and Boto.

##### CentOS
CentOS users should make sure that they have the [EPEL repository](https://fedoraproject.org/wiki/EPEL) installed and enabled before proceeding.

1. `sudo yum install epel-release`
2. `sudo yum update`
3. `sudo yum install ansible`
4. `sudo yum install python2-boto`

##### Ubuntu
Ubuntu requires a few more steps in order to install Ansible.

1. `sudo apt-get install software-properties-common`
2. `sudo apt-add-repository ppa:ansible/ansible`
3. `sudo apt-get update`
4. `sudo apt-get install ansible`
5. `sudo apt-get install python-pip`
6. `sudo pip install boto`

#### Mac OS X
OS X users should install [Homebrew](http://brew.sh/) using the method described on the Homebrew homepage. Once Homebrew is installed and configured correctly<sup id="a2">[2](#footnote2)</sup>, users should execute:

1. `brew install python`
2. `brew install ansible`
3. `sudo easy_install pip`
4. `sudo pip install boto`

### AWS Account Assumptions
* You already have an AWS account in good standing
* Said account has an IAM identity able to create EC2 instances
  * Said IAM identity has an associated ID and secret key
  * You have both ID and secret key readily accessible
* You have visited the [CentOS 7 AMI page](http://aws.amazon.com/marketplace/pp?sku=aw0evgkw8e5c1q413zgy5pjce) while logged in to this AWS account and have clicked the "Continue" button and accepted the licensing agreement on the page that follows

### Configuring Your Environment
In order for the Ansible tasks to complete successfully, you will need to alter the provided `runbook.sh` and add your AWS secret account information.

Change these lines to match your preferences (found in the `AWS Account Assumptions` above):
```
export AWS_ACCESS_KEY_ID=[Your Access Key ID]
export AWS_SECRET_ACCESS_KEY=[Your Secret Key]
export AWS_REGION=[Your preferred AWS region]
```

## Running Ansible
### Expected Results
* An AWS EC2 `t1.micro` instance
  * Deployed using a CentOS 7 AWS marketplace image
  * Running the latest mainstream Nginx
* When visited with a web browser, the instance will display the message "Automation for the People".

===
### Footnotes
<b id="footnote0">0</b> [http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts_micro_instances.html](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts_micro_instances.html)[↩](#a0)

<b id="footnote1">1</b> I have found that the Python environments across various Mac OS X distros and even simply between machines can vary greatly, even to such an extent as to have a task that works on one El Capitan machine utterly fail on another. I recommend using a Linux machine (a Vagrant box will do nicely) to run these steps if at all possible.[↩](#a1)

<b id="footnote2">2</b> Homebrew automatically symlinks all the binaries it installs into `/usr/local/bin`. In order for these steps to work correctly, you should have `/usr/local/bin` *prior to any other binary locations* (such as `/bin`, `/usr/bin`, etc.) in your shell's `$PATH` [↩](#a2)