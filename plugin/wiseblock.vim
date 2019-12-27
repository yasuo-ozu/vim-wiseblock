if exists('g:loaded_wisebrock')
	finish
endif

let g:loaded_wisebrock = 1

let s:save_cpo = &cpo
set cpo&vim

if get(g:, 'wisebrock_hook', 1)
	call wisebrock#AddHock()
endif

let &cpo = s:save_cpo
unlet s:save_cpo

