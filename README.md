# Poper


[![Code Climate](https://codeclimate.com/github/mmozuras/poper.png)](https://codeclimate.com/github/mmozuras/poper)
[![Build Status](https://travis-ci.org/mmozuras/poper.png)](https://travis-ci.org/mmozuras/poper)
[![Gem Version](https://badge.fury.io/rb/poper.png)](http://badge.fury.io/rb/poper)
[![Dependency Status](https://gemnasium.com/mmozuras/poper.png)](https://gemnasium.com/mmozuras/poper)

Poper makes sure that your git commit messages are well-formed. It's partly
inspired by [this article][] written by [tpope][]. Rules specified there form
the basis of [Poper rules][]. But Poper doesn't stop there. It also doesn't
like generic commit messages like 'oops, fix tests'. Poper was created to be
used by [Pronto][], but will work perfectly well in whatever scenario you'll
come up for it!

## Usage

![Poper demo](poper.gif "")

Install Poper like any other gem and then run it from your terminal, specifying
a commit:

```bash
  gem install poper
  cd /repo/which/commits/you/want/to/check
  poper run HEAD~3
```

Every commit between current HEAD and specified commit will be checked.

[this article]: http://tbaggery.com/2008/04/19/a-note-about-git-commit-messages.html
[tpope]: https://twitter.com/tpope
[Poper rules]: https://github.com/mmozuras/poper/tree/master/lib/poper/rule
[Pronto]: https://github.com/mmozuras/pronto
