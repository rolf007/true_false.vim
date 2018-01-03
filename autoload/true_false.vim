let s:dict = {'vim':[["true", "false"]], 'cpp':[["true", "false"]], 'python':[["True", "False"]]}

function! true_false#Toggle()
	if !has_key(s:dict, &ft)
		return
	endif
	let list_list = s:dict[&ft]
	let curpos = getcurpos()[1:]
	call search('\(\<\|\>\)', "bc", line('.'))
	let joined_list = []
	for list in list_list
		let joined_list += list
	endfor
	let pat = '\(\<' . join(joined_list, '\>\|\<') .  '\>\)'
	call search(pat, "c", line('.'))
	for i in range(len(list_list))
		for j in range(len(list_list[i]))
			if expand('<cword>') == list_list[i][j]
				execute "normal \"_cw" . list_list[i][(j+1)%len(list_list[i])] . "\<esc>"
				return
			endif
		endfor
	endfor
	call cursor(curpos)
endfunction

function! true_false#Add(ft, list)
	if !has_key(s:dict, a:ft)
		call true_false#Clear(a:ft)
	endif
	let s:dict[a:ft] += [a:list]
endfunction

function! true_false#Clear(ft)
	let s:dict[a:ft] = []
endfunction

function! true_false#ClearAll()
	let s:dict = {}
endfunction
