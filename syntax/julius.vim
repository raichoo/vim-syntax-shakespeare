" Vim syntax file
" Language: Julius template syntax highlighting
" Author:   Patrick Brisbin <me@pbrisbin.com>
" License:  as-is

if !exists("main_syntax")
  if version < 600
    syntax clear
  elseif exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'julius'
endif

if version < 508
  command! -nargs=+ JuliusHiLink hi link <args>
else
  command! -nargs=+ JuliusHiLink hi def link <args>
endif

" julius is just javascript with variable interpolation
:runtime! syntax/javascript.vim
unlet b:current_syntax

syn match jsString /"[^"]*"/ contains=jsVar

syn match jsVar /\#{[^}]*}/ contains=jsString,hsVarSym,hsConSym

JuliusHiLink jsString String
JuliusHiLink jsVar    Structure

delcommand JuliusHiLink

let b:current_syntax = 'julius'

if main_syntax == 'julius'
  unlet main_syntax
endif
