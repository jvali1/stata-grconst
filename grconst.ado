*! version 1.0 Jean-Victor Alipour, 09/2023

program define grconst	
	version 1.0

   syntax varlist(num), BY(varlist) [fill gen flag]
   	
	
   /*
	checks if values of var are constant within by-groups
	fill: option demands that missing obs are filled within by-groups; returns error 
		if there are conflicting non-missing values within by-groups 
	gen: gen new variable with missing values filled-in, default: replace
	flag: gen new variable _flag equal to 1 for by-groups that do not have constant values
   
   */
   tempvar grps tmp contr
 
	// sort
	sort `by' `varlist'

	// check if some by-groups have entirely missing values, and issue warning if this is the case
	cap by `by': assert `varlist'[1]!=.
	if _rc!=0 {
		di as text "Note: there are by-groups where *`varlist'* is entirely missing."
	}   

	// check if value is constant within by-groups
	cap by `by': assert `varlist'[1]==`varlist'[_N]
	if _rc!=0 {
		if "`fill'"=="" { 				// exit only if option FILL not specified		
			if "`flag'"!="" {			// flag groups if option specified
				cap by `by': gen _flag=(`varlist'[1]!=`varlist'[_N])
				lab var _flag "*`varlist'* not constant within `by'."
			}
			
			// extract number of by-groups
			qui by `by': gen byte `grps' = (_n==_N) 
			qui summ `grps'
			local n = r(sum)
			
			// extract number of contradictions
			cap by `by': gen `tmp'=(`varlist'[1]!=`varlist'[_N])
			qui by `by': gen byte `contr' = (_n==_N & `tmp'==1) 
			qui summ `contr'
			
			di as error "*`varlist'* is NOT constant within by-groups. There are `r(sum)' contradictions within `n' by-groups."
			exit 9
		}
	}
	else {
		di as text "*`varlist'* is constant within by-groups."
		exit 
	}

	*... if FILL is specified
	// check if NONMISSING values within by-groups are IDENTICAL
	cap by `by': assert `varlist'[_n]==`varlist'[_n-1] if !missing(`varlist') & _n>1
	if _rc!=0 {
		di as error "Nonmissing values of *`varlist'* are NOT constant within by-groups."
		exit 9
	}
	else {
		// if GEN option not specified: fill and replace
		if "`gen'"=="" {
			by `by': replace `varlist'=`varlist'[1]
		}
		// else create new variable w/ filled values `varlist'_fill 
		else {
			cap gen `varlist'_fill = `varlist'
			by `by': replace `varlist'_fill=`varlist'_fill[1]
			lab var `varlist'_fill "`varlist' with constant values within by-groups."
		}
	}

end