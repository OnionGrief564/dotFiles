"==================Current - completion==================
    " Use <c-space> to trigger completion.
    if has('nvim')
      inoremap <silent><expr> <c-space> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    inoremap <silent><expr> <TAB> coc#pum#visible() ? coc#pum#confirm() : "\<TAB>"

    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nnoremap <silent><leader>gr <Plug>(coc-references)
    nmap <silent> <F3> <Plug>(coc-format)
    nmap <silent> <S-F6> <Plug>(coc-rename)
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    command! -nargs=0 Prettier :CocCommand prettier.formatFile

    " Apply AutoFix to problem on the current line.
    nnoremap <leader>fc <Plug>(coc-fix-current)
    nnoremap <leader>ac <Plug>(coc-codeaction)

	" Get all diagnostics
	nnoremap <silent><nowait> <leader>sd  :<C-u>CocList diagnostics<cr>

    " Use K (or gh) to show documentation in preview window.
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    nmap <silent>gh :call <SID>show_documentation()<CR>
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
	execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
	call CocActionAsync('doHover')
      else
	execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')


    " Add `:OrganizeImports` command for organize imports of the current buffer.
    command! -nargs=0 OrganizeImports   :call CocAction('runCommand', 'editor.action.organizeImport')

" ===============================Coc Git=====================================
	" navigate chunks of current buffer
	nmap ( <Plug>(coc-git-prevchunk)
	nmap ) <Plug>(coc-git-nextchunk)
	" create text object for git chunks
	omap ic <Plug>(coc-git-chunk-inner)
	xmap ic <Plug>(coc-git-chunk-inner)
	omap ac <Plug>(coc-git-chunk-outer)
	xmap ac <Plug>(coc-git-chunk-outer)
