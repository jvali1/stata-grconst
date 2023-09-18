# grconst.ado
`grconst` is a command to check whether a numeric variable is constant within groups.
It can be used to flag groups where observations are not constant and to fill up missings when non-missing values are not conflicting within by-groups.


## Installation
To install from Github, type:

```stata
cap ado uninstall grconst
net install grconst, from("https://raw.githubusercontent.com/jvali1/stata-grconst/master/")
```

For questions and suggestions, please contact:  
Jean-Victor Alipour  
LMU Munich & ifo Institute  
alipour@ifo.de  
