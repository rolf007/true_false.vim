"toggle true and false
function! TrueFalse()
	execute "normal ma"
	call search("\\\(\\<\\\|\\>\\\)", "bc", line('.'))
	call search("\\\(\\<true\\>\\\|\\<false\\>\\\)", "c", line('.'))
	if expand('<cword>') == "false"
		execute "normal \"_cwtrue"
	elseif expand('<cword>') == "true"
		execute "normal \"_cwfalse"
	else
		execute "normal `a"
	endif
endfunction
"map to Alt-a in normal mode
"nmap a :call TrueFalse()<CR>
