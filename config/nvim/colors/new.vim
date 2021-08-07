if version > 580
    " no guarantees for version 5.8 and below, but this makes it stop
    " complaining
	hi clear
    if exists("syntax_on")
	"syntax reset
    endif
endif
let g:colors_name="new"

hi Pmenu ctermbg=black ctermfg=white
hi PmenuSel ctermbg=darkgrey ctermfg=cyan
hi PmenuSbar ctermbg=Black
hi PmenuThumb ctermbg=White

hi CursorLine cterm=NONE ctermbg=Black
hi Folded ctermbg=Black
hi MatchParen ctermfg=yellow ctermbg=none cterm=bold
hi clear SignColumn
hi GitGutterAdd guifg=#009900 ctermfg=Green
hi GitGutterChange guifg=#bbbb00 ctermfg=Yellow
hi GitGutterDelete guifg=#ff2222 ctermfg=Red
hi Comment ctermfg=darkgrey
hi vimString ctermfg=magenta
"hi goFunctionCall ctermfg=darkcyan cterm=bold
hi goDeclaration ctermfg=33
hi goFunctionCall ctermfg=80


" hi cString ctermfg=77
" hi goString ctermfg=77
" hi rustString ctermfg=77
" hi dartString ctermfg=77
" hi dartTypedef ctermfg=33
" hi dartClassDecl ctermfg=33
" hi cType ctermfg=221
" hi cInclude ctermfg=98
" hi rustQuestionMark ctermfg=173
hi Type ctermfg=208
hi Constant ctermfg=98
hi Identifier ctermfg=74
hi Statement ctermfg=33
hi PreProc ctermfg=37

hi Special	ctermfg=darkmagenta

hi FindrDir 		ctermfg=darkblue cterm=bold
hi FindrDirPartial 	ctermfg=cyan cterm=bold
hi FindrMatch		ctermbg=black

hi CursorLineNR cterm=bold ctermfg=39
hi LineNr ctermfg=darkgrey

hi WhichKeyFloat ctermbg=NONE
hi NormalFloat ctermbg=233
