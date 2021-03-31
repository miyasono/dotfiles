"================================================================
" 基本設定
"================================================================

" エンコーディングを設定
set fenc=utf-8
scriptencoding utf-8
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" 終了時の保存確認
set confirm
"タイトルバーにファイルパス情報等の表示をする
set title
" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" インデントはスマートインデント
set smartindent
" ビープ音を可視化
"set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list,full
" コマンドラインの高さ
set cmdheight=1
" タブページ表示
set showtabline=2
" 不可視文字を可視化
set list listchars=tab:>-,trail:~
" Tab文字を半角スペースにする
set expandtab
" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=2
" 行頭でのTab文字の表示幅
set shiftwidth=2
" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" 置換時に g オプションをデフォルトでつける
set gdefault
" カーソルの回り込みを可能に
set whichwrap=b,s,h,l,[,],<,>
" BackSpace を空白、行頭、行末でも可能に
set backspace=indent,eol,start
" クリップボードへのコピー
set clipboard=unnamed
" 畳み込み禁止
set nofoldenable
" スクロールに行数の余裕をもたせる
set scrolloff=7

" ノーマルモードでのキーマッピング
nnoremap <Esc><Esc> :noh<CR>

call plug#begin('~/.vim/plugged')
  Plug 'gosukiwi/vim-atom-dark'
  Plug 'itchyny/lightline.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'tmux-plugins/vim-tmux-focus-events'
  Plug 'TaDaa/vimade'
  Plug 'kana/vim-submode'
  Plug 'sinetoami/dimfocus.vim'
call plug#end()

"let g:fzf_commands_expect = 'enter'
if executable('rg')
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Rg
    \ call fzf#vim#grep(
    \ 'rg --line-number --no-heading '.shellescape(<q-args>), 1,
    \ <bang>0 ? fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'up:50%:wrap')
    \         : fzf#vim#with_preview('right:50%:hidden', '?'),
    \ <bang>0)
endif

" fzf Git内ファイル検索(gitignore対象は除外し、Untracked filesは含む)
command! -bang -nargs=* GitFiles
      \ call fzf#vim#gitfiles('--exclude-standard -co')

nnoremap <Space>o :GitFiles<CR>
nnoremap <Space>h :History<CR>
nnoremap <Space>g :Rg!<CR>
nnoremap <Space>f :NERDTreeFind<CR>
nnoremap <Space>t :NERDTreeToggle<CR>

colorscheme atom-dark-256

"フォーカスしていない時の背景色(23を好きな値・色に変更)
let g:InactiveBackGround = 'ctermbg=236'

"Neovim自体からフォーカスを外したりした際の切替設定
"(フォーカスした時の設定はcolorschemeに合わせて変更）
augroup ChangeBackGround
  autocmd!
  " フォーカスした時(colorscheme準拠に切替)
  autocmd FocusGained * hi Normal ctermbg=234 " :hi Normalで取得した値
  autocmd FocusGained * hi NonText ctermbg=234 " :hi NonTextで取得した値
  autocmd FocusGained * hi SpecialKey ctermbg=234 " :hi SpecialKeyで取得した値
  autocmd FocusGained * hi EndOfBuffer ctermbg=none "EndOfBufferの設定は恐らくclearなのでnoneを入れる
  " フォーカスを外した時（フォーカスしていない時の背景色に切替)
  autocmd FocusLost * execute('hi Normal '.g:InactiveBackGround)
  autocmd FocusLost * execute('hi NonText '.g:InactiveBackGround)
  autocmd FocusLost * execute('hi SpecialKey '.g:InactiveBackGround)
  autocmd FocusLost * execute('hi EndOfBuffer '.g:InactiveBackGround)
augroup end

nnoremap s <nop>
nnoremap sj <c-w>j
nnoremap sk <c-w>k
nnoremap sl <c-w>l
nnoremap sh <c-w>h
nnoremap sn gt
nnoremap sp gT
nnoremap sr <c-w>r
nnoremap s= <c-w>=
nnoremap sw <c-w>w
nnoremap so <c-w>_<c-w>|
nnoremap sO <c-w>=
nnoremap sN :<c-u>bn<cr>
nnoremap sP :<c-u>bp<cr>
nnoremap st :<c-u>tabnew<cr>
nnoremap si :<c-u>sp<cr>
nnoremap ss :<c-u>vs<cr>
nnoremap sq :<c-u>q<cr>
set noequalalways
call submode#enter_with('bufmove', 'n', '', 'sL', '<c-w>5>')
call submode#enter_with('bufmove', 'n', '', 'sH', '<c-w>5<')
call submode#enter_with('bufmove', 'n', '', 'sJ', '<c-w>5+')
call submode#enter_with('bufmove', 'n', '', 'sK', '<c-w>5-')
call submode#map('bufmove', 'n', '', 'L', '<c-w>5>')
call submode#map('bufmove', 'n', '', 'H', '<c-w>5<')
call submode#map('bufmove', 'n', '', 'J', '<c-w>5+')
call submode#map('bufmove', 'n', '', 'K', '<c-w>5-')

