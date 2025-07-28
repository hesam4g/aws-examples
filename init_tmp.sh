#!/usr/bin/env zsh

# Update the credential here
export AWS_ACCESS_KEY_ID=YOUR_ACCESS_ID
export AWS_SECRET_ACCESS_KEY=YOUR_ACCESS_PASS

# Configure the rest of CLI configuration
export AWS_DEFAULT_REGION=ca-central-1
export AWS_CLI_AUTO_PROMPT=on-partial
export PATH=/usr/local/bin/:$PATH
autoload bashcompinit && bashcompinit
autoload -Uz compinit && compinit
complete -C '/usr/local/bin/aws_completer' aws
