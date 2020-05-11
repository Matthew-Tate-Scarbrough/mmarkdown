" Vim Syntax File
" Language:	M-Markdown
" Filenames:	*.mmarkdown, *.mmd, *.markdown, *.md, *.txt
" Maintainer:	Matþew T. Scarbrough <matthewtatescarbrough@tutanota.com>
" Last Change:	2020 Mar 10
" Version:	0.03
" Note:		Though this file is written from scratch, many lines may
" 		be takenfrom the $VIMRUNTIME/syntax/markdown.vim file.

" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "
"                 _    _        _    _    ___    ____    _   _   ____    _____   _    _   _   _                 "
"                | \  / |      | \  / |  / _ \  |  _ \  | | / / |  _ \  /  _  \ | |  | | | \ | |                "
"                |  \/  |  __  |  \/  | | |_| | | |_) ) | |/ /  | | \ \ | | | | | |/\| | |  \| |                "
"                | \  / | |__| | \  / | |  _  | |    /  |   (   | | | | | | | | | /  \ | | \ \ |                "
"                | |\/| |      | |\/| | | | | | | |\ \  | |\ \  | |_/ / | |_| | |  /\  | | |\  |                "
"                |_|  |_|      |_|  |_| |_| |_| |_| \_\ |_| \_\ |____/  \_____/ |_/  \_| |_| \_|                "
"                                                                                                               "
" - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - "

" ===PREAMBLE===

if exists("b:current_syntax")
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'mmarkdown'
endif


" ===ENTRANCE===

	" IDK what this is
	syn case ignore

	" It seemed like a good idea to borrow these from Pope's file
	syn match mmdValid '[<>]\c[a-z/$!]\@!'
	syn match mmdValid '&\%(#\=\w*;\)\@!'

	" As I understand, this is *the* entry point, to help further
	" better highlighting
	syn match mmdLineStart "^[<@]\@!" nextgroup=@mmdEntrnance

	syn cluster mmdEntrance contains=@mmdHeaders,@mmdHeadersNouline,mmdBlockCode,mmdBlockQuote,mmdBlockList,mmdBlockListNumbered
	syn cluster mmdInline   contains=@mmdFormatColours,mmdFormatCode,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough

	syn cluster mmdHeaders        contains=mmdFormatH1,mmdFormatH2,mmdFormatH3,mmdFormatH4,mmdFormatH5,mmdFormatH6
	syn cluster mmdHeadersNouline contains=mmdFormatH1Nouline,mmdFormatH2Nouline,mmdFormatH3Nouline,mmdFormatH4Nouline,mmdFormatH5Nouline,mmdFormatH6Nouline
	syn cluster mmdFormatColours  contains=mmdFormatColourBlack,mmdFormatColourBlue,mmdFormatColourBrown,mmdFormatColourLightGrey,mmdFormatColourGreen,mmdFormatColourCyan,mmdFormatColourRed,mmdFormatColourMagenta,mmdFormatColourYellow,mmdFormatColourWhite,mmdFormatColourHiBlack,mmdFormatColourHiBlue,mmdFormatColourHiBrown,mmdFormatColourHiLightGrey,mmdFormatColourHiGreen,mmdFormatColourHiCyan,mmdFormatColourHiRed,mmdFormatColourHiMagenta,mmdFormatColourHiYellow,mmdFormatColourHiWhite


" ===HEADERS===

	" New-Fashioned
	syn match mmdFormatH1nouline "^.\+\n=\+$"  contains=@mmdInline
	syn match mmdFormatH2nouline "^.\+\n-\+$"  contains=@mmdInline
	syn match mmdFormatH3nouline "^.\+\n\~\+$" contains=@mmdInline

		" New-Fashioned 2
		syn match mmdFormatH3nouline "^#.\+\n-\+$"    contains=@mmdInline
		syn match mmdFormatH4nouline "^##.\+\n-\+$"   contains=@mmdInline
		syn match mmdFormatH5nouline "^###.\+\n-\+$"  contains=@mmdInline
		syn match mmdFormatH6nouline "^####.\+\n-\+$" contains=@mmdInline

		" New-Fashioned 3 (Redundant redundancy)
		syn match mmdFormatH4nouline "^#.\+\n\~\+$"   contains=@mmdInline
		syn match mmdFormatH5nouline "^##.\+\n\~\+$"  contains=@mmdInline
		syn match mmdFormatH6nouline "^###.\+\n\~\+$" contains=@mmdInline

	" Old-Fashioned
	syn region mmdFormatH1 matchgroup=mmdHeadingDelimiter start="##\@!"      end="#*\s*$" keepend oneline contains=@mmdInline
	syn region mmdFormatH2 matchgroup=mmdHeadingDelimiter start="###\@!"     end="#*\s*$" keepend oneline contains=@mmdInline
	syn region mmdFormatH3 matchgroup=mmdHeadingDelimiter start="####\@!"    end="#*\s*$" keepend oneline contains=@mmdInline
	syn region mmdFormatH4 matchgroup=mmdHeadingDelimiter start="#####\@!"   end="#*\s*$" keepend oneline contains=@mmdInline
	syn region mmdFormatH5 matchgroup=mmdHeadingDelimiter start="######\@!"  end="#*\s*$" keepend oneline contains=@mmdInline
	syn region mmdFormatH6 matchgroup=mmdHeadingDelimiter start="#######\@!" end="#*\s*$" keepend oneline contains=@mmdInline


" ===FORMATTING===

	" Rules
	syn match mmdFormatRules "^-\s-\s-\s-\+$"
	syn match mmdFormatRules "^=\s=\s=\s=\+$"
	syn match mmdFormatRules "^\~\s\~\s\~\s\~\+$"

	" Colours
	" TODO: add a customisable colouring system & more streamlined
	
		" Foreground
		syn region mmdFormatColourBlack     matchgroup=mmdColoursDelimiter start=+\\black"\|\\black{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourBlue      matchgroup=mmdColoursDelimiter start=+\\bl[ue]"\|\\bl[ue]{+               matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourBrown     matchgroup=mmdColoursDelimiter start=+\\br[own]"\|\\br[own]{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourGreen     matchgroup=mmdColoursDelimiter start=+\\gr[een]"\|\\gr[een]{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourCyan      matchgroup=mmdColoursDelimiter start=+\\cy[an]"\|\\cy[an]{+               matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourRed       matchgroup=mmdColoursDelimiter start=+\\r[ed]"\|\\r[ed]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourMagenta   matchgroup=mmdColoursDelimiter start=+\\m[agenta]"\|\\m[agenta]{+         matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourYellow    matchgroup=mmdColoursDelimiter start=+\\y[ellow]"\|\\y[ellow]{+           matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourWhite     matchgroup=mmdColoursDelimiter start=+\\wh[ite]"\|\\wh[ite]{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourLightGrey matchgroup=mmdColoursDelimiter start=+\\grey"\|\\grey{\|\\gray"\|\\gray{+ matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline

		" Background (highlighting)
		syn region mmdFormatColourHiBlack     matchgroup=mmdColoursDelimiter start=+\\hiblack"\|\\hiblack{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiBlue      matchgroup=mmdColoursDelimiter start=+\\hibl[ue]"\|\\hibl[ue]{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiBrown     matchgroup=mmdColoursDelimiter start=+\\hibr[own]"\|\\hibr[own]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiGreen     matchgroup=mmdColoursDelimiter start=+\\higr[een]"\|\\higr[een]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiCyan      matchgroup=mmdColoursDelimiter start=+\\hicy[an]"\|\\hicy[an]{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiRed       matchgroup=mmdColoursDelimiter start=+\\hir[ed]"\|\\hir[ed]{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiMagenta   matchgroup=mmdColoursDelimiter start=+\\him[agenta]"\|\\him[agenta]{+             matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiYellow    matchgroup=mmdColoursDelimiter start=+\\hiy[ellow]"\|\\hiy[ellow]{+               matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiWhite     matchgroup=mmdColoursDelimiter start=+\\hiwh[ite]"\|\\hiwh[ite]{+                 matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourHiLightGrey matchgroup=mmdColoursDelimiter start=+\\higrey"\|\\higrey{\|\\higray"\|\\higray{+ matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline

	" Font Faces
	syn region mmdFormatComment   matchgroup=mmdFaceDelimiter start="/\*"  matchgroup=mmdFaceDelimiter skip="\*\|\s\s\s\*\|\t\s\*" matchgroup=mmdFaceDelimiter end="\*/" keepend contains=@mmdInline
	syn region mmdFormatComment   matchgroup=mmdFaceDelimiter start="//"   matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatCode      matchgroup=mmdFaceDelimiter start="`"    matchgroup=mmdFaceDelimiter end="`"      keepend contains=@mmdInline
	syn region mmdFormatItalics   matchgroup=mmdFaceDelimiter start="\*"   matchgroup=mmdFaceDelimiter end="\*"     keepend contains=@mmdInline
	syn region mmdFormatBold      matchgroup=mmdFaceDelimiter start="\*\*" matchgroup=mmdFaceDelimiter end="\*\*"   keepend contains=@mmdInline
	syn region mmdFormatUnderline matchgroup=mmdFaceDelimiter start="_"    matchgroup=mmdFaceDelimiter end="_"      keepend contains=@mmdInline

	" Links
	syn region mmdFormatLink      matchgroup=mmdFaceDelimiter start="<"        matchgroup=mmdFaceDelimiter end=">"  keepend
	syn region mmdFormatLink      matchgroup=mmdFaceDelimiter start=+(+        matchgroup=mmdFaceDelimiter end=+)+  keepend
	syn region mmdFormatHyperLink matchgroup=mmdFaceDelimiter start="\[\|\!\[\|\[\!\[" matchgroup=mmdFaceDelimiter end="\]" keepend nextgroup=mmdFormatLink contains=mmdFormatPseudonym
	syn region mmdFormatPseudonym matchgroup=mmdFaceDelimiter start=+"+        matchgroup=mmdFaceDelimiter end=+"+  keepend

	
" ===HILIGHTING===

	" ENTRANCE


	" HEADERS

		" Delimiter
		hi def link mmdHeadingDelimiter         Delimiter

		" New-Fashioned
		hi def mmdFormatH1nouline       cterm=bold              ctermfg=magenta
		hi def mmdFormatH2nouline       cterm=bold              ctermfg=yellow
		hi def mmdFormatH3nouline       cterm=bold              ctermfg=cyan
		hi def mmdFormatH4nouline       cterm=bold              ctermfg=lightred
		hi def mmdFormatH5nouline       cterm=bold              ctermfg=green
		hi def mmdFormatH6nouline       cterm=bold              ctermfg=darkyellow

		" Old-Fashioned
		hi def mmdFormatH1              cterm=bold,underline    ctermfg=magenta
		hi def mmdFormatH2              cterm=bold,underline    ctermfg=yellow
		hi def mmdFormatH3              cterm=bold,underline    ctermfg=cyan
		hi def mmdFormatH4              cterm=bold,underline    ctermfg=lightred
		hi def mmdFormatH5              cterm=bold,underline    ctermfg=green
		hi def mmdFormatH6              cterm=bold,underline    ctermfg=darkyellow

	
	" FORMATTING

		" Rules
		hi def mmdFormatRules cterm=strikethrough,bold

		" Colours
			
			" Delimiter
			hi def link mmdColoursDelimiter Delimiter

			" Formatting

				" Foreground
				hi def mmdFormatColourBlack       ctermfg=black         ctermbg=white
				hi def mmdFormatColourBlue        ctermfg=blue
				hi def mmdFormatColourBrown       ctermfg=darkyellow
				hi def mmdFormatColourLightGrey   ctermfg=lightgrey
				hi def mmdFormatColourGreen       ctermfg=green
				hi def mmdFormatColourCyan        ctermfg=cyan
				hi def mmdFormatColourRed         ctermfg=red
				hi def mmdFormatColourMagenta     ctermfg=magenta
				hi def mmdFormatColourYellow      ctermfg=yellow
				hi def mmdFormatColourWhite       ctermfg=white         ctermbg=black

				" Background (Highlighting)
				hi def mmdFormatColourHiBlack     ctermbg=black         ctermfg=yellow
				hi def mmdFormatColourHiBlue      ctermbg=blue
				hi def mmdFormatColourHiBrown     ctermbg=darkyellow
				hi def mmdFormatColourHiLightGrey ctermbg=lightgrey
				hi def mmdFormatColourHiGreen     ctermbg=green
				hi def mmdFormatColourHiCyan      ctermbg=cyan
				hi def mmdFormatColourHiRed       ctermbg=red
				hi def mmdFormatColourHiMagenta   ctermbg=magenta
				hi def mmdFormatColourHiYellow    ctermbg=yellow
				hi def mmdFormatColourHiWhite     ctermbg=white         ctermfg=black

			" Font Faces
			hi def link mmdFaceDelimiter    Delimiter


let b:current_syntax = "mmarkdown"

" IDK what this IF is... the markdown.vim file had it
" LEAVE COMMENTED TILL FURTHER NOTICE
"if main_syntax ==# 'mmarkdown'
"  unlet main_syntax
"endif
