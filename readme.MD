# Info

This gem takes the diff between two Huawei Balong modem files (with the help of [balong-nvtool](https://github.com/forth32/balong-nvtool)). Please excuse the Russian.

This gem will print all the different address names between the two modem files.

## Pre-reqs

Ensure gems are installed

```bash
bundle install --binstubs
```

## Execution instructions

```bash
balongdiffer <modem_one> <modem_two> > diffs.txt
```
