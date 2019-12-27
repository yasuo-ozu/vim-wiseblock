if !exists('g:loaded_wisebrock')
	finish
endif

let s:save_cpo = &cpo
set cpo&vim

function! wisebrock#AddHock()
	let commands = ['c', 'd', 'v']
	let ranges = ['i', 'a']
	let bracket = ['(', '[', '{', '<', '"', "'", '`']
	for a in commands
		for b in ranges
			for c in bracket
				exe "nnoremap \<silent> " . a . b . c . " :call wisebrock#DoCommand('" . a . "', '" . b . "', '" . c . "')\<CR>"
			endfor
		endfor
	endfor
endfunction

function! wisebrock#DoCommand(key1, key2, begin)
	call feedkeys(a:key1 . a:key2 . a:begin, 'nx')
	if mode('.') == "i"
		return
	endif
	let pos = getpos('.')
	let i = stridx(getline('.'), a:begin, pos[2] - 1)
	if i < 0
		return
	endif
	let pos[2] = i + 1
	call setpos('.', pos)
	call feedkeys(a:key1 . a:key2 . a:begin, 'n')
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
