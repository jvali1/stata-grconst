# grconst.ado
`grconst` is a command to check whether a numeric variable is constant within groups.
It can be used to flag groups where observations are not constant and to fill up missings when non-missing values are not conflicting within by-groups.

## Example
Suppose your data has the structure as shown below.
To check whether values of `land_area` are constant within `country`, type:
```stata
grconst land_area, by(country)
```
This will generate an error because countries A and B have conflicting values of `land_area`.
You can additionally flag these groups by adding the option `flag`.

To fill missing values with non-missing values add the option `fill`. This only works if the non-missing values are not conflicting, otherwise you get an error. Add the option `gen` if you want a new variable generated instead of the existing variable modified.
```stata
grconst land_area, by(country) fill
```

```
(original data)				(transformed data)
| country | year | land_area | 		| country | year | land_area |
|---------|------|-----------|		|---------|------|-----------|
| A       | 2000 | 1         |		| A       | 2000 | 1         |
| A       | 2001 | 1         |		| A       | 2001 | 1         |
| A       | 2002 | .         | ----->	| A       | 2002 | 1         |
| B       | 2000 | .         |		| B       | 2000 | 5         |
| B       | 2001 | .         |		| B       | 2001 | 5         |
| B       | 2002 | 5         |		| B       | 2002 | 5         |
| C       | 2000 | .         |		| C       | 2000 | .         |
| C       | 2001 | .         |		| C       | 2001 | .         |
| C       | 2002 | .         |		| C       | 2002 | .         |
```

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
