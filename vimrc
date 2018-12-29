"vundle 配置开始
set nocompatible			        "不要使用vi的键盘模式，而是vim自己的
filetype off				        "文件类型侦测关闭
set rtp+=~/.vim/bundle/Vundle.vim	"设置vundle的运行时环境路径
call vundle#begin()			        "vundle管理的插件列表开始
Plugin 'gmarik/Vundle.vim'		    "让Vundle管理Vundle
Plugin 'jnurmine/Zenburn'		    "Zenburn配色方案
Plugin 'scrooloose/nerdtree'        "文件树形结构nerdtree
Plugin 'godlygeek/tabular'          "Markdown插件
Plugin 'plasticboy/vim-markdown'    "Markdown插件
Plugin 'iamcco/markdown-preview.vim'        "Markdown预览插件
Plugin 'iamcco/mathjax-support-for-mkdp'    "Markdown预览数学公式
Plugin 'Valloric/YouCompleteMe'     "自动补全插件
Plugin 'Lokaltog/vim-powerline'     "Powerline插件
Plugin 'Raimondi/delimitMate'       "自动补全大括号
Plugin 'othree/html5.vim'           "HTML5插件
Plugin 'hail2u/vim-css3-syntax'     "CSS语法高亮
Plugin 'pangloss/vim-javascript'    "JS高亮
Plugin 'nathanaelkane/vim-indent-guides'    "显示缩进范围
call vundle#end()			        "插件列表结束
filetype plugin indent on		    "载入文件类型插件以及相应的缩进文件
"Vundle 配置结束

"自定义配置
syntax on				            "语法高亮
colorscheme zenburn			        "设置主题为solarized
set backspace=2				        "使退格键正常处理indent,eol,start
set noerrorbells			        "不让vim发出滴滴声
set showmatch				        "高亮显示匹配的括号
set laststatus=2			        "总是显示状态行
set tabstop=4				        "制表符宽度为4个空格
set expandtab				        "让空格替代制表符
set number				            "开启行号显示
set cursorline				        "高亮当前行
set ruler                           "显示标尺
set foldenable                      "打开折叠
set shiftwidth=4                    "设置缩进为4个空格
set cindent                         "C语言缩进
let &termencoding=&encoding
set fileencodings=utf-8,ucs-bom,gbk,cp936
                                    "自动识别文件编码
hi Normal ctermbg=none              "设置背景透明
au BufRead,BufNewFile *.vue set filetype=html
                                    "设置vue文件语法高亮

"Markdown配置开始
let g:vim_markdown_folding_disabled=1       "不折叠显示
let g:vim_markdown_override_foldtext=0
let g:vim_markdwon_folding_level=6          "可折叠的级数，对应md的标题级别
let g:vim_markdown_no_default_key_mapping=1
let g:vim_markdown_emphasis_multiline=0
let g:vim_markdown_frontmatter=1
set conceallevel=2
"Markdown配置结束

"nerdtree配置开始
autocmd vimenter * NERDTree         "vim启动时自动打开nerdtree
map <F2> :NERDTreeToggle<CR>        "F2开启关闭目录
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
                                    "vim关闭时自动关闭目录
"nerdtree配置结束

"YouCompleteMe配置开始
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0    "每次直接加载该文件，不提示是否加载
"YouCompleteMe配置结束

"Powerline配置开始
set guifont=PowerlineSymbols\ for\ Powerline
set nocompatible
set laststatus=2
set t_Co=256
let g:Powerline_Symbols='fancy'
let Powerline_Symbols='compatible'
"Powerline配置结束

"JavaScript配置开始
let javascript_enable_domhtmlcss = 1
"JavaScript配置结束

"一键执行配置
map <F5> :call CompileRunGcc()<CR>
    func! CompileRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ % -o %<"
            exec "!time ./%<"
        elseif &filetype == 'java'
            exec "!javac %"
            exec "!time java %<"
        elseif &filetype == 'sh'
            :!time bash %
        elseif &filetype == 'python'
            exec "!time python2.7 %"
        elseif &filetype == 'html'
            exec "!firefox % &"
        elseif &filetype == 'go'
            exec "!go build %<"
            exec "!time go run %"
        elseif &filetype == 'mkd'
            exec "!~/.vim/markdown.pl % > %.html &"
            exec "!firefox %.html &"
        endif
    endfunc
"一键执行配置结束
"
"一键调试配置
map <F6> :call DebugRunGcc()<CR>
    func! DebugRunGcc()
        exec "w"
        if &filetype == 'c'
            exec "!g++ -g % -o %<"
            exec "!gdbtui -q ./%<"
        elseif &filetype == 'cpp'
            exec "!g++ -g % -o %<"
            exec "!gdbtui -q ./%<"
        elseif &filetype == 'java'
            exec "!javac -g %"
            exec "!jdb %<"
        elseif &filetype == 'python'
            exec "!python -m ipdb %"
        endif
    endfunc
"一键调试配置结束
"
"一键执行配置
"map <F7> :call CompileRunGcc()<CR>
"    func! CompileRunGcc()
"        exec "w"
"        if &filetype == 'c'
"            exec "!g++ % -o %<"
"            exec "!sudo ./%<"
"        elseif &filetype == 'cpp'
"            exec "!g++ % -o %<"
"            exec "!sudo ./%<"
"        elseif &filetype == 'java'
"            exec "!javac %"
"            exec "!sudo java %<"
"        elseif &filetype == 'sh'
"            :!sudo bash %
"        elseif &filetype == 'python'
"            exec "!sudo python2.7 %"
"        elseif &filetype == 'html'
"            exec "!firefox % &"
"        elseif &filetype == 'go'
"            exec "!go build %<"
"            exec "!sudo go run %"
"        elseif &filetype == 'mkd'
"            exec "!~/.vim/markdown.pl % > %.html &"
"            exec "!firefox %.html &"
"        endif
"    endfunc
"一键执行配置结束

