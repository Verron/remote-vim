fu! SaveSess()
    execute 'mksession! ' . getcwd() . '/.session.vim'
endfunction

fu! RestoreSess()
if filereadable(getcwd() . '/.session.vim')
    execute 'so ' . getcwd() . '/.session.vim'
    if bufexists(1)
        for l in range(1, bufnr('$'))
            if bufwinnr(l) == -1
                exec 'sbuffer ' . l
            endif
        endfor
    endif
endif
endfunction

autocmd VimLeave * call SaveSess()
autocmd VimEnter * nested call RestoreSess()

execute pathogen#infect()
syntax on
set t_Co=256
"let g:solarized_termcolors=256
set background=dark
set mouse=a
colorscheme solarized 
set ruler
set nocompatible
set number

filetype plugin on
filetype plugin indent on

nmap <F7> :NERDTreeToggle<cr>
nmap <F8> :TagbarToggle<cr>
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

nmap <leader>w :w<cr>
nmap <leader>q :bd<cr>
nmap <leader>qq :q<cr>
nmap <leader>a :bprevious<cr>
nmap <leader>f :bnext<cr>
nmap <leader>e :badd 
nmap <leader>l :ls<cr>:b
nmap <leader>s :%s/
let NERDTreeMapOpenInTab='<ENTER>'

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Bi-directional find motion
" " Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
" " `s{char}{label}`
nmap s <Plug>(easymotion-s)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
" nmap s <Plug>(easymotion-s2)
"
" " Turn on case sensitive feature
let g:EasyMotion_smartcase = 1
"
" " JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:snips_author="Verron Knowles <Verron.Knowles@ipayx.com>"
vmap <C-c> y:call system("xclip -i -selection clipboard", getreg("\""))<CR>:call system("xclip -i", getreg("\""))<CR>
nmap <C-v> :call setreg("\"",system("xclip -o -selection clipboard"))<CR>p

" CtrlP Plugin
let g:ctrlp_map='<C-p>'

set clipboard=unnamedplus
set hidden

" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"
" These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" Multi Cursor
let g:multi_cursor_use_default_mapping=0

let g:multi_cursor_start_key='<C-d>'
let g:multi_cursor_next_key='<C-d>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

" Change Status Line VIM
" first, enable status line always
set laststatus=2

" now set it up to change the status line based on mode
if version >= 700
  au InsertEnter * hi StatusLine term=reverse ctermfg=1 ctermbg=Black gui=undercurl guisp=Red
  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
endif

" Switch between Open Windows
let i = 1
while i <= 9
    execute 'nnoremap <Leader>' . i . ' :' . i . 'wincmd w<CR>'
    let i = i + 1
endwhile

" Airline Configurations
set guifont=Liberation\ Mono\ for\ Powerline\ 10
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
