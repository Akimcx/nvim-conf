" Leader = Alt key
let leader=""

nnoremap <C-b> :20Lexplore<CR>
inoremap <C-b> <c-o>:20Lexplore<CR>

"Very magic search
nnoremap / /\v

" Comment a line
nnoremap  :Commentary<CR>
inoremap  <c-o>:Commentary<CR>
xnoremap  :Commentary<CR>
xnoremap  :Commentary<CR>

" Move line up and down
nnoremap <A-Up> :m -2<CR>
nnoremap <A-Down> :m +1<CR>
inoremap <A-Up> <c-o>:m -2<CR>
inoremap <A-Down> <c-o>:m +1<CR>
xnoremap <A-Up> :m '<-2<CR>gv
xnoremap <A-Down> :m '>+1<CR>gv

" Duplicate line up and down
nnoremap <A-S-Up> :t -1<CR>
nnoremap <A-S-Down> :t .+0<CR>
inoremap <A-S-Up> <c-o>:t -1<CR>
inoremap <A-S-Down> <c-o>:t .+0<CR>
xnoremap <A-S-Up> :t '<-1<CR>gv
xnoremap <A-S-Down> :t '>+0<CR>gv

"Split operation
nnoremap l <C-W>l
nnoremap h <C-W>h
nnoremap j <C-W>j
nnoremap k <C-W>k
nnoremap v <C-W>v
nnoremap s <C-W>s
nnoremap w <C-W>c

" Insert blank line without entering insert mode
nnoremap Q o<ESC>


" \v(new[[:blank:]]+)@<=[[:alpha:]]+|[[:alpha:]]+([[:blank:]]+[[:alpha:]]+[[:blank:]]+\=)@=

function OpenFileUnderCursor()
	try
		:norm! gf <C-R><C-F>
	catch /E447:/
		:let s:choice = confirm("The file " .. expand("<cfile>") .. " do not exist, do you want to create it", "Yes\nNo", "1")
		if s:choice ==  1
			:e <cfile>
		endif
	endtry
endfunction

nnoremap <silent> gf :call OpenFileUnderCursor()<CR>
