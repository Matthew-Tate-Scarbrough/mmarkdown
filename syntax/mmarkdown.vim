" Vim Syntax File
" Language:	M-Markdown
" Filenames:	*.mmarkdown, *.mmd, *.markdown, *.md, *.txt
" Maintainer:	Matþew T. Scarbrough <matthewtatescarbrough@tutanota.com>
" Last Change:	2020 Mar 11
" Version:	0.03c
" Note:		Though this file is written from scratch, many lines may
" 		be takenfrom the $VIMRUNTIME/syntax/markdown.vim file.
" TODO:		Add Footnotes, etc.

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

	" Leave unformatted till further notice
	"""""""""syn match mmdLineStart "^[<@]\@!" nextgroup=@mmdEntrnance

	syn cluster mmdBlocks contains=@mmdHeaders,@mmdHeadersNouline,mmdBlockCode,mmdBlockQuote,mmdBlockList,mmdBlockListNumbered,mmdFormatRules
	syn cluster mmdInline contains=@mmdFormatColours,mmdFormatCode,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough

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
		syn region mmdFormatColourBlack     matchgroup=mmdColoursDelimiter start=+\\black"\|\\black{+                           matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourBlue      matchgroup=mmdColoursDelimiter start=+\\bl[ue]"\|\\bl[ue]{+                         matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourBrown     matchgroup=mmdColoursDelimiter start=+\\br[own]"\|\\br[own]{+                       matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourGreen     matchgroup=mmdColoursDelimiter start=+\\gr[een]"\|\\gr[een]{+                       matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourCyan      matchgroup=mmdColoursDelimiter start=+\\cy[an]"\|\\cy[an]{+                         matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourRed       matchgroup=mmdColoursDelimiter start=+\\r[ed]"\|\\r[ed]{+                           matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourMagenta   matchgroup=mmdColoursDelimiter start=+\\m[agenta]"\|\\m[agenta]{+                   matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourYellow    matchgroup=mmdColoursDelimiter start=+\\y[ellow]"\|\\y[ellow]{+                     matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourWhite     matchgroup=mmdColoursDelimiter start=+\\wh[ite]"\|\\wh[ite]{+                       matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline
		syn region mmdFormatColourLightGrey matchgroup=mmdColoursDelimiter start=+\\grey"\|\\grey{\|\\gray"\|\\gray{+           matchgroup=mmdColoursDelimiter end=+"\|}+ keepend contains=@mmdInline

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

	" Comments
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="/\*"           matchgroup=mmdCommentDelimiter   end="\*/"      keepend
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="//"            matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend   contains=@mmdInline
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="%"             matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend   contains=@mmdInline

	" Code
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="\s\s\s\s\|\t\t"   matchgroup=mmdFaceDelimiter      end="#*\s*$"   keepend   contains=@mmdInline
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="`"                matchgroup=mmdFaceDelimiter      end="`"        keepend   contains=@mmdInline

	" Font Faces

		" All

		" Italics
		syn region mmdFormatItalics                  matchgroup=mmdFaceDelimiter start="\*"             matchgroup=mmdFaceDelimiter end="\*"             keepend contains=@mmdInline
			"syn region mmdFormatItalicsBold      matchgroup=mmdFaceDelimiter start="\*\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\*"         keepend contains=@mmdInline
			"syn region mmdFormatItalicsUnderline matchgroup=mmdFaceDelimiter start="_\*"            matchgroup=mmdFaceDelimiter end="\*_"            keepend contains=@mmdInline
			"syn region mmdFormatItalicsStrike    matchgroup=mmdFaceDelimiter start="\~\*"           matchgroup=mmdFaceDelimiter end="\*\~"           keepend contains=@mmdInline

		" Bold
		syn region mmdFormatBold                     matchgroup=mmdFaceDelimiter start="\*\*"           matchgroup=mmdFaceDelimiter end="\*\*"           keepend contains=@mmdInline
			"syn region mmdFormatBoldUnderline    matchgroup=mmdFaceDelimiter start="_\*\*"          matchgroup=mmdFaceDelimiter end="\*\*_"          keepend contains=@mmdInline
			"syn region mmdFormatBoldStrike       matchgroup=mmdFaceDelimiter start="\~\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\~"         keepend contains=@mmdInline

		" Underline
		syn region mmdFormatUnderline                matchgroup=mmdFaceDelimiter start="_"              matchgroup=mmdFaceDelimiter end="_"              keepend contains=@mmdInline
			"syn region mmdFormatUnderlineStrike  matchgroup=mmdFaceDelimiter start="_\~"            matchgroup=mmdFaceDelimiter end="\~_"            keepend contains=@mmdInline

		" Strikethrough
		syn region mmdFormatStrikethrough            matchgroup=mmdFaceDelimiter start="\~"             matchgroup=mmdFaceDelimiter end="\~"             keepend contains=@mmdInline

		" Permutations
		"""" Due to how Vim works, this is the only Order they will
		"""" work in, after the previous and these
		syn region mmdFormatItalicsBold              matchgroup=mmdFaceDelimiter start="\*\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\*"         keepend contains=@mmdInline
		syn region mmdFormatItalicsUnderline         matchgroup=mmdFaceDelimiter start="_\*"            matchgroup=mmdFaceDelimiter end="\*_"            keepend contains=@mmdInline
		syn region mmdFormatItalicsStrike            matchgroup=mmdFaceDelimiter start="\~\*"           matchgroup=mmdFaceDelimiter end="\*\~"           keepend contains=@mmdInline
		syn region mmdFormatBoldUnderline            matchgroup=mmdFaceDelimiter start="_\*\*"          matchgroup=mmdFaceDelimiter end="\*\*_"          keepend contains=@mmdInline
		syn region mmdFormatBoldStrike               matchgroup=mmdFaceDelimiter start="\~\*\*"         matchgroup=mmdFaceDelimiter end="\*\*\~"         keepend contains=@mmdInline
		syn region mmdFormatUnderlineStrike          matchgroup=mmdFaceDelimiter start="_\~"            matchgroup=mmdFaceDelimiter end="\~_"            keepend contains=@mmdInline
		syn region mmdFormatAll                      matchgroup=mmdFaceDelimiter start="_\*\*\*"        matchgroup=mmdFaceDelimiter end="\*\*\*_"        keepend contains=@mmdInline
		syn region mmdFormatItalicsUnderlineStrike   matchgroup=mmdFaceDelimiter start="_\~\*"          matchgroup=mmdFaceDelimiter end="\*\~_"          keepend contains=@mmdInline
		syn region mmdFormatBoldUnderlineStrike      matchgroup=mmdFaceDelimiter start="_\~\*\*"        matchgroup=mmdFaceDelimiter end="\*\*\~_"        keepend contains=@mmdInline
		syn region mmdFormatAllPlus                  matchgroup=mmdFaceDelimiter start="_\~\*\*\*"      matchgroup=mmdFaceDelimiter end="\*\*\*\~_"      keepend contains=@mmdInline


	" Block Quote
	syn region mmdFormatBlockQuote    matchgroup=mmdCommentDelimiter start=">"                         matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start=">>\|>\s>\|>\s>\s"          matchgroup=mmdCommentDelimiter   end="#*\s*$"   keepend contains=@mmdInline

	" Lists
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^+\s\|-\s\|\~\s"           matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[:space:]+\s\|-\s\|\~\s"  matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[0-9A-Za-z]\.\s"          matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[:space:][0-9A-Za-z]\.\s" matchgroup=mmdFaceDelimiter end="#*\s*$" keepend contains=@mmdInline

	" Links
	syn region mmdFormatLink          matchgroup=mmdFaceDelimiter start="<"                matchgroup=mmdFaceDelimiter end=">"  keepend
	syn region mmdFormatLink          matchgroup=mmdFaceDelimiter start=+(+                matchgroup=mmdFaceDelimiter end=+)+  keepend contained
	syn region mmdFormatHyperLink     matchgroup=mmdFaceDelimiter start="\[\|\!\[\|\[\!\[" matchgroup=mmdFaceDelimiter end="\]" keepend nextgroup=mmdFormatLink contains=mmdFormatPseudonym
	syn region mmdFormatPseudonym     matchgroup=mmdFaceDelimiter start=+"+                matchgroup=mmdFaceDelimiter end=+"+  keepend containedin=mmdFormatHyperLink

	" Escape Sequences
	syn match mmdFormatEscape "\\[][\\`*_{}()<>#+.!-~%]"
	syn match mmdFormatEscape "\\r\|\\n\|\\t"

	
" ===HILIGHTING===

	" HEADERS

		" Delimiter
		hi def link mmdHeadingDelimiter         Delimiter

		" New-Fashioned
		hi def mmdFormatH1nouline cterm=bold           ctermfg=magenta
		hi def mmdFormatH2nouline cterm=bold           ctermfg=yellow
		hi def mmdFormatH3nouline cterm=bold           ctermfg=cyan
		hi def mmdFormatH4nouline cterm=bold           ctermfg=lightred
		hi def mmdFormatH5nouline cterm=bold           ctermfg=green
		hi def mmdFormatH6nouline cterm=bold           ctermfg=darkyellow

		" Old-Fashioned
		hi def mmdFormatH1        cterm=bold,underline ctermfg=magenta
		hi def mmdFormatH2        cterm=bold,underline ctermfg=yellow
		hi def mmdFormatH3        cterm=bold,underline ctermfg=cyan
		hi def mmdFormatH4        cterm=bold,underline ctermfg=lightred
		hi def mmdFormatH5        cterm=bold,underline ctermfg=green
		hi def mmdFormatH6        cterm=bold,underline ctermfg=darkyellow

	
	" FORMATTING

		" Rules
		hi def mmdFormatRules cterm=strikethrough,bold

		" Colours
			
			" Delimiter
			hi def link mmdColoursDelimiter Delimiter

			" Formatting

				" Foreground
				hi def mmdFormatColourBlack       ctermfg=black        ctermbg=white
				hi def mmdFormatColourBlue        ctermfg=blue
				hi def mmdFormatColourBrown       ctermfg=darkyellow   
				hi def mmdFormatColourLightGrey   ctermfg=lightgrey
				hi def mmdFormatColourGreen       ctermfg=green
				hi def mmdFormatColourCyan        ctermfg=cyan
				hi def mmdFormatColourRed         ctermfg=red
				hi def mmdFormatColourMagenta     ctermfg=magenta
				hi def mmdFormatColourYellow      ctermfg=yellow
				hi def mmdFormatColourWhite       ctermfg=white        ctermbg=black

				" Background (Highlighting)
				hi def mmdFormatColourHiBlack     ctermbg=black        ctermfg=yellow
				hi def mmdFormatColourHiBlue      ctermbg=blue
				hi def mmdFormatColourHiBrown     ctermbg=darkyellow   
				hi def mmdFormatColourHiLightGrey ctermbg=lightgrey
				hi def mmdFormatColourHiGreen     ctermbg=green
				hi def mmdFormatColourHiCyan      ctermbg=cyan
				hi def mmdFormatColourHiRed       ctermbg=red
				hi def mmdFormatColourHiMagenta   ctermbg=magenta
				hi def mmdFormatColourHiYellow    ctermbg=yellow
				hi def mmdFormatColourHiWhite     ctermbg=white        ctermfg=black

			" Font Faces

				" Delimiter
				hi def link mmdFaceDelimiter      Delimiter
				hi def link mmdCommentDelimiter   Comment

				" Inline
				hi def link mmdFormatComment      Comment
				hi def mmdFormatCode              ctermfg=cyan         ctermbg=darkblue

					" Italics
					hi def mmdFormatItalics                        cterm=italic
						hi def mmdFormatItalicsBold            cterm=italic,bold
						hi def mmdFormatItalicsUnderline       cterm=italic,underline
						hi def mmdFormatItalicsUnderlineStrike cterm=italic,underline,strikethrough
						hi def mmdFormatItalicsStrike          cterm=italic,strikethrough

					" Bold
					hi def mmdFormatBold                           cterm=bold
						hi def mmdFormatBoldUnderline          cterm=bold,underline
						hi def mmdFormatBoldUnderlineStrike    cterm=bold,underline,strikethrough
						hi def mmdFormatBoldStrike             cterm=bold,strikethrough

					" Underline
					hi def mmdFormatUnderline                      cterm=underline                           ctermfg=NONE
						hi def mmdFormatUnderlineStrike        cterm=underline,strikethrough             ctermfg=NONE

					" Strikethrough
					hi def mmdFormatStrikethrough                  cterm=strikethrough

					" All
					hi def mmdFormatAll                            cterm=italic,bold,underline
					hi def mmdFormatAllPlus                        cterm=italic,bold,underline,strikethrough


				" Others
				hi def mmdFormatItalicsStrike
				hi def mmdFormatBoldStrike
				hi def mmdFormatUnderlineStrike

				" Block Quotes
				hi def mmdFormatBlockQuote                             ctermfg=white                             ctermbg=darkmagenta
				hi def mmdFormatBlockQuote                             ctermfg=yellow                            ctermbg=darkmagenta

				" Links
				hi def link mmdFormatLink                              Underlined
                                hi def mmdFormatHyperLink                              ctermfg=darkyellow
                                hi def mmdFormatPseudonym                              ctermfg=darkyellow

				" Escape Chars
				hi def mmdFormatEscape                                 ctermfg=yellow


let b:current_syntax = "mmarkdown"
