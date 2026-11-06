# Simple Interest Calculator

[![CI](https://github.com/AugmentChris/github-final-project/actions/workflows/ci.yml/badge.svg)](https://github.com/AugmentChris/github-final-project/actions/workflows/ci.yml)

A Bash script that calculates simple interest and the total amount owed. It supports decimal rates and validates every input.

## Usage

Interactive:

```bash
bash simple-interest.sh
```

With arguments (principal, annual rate in %, years):

```bash
bash simple-interest.sh 1000 2.5 3
# Simple interest: 75.00
# Total amount:    1075.00
```

Invalid input (letters, negative numbers) is rejected. In interactive mode the script asks again; with arguments it exits with status 1.

## Formula

```
simple interest = principal × rate × time / 100
```

## Tests

```bash
bash test.sh
```

CI runs [ShellCheck](https://www.shellcheck.net/) and the tests on every push.

## Authors

- Upkar Lidder (IBM): original script
- AugmentChris: decimal support, input validation, argument mode, tests

See [CONTRIBUTING.md](CONTRIBUTING.md) and [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
