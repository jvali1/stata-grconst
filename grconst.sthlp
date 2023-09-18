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
Command can be used to flag groups where observations are not constant and to fill up missings (in case non-missing values are not conflicting within by-groups).


{synoptset 22 tabbed}{...}
{synopthdr}
{synoptline}

{synopt:{opt flag}} Generate a new variable {it:_flag} equal to one for groups that have conflicting values of {varname}.

{synopt:{opt fill}} Fills up missing values within by-groups with corresponding non-missing values. This only works if non-missing values are not conflicting; otherwise an error is issued.

{synopt:{opt gen}} Demands that a new variable  {varname}{it:_fill} be generated instead of replacing missing values in {it: varname}. This is only relevant when option {opt fill} is sepcified.

{title:Author}

{p 4}Jean-Victor Alipour{p_end}
{p 4}LMU Munich & ifo Institute{p_end}
{p 4}{browse "https://sites.google.com/view/jv-alipour/"}{p_end}
