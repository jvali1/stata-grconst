{smcl}
{* 18sep2023}
{title: Title}

{p 4 8}{cmd:grconst} - Stata module to check whether variable is constant within groups.

{p 8 17 2}
{cmd:grconst}
{varname}
{cmd:,} {opt by}{cmd:(}{varlist}{cmd:)} [{opt flag} {opt fill} {opt gen}]

{title: Description}

{p 4 8}{cmd:grconst} is a command to check whether a numeric {varname} is constant within groups specified in {cmd: by()}. If no conflicts are detected null assersion is issued otherwise an error is thrown.
You can flag groups where observations are not constant and fill up missings (in case non-missing values are not conflicting within by-groups).


{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}

{synopt:{opt flag}} Generate a new variable {it:_flag} equal to one for groups that have conflicting values of {varname}.

{synopt:{opt fill}} Fills up missing values within by-groups with corresponding non-missing values. This only works if non-missing values are not conflicting; otherwise an error is issued.

{synopt:{opt gen}} Demands that a new variable  {varname}{it:_fill} be generated instead of replacing missing values in {it: varname}. This is only relevant when option {opt fill} is specified.

{title: Example}

Suppose your data has the structure as shown below. To check whether values of {it:land_area} are constant within {it:country}, type:

{synopt: grconst land_area, by(country)}

This will generate an error because countries A and B have conflicting values of {it:land_area}. You can additionally flag these groups by adding the option {opt flag}.

To fill missing values with non-missing values add the option {opt flag}. This only works if the non-missing values are not conflicting, otherwise you get an error.
Add the option {opt gen} if you want a new variable generated instead of the existing variable modified.

{synopt: grconst land_area, by(country) fill}

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


{title:Author}

{p 4}Jean-Victor Alipour{p_end}
{p 4}LMU Munich & ifo Institute{p_end}
{p 4}{browse "https://sites.google.com/view/jv-alipour/"}{p_end}
