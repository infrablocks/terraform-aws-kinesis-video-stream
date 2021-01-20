terraform kinesis video stream
=========================

[![circleci](https://circleci.com/gh/infrablocks/terraform-aws-kinesis-video-stream.svg?style=svg)](https://circleci.com/gh/infrablocks/terraform-aws-kinesis-video-stream)

Terraform module to create a Kinesis video stream


##usage

-----

to use the module, include something like the following in your terraform 
configuration:

```hcl-terraform
module "kinesis_video_stream" {
  source = "infrablocks/kinesis-video-stream/aws"
  component = "kafka-cluster"
  deployment_identifier = "dev"
  stream_name = "webcam"
  retention = 10
 }
```


### inputs

| name                                       | description                                                                                                      | default            | required                                 |
|--------------------------------------------|------------------------------------------------------------------------------------------------------------------|:------------------:|:----------------------------------------:|
|region|
|stream_name|
|retention|
|media_type|
|tags|

### outputs

| name                      | description                                                                      |
|---------------------------|----------------------------------------------------------------------------------|
| cluster_id                | the id of the created msk cluster                                                |
| cluster_name              | the name of the created msk cluster                                              |
| cluster_arn               | the arn of the created msk cluster                                               |
|security_group_id|




development
-----------

### machine requirements

in order for the build to run correctly, a few tools will need to be installed 
on your development machine:

* ruby (2.3.1)
* bundler
* git
* git-crypt
* gnupg
* direnv

#### mac os x setup

installing the required tools is best managed by [homebrew](http://brew.sh).

to install homebrew:

```
ruby -e "$(curl -fssl https://raw.githubusercontent.com/homebrew/install/master/install)"
```

then, to install the required tools:

```
# ruby
brew install rbenv
brew install ruby-build
echo 'eval "$(rbenv init - bash)"' >> ~/.bash_profile
echo 'eval "$(rbenv init - zsh)"' >> ~/.zshrc
eval "$(rbenv init -)"
rbenv install 2.3.1
rbenv rehash
rbenv local 2.3.1
gem install bundler

# git, git-crypt, gnupg
brew install git
brew install git-crypt
brew install gnupg

# direnv
brew install direnv
echo "$(direnv hook bash)" >> ~/.bash_profile
echo "$(direnv hook zsh)" >> ~/.zshrc
eval "$(direnv hook $shell)"

direnv allow <repository-directory>
```

### running the build

to provision module infrastructure, run tests and then destroy that 
infrastructure, execute:

```bash
./go
```

to provision the module prerequisites:

```bash
./go deployment:prerequisites:provision[<deployment_identifier>]
```

to provision the module contents:

```bash
./go deployment:harness:provision[<deployment_identifier>]
```

to destroy the module contents:

```bash
./go deployment:harness:destroy[<deployment_identifier>]
```

to destroy the module prerequisites:

```bash
./go deployment:prerequisites:destroy[<deployment_identifier>]
```


### common tasks

#### generating an ssh key pair

to generate an ssh key pair:

```
ssh-keygen -t rsa -b 4096 -c integration-test@example.com -n '' -f config/secrets/keys/bastion/ssh
```

#### managing circleci keys

to encrypt a gpg key for use by circleci:

```bash
openssl aes-256-cbc \
  -e \
  -md sha1 \
  -in ./config/secrets/ci/gpg.private \
  -out ./.circleci/gpg.private.enc \
  -k "<passphrase>"
```

to check decryption is working correctly:

```bash
openssl aes-256-cbc \
  -d \
  -md sha1 \
  -in ./.circleci/gpg.private.enc \
  -k "<passphrase>"
```

contributing
------------

bug reports and pull requests are welcome on github at 
https://github.com/tobyclemson/terraform-aws-kinesis-video-stream. this project is 
intended to be a safe, welcoming space for collaboration, and contributors are 
expected to adhere to the 
[contributor covenant](http://contributor-covenant.org) code of conduct.


license
-------

the library is available as open source under the terms of the 
[mit license](http://opensource.org/licenses/mit).
