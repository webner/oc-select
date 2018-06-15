# oc-select
Downloads and links to alternative openshift client versions.

All downloaded versions are stored in $HOME/.oc-select/. If you select a version the symbolic link $HOME/.local/bin/oc is created.

```
$ oc-select help

oc-select <command>|<version>
-----------------------------------------
help               show usage information
update             update version cache
list               list all versions
<version>          switch to oc <version>
```

```
$ oc-select 3.9
downloading https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz

$ oc version
oc v3.9.0+191fece
kubernetes v1.9.1+a0ce1bc657
features: Basic-Auth GSSAPI Kerberos SPNEGO
```


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
