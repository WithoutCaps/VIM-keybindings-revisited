set termguicolors
let g:webdevicons_enable = 1
let g:WebDevIconsUnicodeDecorateFileNodes = 1
"let g:coc_config_home = "./cocky/"



autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx
let g:coc_global_extensions = [
			\'coc-snippets',
			\'coc-cmake',
			\'coc-eslint',
			\'coc-xml',
			\'coc-yaml',
			\'coc-actions',
			\'coc-css',
			\'coc-cssmodules',
			\'coc-emmet', 
			\'coc-explorer',
			\'coc-git',
			\'coc-highlight',
			\'coc-html',
			\'coc-json', 
			\'coc-markdownlint',
			\'coc-prettier',
			\'coc-python', 
			\'coc-rls',
			\'coc-tslint-plugin', 
			\'coc-tsserver', 
			\'coc-yank',
			\'coc-vimlsp',
			\]
			"\'coc-rust-analyzer',


nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>

nmap <space>e :CocCommand explorer<CR>
let mapleader=" "

" Common
set number
set scrolloff=15
set mouse=a
set smartcase ignorecase
set splitbelow splitright
set visualbell
set wildignore+=*/tmp/*,*.so,*.swp,*.pyc,*.db,*.sqlite

" Indentation
set smartindent
set shiftwidth=4
set tabstop=4
set softtabstop=4

" Q to record macro
nnoremap Q q

" q to quit
nnoremap q :q<cr>

" Tabs switching
noremap > gt
noremap < gT

" Arrows
nmap <C-j> <C-w>j
inoremap <C-j> <Down>
nmap <C-k> <C-w>k
inoremap <C-k> <Up>
nmap <C-l> <C-w>l
inoremap <C-l> <Right>
nmap <C-h> <C-w>h
inoremap <C-h> <Left>

" Ctrl+C to copy
nmap <C-C> "+yy
vmap <C-C> "+y

" Ctrl+V to paste
imap <C-V> <Esc>"+pa

" Ctrl+S to save
nmap <C-s> :w<cr>
imap <C-s> <esc>:w<cr>a




" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

set hidden
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable delays and poor user experience.
set updatetime=300
" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.  NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
	inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
	imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
	if (index(['vim','help'], &filetype) >= 0)
		execute 'h '.expand('<cword>')
	else
		call CocAction('doHover')
	endif
endfunction


" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


augroup mygroup
	autocmd!
	" Setup formatexpr specified filetype(s).
	autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
	" Update signature help on jump placeholder.
	autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
"nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




noremap == :call CocAction('format')<cr>
xmap =  <Plug>(coc-format-selected)
nmap =  <Plug>(coc-format-selected)

xmap <leader>ca  <Plug>(coc-codeaction-selected)
"nmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

autocmd InsertEnter *.json setlocal conceallevel=0 concealcursor=
autocmd InsertLeave *.json setlocal conceallevel=2 concealcursor=inc

autocmd CursorHold * silent call CocActionAsync('highlight')
autocmd CursorHold * update

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}


let g:term_buf = 0
let g:term_win = 0

function! TermToggle(height)
    if win_gotoid(g:term_win)
        hide
    else
        botright new
        exec "resize " . a:height
        try
            exec "buffer " . g:term_buf
        catch
            call termopen($SHELL, {"detach": 0})
            let g:term_buf = bufnr("")
            set nonumber
            set norelativenumber
            set signcolumn=no
        endtry
        startinsert!
        let g:term_win = win_getid()
    endif
endfunction

" Toggle terminal on/off (neovim)
nnoremap <leader>t :call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>

" Terminal splits
tmap <C-j> <C-w>j
tmap <C-k> <C-w>k
tmap <C-l> <C-w>l
tmap <C-h> <C-w>h

