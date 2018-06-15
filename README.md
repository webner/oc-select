# oc-select
Downloads and links to alternative openshift client versions.

## Dependencies
The scripts needs following packages: wget tar curl jq

## Installation
```
mkdir -p $HOME/.local/bin
cd $HOME/.local/bin
wget -q https://raw.githubusercontent.com/webner/oc-select/master/oc-select
chmod +x oc-select
```

Add $HOME/.local/bin to your PATH.
```
export PATH="$PATH:$HOME/.local/bin"
```

## Usage

```
$ oc-select help

oc-select <command>|<version>
-----------------------------------------
help               show usage information
update             update version cache
list               list all versions
<version>          switch to oc <version>
```

## Select a version
```
$ oc-select 3.9
downloading https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz

$ oc version
oc v3.9.0+191fece
kubernetes v1.9.1+a0ce1bc657
features: Basic-Auth GSSAPI Kerberos SPNEGO
```

All downloaded versions are stored in $HOME/.oc-select. For the selected version the symbolic link $HOME/.local/bin/oc is updated.

## List all available versions
```
$ oc-select list

v3.9.0 (current)
v3.7.2 (not installed)
v3.7.1 (not installed)
v3.7.0 (not installed)
v3.6.1 (not installed)
v3.6.0 (not installed)
v1.5.1 (not installed)
v1.5.0 (not installed)
```
