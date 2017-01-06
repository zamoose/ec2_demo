# Simple EC2 Ansible Spin-Up Demo
## In Brief
This project will spin up an EC2 `t1.micro` instance (using AWS credentials you supply) and will install and configure an Nginx web server and create a static HTML document that displays "Automation for the People".

## Prerequisites/Requirements
In order for this project to function correctly, you must be running [Ansible](https://github.com/ansible/ansible) locally. Unfortunately, Ansible-as-master-provisioner does not currently run directly on Windows hosts, so you must be running either Mac OS X or a flavor of Linux in order to run these steps correctly.

Additionally, you *must* have the Python [Boto](https://pypi.python.org/pypi/boto/) library installed in order for Ansible to be able to use the provided AWS dynamic inventory script.

### Installing Ansible and Boto
#### Mac OS X
OS X users should install [Homebrew](http://brew.sh/) using the method described on the Homebrew homepage. Once Homebrew is installed and configured correctly<sup id="a1">[1](#footnote1)</sup>, users should execute:

1. `brew install python`
2. `brew install ansible`
3. `sudo easy_install pip`
4. `sudo pip install boto`

### Expected Results
* An AWS EC2 `t1.micro` instance
  * Deployed using a CentOS 7 AWS marketplace image
  * Running the latest mainstream Nginx
* When visited with a web browser, the instance will display the message "Automation for the People".

<b id="footnote1">1</b> Homebrew automatically symlinks all the binaries it installs into `/usr/local/bin`. In order for these steps to work correctly, you should have `/usr/local/bin` *prior to any other binary locations* (such as `/bin`, `/usr/bin`, etc.) in your shell's `$PATH` [↩](#a1)