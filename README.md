# Poper

Poper makes sure that your git commit messages are well-formed

[![Code Climate](https://codeclimate.com/github/mmozuras/poper.png)](https://codeclimate.com/github/mmozuras/poper)
[![Build Status](https://travis-ci.org/mmozuras/poper.png)](https://travis-ci.org/mmozuras/poper)
[![Gem Version](https://badge.fury.io/rb/poper.png)](http://badge.fury.io/rb/poper)
[![Dependency Status](https://gemnasium.com/mmozuras/poper.png)](https://gemnasium.com/mmozuras/poper)

## Usage

Poper is partly inspired by an [article](http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html) written by [tpope](https://twitter.com/tpope). That's where the name comes from actually. Rules from the article form the basis of [Poper rules](https://github.com/mmozuras/poper/tree/master/lib/poper/rule).

![Poper demo](poper.gif "")

Install Poper like any other gem and then run it from your terminal, specifying
a commit:

```bash
  gem install poper
  cd /repo/which/commits/you/want/to/check
  poper run 86ae550
```

Every commit between current HEAD and specified commit will be checked.
