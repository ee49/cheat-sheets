
### Yum Commands:
```bash
#To list all enabled repositories on your system
yum repolist

#list all disabled repositories on your system:
yum repolist --disabled

#list both enabled and disabled repositories
yum repolist --all

#list additional information about the repositories
yum repoinfo

#display information about one or more packages
yum info package-name

#Installing packages:
yum install package-name
#Install multiple packages:
yum install package-name-1 package-name-2

#nstalling packages on a multilib system (AMD64, Intel 64 machine), you can specify the architecture of the package by appending it to the package name
yum install package-name.arch

#If you know the name of the binary you want to install, but not the package name, you can use the path to the binary as an argument
yum install /usr/sbin/binary-file

#To install a previously-downloaded package from a local directory, use:
yum install /path/
```

#### Yum TRansactions:
```bash
#display a list of all the latest yum transactions,
yum history

#display a list of all the latest operations for a selected package
yum history list package-name

#examine a particular transaction, use
yum history info transactionID

#revert a particular transaction, use
yum history undo transactionID

#revert the last transaction, use
yum history undo last

#repeat a particular transaction, use:
yum history redo transactionID

#To repeat the last transaction, use:
yum history redo last

```
# References
[Readme Conventions](https://www.makeareadme.com/)
[Commands Sourced from](https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing-software-packages_configuring-basic-system-settings)
