# Poper

[![Build Status](https://travis-ci.org/mmozuras/poper.png)](https://travis-ci.org/mmozuras/poper)
+[![Coverage Status](https://img.shields.io/codeclimate/coverage/github/mmozuras/poper.svg)](https://codeclimate.com/github/mmozuras/poper)
+[![Code Climate](https://codeclimate.com/github/mmozuras/poper.svg)](https://codeclimate.com/github/mmozuras/poper)
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

## Configuration

The behavior of Poper can be controlled via the `.poper.yml` configuration
file. It must be placed in your project directory. A sample file, `.poper.sample.yml`, is included
for easy setup.

The file has the following format:

```yaml
disallow_single_word:
  enabled: true

character_limit:
  enabled: true
  number: 72

summary_character_limit:
  enabled: true
  number: 50

disallow_generic:
  enabled: true
  words:
    - fix
    - fixed
    - fixes
    - oops
    - todo
    - fixme
    - commit
    - changes
    - hm
    - hmm
    - hmmm
    - test
    - tests
    - quickfix

enforce_capitalized:
  enabled: true
```

All properties that can be specified via `.poper.yml`, can also be specified via environment
variables. Their names will be the upcased path to the property. For example:
`POPER_ENFORCE_CAPITALIZED_ENABLED` or `POPER_DISALLOW_GENERIC_WORDS`. (In the case of the latter,
since environment variables don't support arrays, use a comma-separated list of words and poper will
parse them appropriately.) Environment variables will always take precedence over values in
configuration file.

## Ignoring commits

```
Merge pull request #12345 from myLongUsername/plus-a-long-feature-branch-name
```
The above commit message would fail the `character_limit` and `summary_character_limit` checks
unless the number of allowed characters were set to a high number. Since the commit was
automatically generated, it may not be desirable to check it.

You can ignore commit messages matching a certain pattern by adding the following settings either to
`character_limit` or `summary_character_limit`:

```yaml
# Adding to .poper.yml

character_limit:
  ignore_if_message_matches: '^Merge pull request'

summary_character_limit:
  ignore_if_summary_matches: '^Merge pull request'
```

```
# Or to ENV vars

POPER_CHARACTER_LIMIT_IGNORE_IF_MESSAGE_MATCHES='^Merge pull request'
POPER_SUMMARY_CHARACTER_LIMIT_IGNORE_IF_SUMMARY_MATCHES='^Merge pull request'
```

Note there is a naming difference: `ignore_if_message_matches` versus `ignore_if_summary_matches`.

With a few exceptions, the string you pass to this setting will be used to create a regular
expression directly.
```ruby
Regexp.new('^Merge pull request')
```

The ignore settings are `nil` by default. If a setting is `nil` or `false`, its rule ignores no
commit messages. If a setting is `true`, it ignores ALL commit messages (not recommended).

If you want to escape a character in a pattern string, you will need to escape it twice.
For example:
```ruby
string = "Look: ^ a caret"
escaped_once = "Look: \^ a caret"
escaped_twice = "Look: \\^ a caret"

Regexp.new(escaped_once).match?(string)  # => false
Regexp.new(escaped_twice).match?(string) # => true
```
This is necessary because Ruby encloses all strings in double quotes when it loads the configuration
YAML.