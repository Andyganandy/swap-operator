if exists("g:switcharoo_plug_loaded")
    finish
endif
let g:switcharoo_plug_loaded = 1

function Switcharoo(type = '') abort
  if a:type == ''
    set opfunc=Switcharoo
    return 'g@'
  endif

  let sel_save = &selection
  let reg_save = getreginfo('"')
  let reg_bup = getreg('"')
  let cb_save = &clipboard
  let visual_marks_save = [getpos("'<"), getpos("'>")]

  try
    set clipboard= selection=inclusive
    let commands = #{line: "'[V']c", char: "`[v`]c"}
    silent exe 'noautocmd keepjumps normal! ' .. get(commands, a:type, '') . reg_bup
  finally
    call setreg('"', reg_bup)
    call setpos("'<", visual_marks_save[0])
    call setpos("'>", visual_marks_save[1])
    let &clipboard = cb_save
    let &selection = sel_save
  endtry
endfunction

nnoremap <expr> cr Switcharoo()
xnoremap <expr> cr Switcharoo()
" doubling <F4> works on a line
nnoremap <expr> crcr Switcharoo() .. '_'
