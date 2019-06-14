#!/bin/bash

brew install rbenv
rbenv install 2.6.3
# rbenv global 2.6.3
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
gem install bundler