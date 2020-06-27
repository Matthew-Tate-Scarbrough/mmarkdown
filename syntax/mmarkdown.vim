" Vim Syntax File
" Language:	M-Markdown
" Filenames:	*.mmarkdown, *.mmd, *.markdown, *.md, *.txt
" Maintainer:	Matþew T. Scarbrough <matthewtatescarbrough@tutanota.com>
" Last Change:	2020 Mar 28
" Version:	0.04e
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


" ===KEYWORDS===

	" GENERAL
	" Note, the author is intended to be a penname or username
	" Type intends for ‘screenplay,’ ‘book,’ ‘notes,’ etc.
	" ‘draftdate’ and ‘date’ are pseudonyms
	" ‘type’, ‘documenttype’, and ‘document’ are interchangeable
	syn keyword mmdMetaTagsGeneral title subtitle credit author date copyright draftdate version ver type documenttype document nextgroup=mmdFormatMetaData skipwhite contained

		" Author Info
		syn keyword mmdMetaTagsAuthor name addr phone email web                                                             nextgroup=mmdFormatMetaData skipwhite contained

		" Agent Info
		syn keyword mmdMetaTagsAgent agentname agentaddr agentphone agentemail org organization organisation orgweb         nextgroup=mmdFormatMetaData skipwhite contained

	" Document Settings
	syn keyword mmdMetaTagsPaper paper margins tmargin lmargin bmargin rmargin topmargin leftmargin bottommargin rightmargin    nextgroup=mmdFormatMetaData skipwhite contained

	" The cluster...
	syn cluster mmdMetaDataParams contains=mmdMetaTagsGeneral,mmdMetaTagsAuthor,mmdMetaTagsAgent,mmdMetaTagsPaper

	" Comment Specifics
	syn keyword mmdCommentNotes NOTE TODO HACK OPTIMISE OPTIMIZE IMPROVE IGNORE FIX REMOVE contained
 

" ===ENTRANCE===

" IDK what this is
syn case ignore

" It seemed like a good idea to borrow these from Pope's file
syn match mmdValid '[<>]\c[a-z/$!]\@!'
syn match mmdValid '&\%(#\=\w*;\)\@!'

" Leave unformatted till further notice
"""""""""syn match mmdLineStart "^[<@]\@!" nextgroup=@mmdEntrnance

	syn cluster mmdBlocks     contains=@mmdHeaders,@mmdHeadersNouline,mmdBlockCode,mmdBlockQuote,mmdBlockList,mmdBlockListNumbered,mmdFormatRules
	syn cluster mmdInline     contains=mmdInlineCode,mmdInlineItalics,mmdInlineBold,mmdInlineUnderline,mmdInlineStrikethrough
	syn cluster mmdFormatting contains=@mmdFormatColours,mmdFormatCode,mmdFormatComment,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough,mmdFormatItalicsBold,mmdFormatItalicsUnderline,mmdFormatItalicsStrike,mmdFormatBoldUnderline,mmdFormatBoldStrike,mmdFormatUnderlineStrike,mmdFormatAll,mmdFormatItalicsUnderlineStrike,mmdFormatBoldUnderlineStrike,mmdFormatAllPlus,mmdFormatEscape,mmdFormatReferenceMark
	syn cluster mmdFaceFormatting contains=mmdFormatComment,mmdFormatItalics,mmdFormatBold,mmdFormatUnderline,mmdFormatStrikethrough,mmdFormatItalicsBold,mmdFormatItalicsUnderline,mmdFormatItalicsStrike,mmdFormatBoldUnderline,mmdFormatBoldStrike,mmdFormatUnderlineStrike,mmdFormatAll,mmdFormatItalicsUnderlineStrike,mmdFormatBoldUnderlineStrike,mmdFormatAllPlus,mmdFormatEscape,mmdFormatReferenceMark


	syn cluster mmdHeaders        contains=mmdFormatH1,mmdFormatH2,mmdFormatH3,mmdFormatH4,mmdFormatH5,mmdFormatH6
	syn cluster mmdHeadersNouline contains=mmdFormatH1Nouline,mmdFormatH2Nouline,mmdFormatH3Nouline,mmdFormatH4Nouline,mmdFormatH5Nouline,mmdFormatH6Nouline
	syn cluster mmdFormatColours  contains=mmdFormatColourBlack,mmdFormatColourBlue,mmdFormatColourBrown,mmdFormatColourLightGrey,mmdFormatColourGreen,mmdFormatColourCyan,mmdFormatColourRed,mmdFormatColourMagenta,mmdFormatColourYellow,mmdFormatColourWhite,mmdFormatColourHiBlack,mmdFormatColourHiBlue,mmdFormatColourHiBrown,mmdFormatColourHiLightGrey,mmdFormatColourHiGreen,mmdFormatColourHiCyan,mmdFormatColourHiRed,mmdFormatColourHiMagenta,mmdFormatColourHiYellow,mmdFormatColourHiWhite


" ===HEADERS===

	" New-Fashioned
	syn match mmdFormatH1nouline "^.\+\n=\+$"                 contains=@mmdFaceFormatting
	syn match mmdFormatH1nouline "^.\+\n\s\+=\+$"             contains=@mmdFaceFormatting
	syn match mmdFormatH2nouline "^.\+\n-\+$"                 contains=@mmdFaceFormatting
	syn match mmdFormatH2nouline "^.\+\n\s\+-\+$"             contains=@mmdFaceFormatting
	syn match mmdFormatH3nouline "^.\+\n\~\+$"                contains=@mmdFaceFormatting
	syn match mmdFormatH3nouline "^.\+\n\s\+\~\+$"            contains=@mmdFaceFormatting

		" New-Fashioned 2
		syn match mmdFormatH3nouline "^#.\+\n-\+$"        contains=@mmdFaceFormatting
		syn match mmdFormatH3nouline "^#.\+\n\s\+-\+$"    contains=@mmdFaceFormatting
		syn match mmdFormatH4nouline "^##.\+\n-\+$"       contains=@mmdFaceFormatting
		syn match mmdFormatH4nouline "^##.\+\n\s\+-\+$"   contains=@mmdFaceFormatting
		syn match mmdFormatH5nouline "^###.\+\n-\+$"      contains=@mmdFaceFormatting
		syn match mmdFormatH5nouline "^###.\+\n\s\+-\+$"  contains=@mmdFaceFormatting
		syn match mmdFormatH6nouline "^####.\+\n-\+$"     contains=@mmdFaceFormatting
		syn match mmdFormatH6nouline "^####.\+\n\s\+-\+$" contains=@mmdFaceFormatting

		" New-Fashioned 3 (Redundant redundancy)
		syn match mmdFormatH4nouline "^#.\+\n\~\+$"       contains=@mmdFaceFormatting
		syn match mmdFormatH4nouline "^#.\+\n\s\+\~\+$"   contains=@mmdFaceFormatting
		syn match mmdFormatH5nouline "^##.\+\n\~\+$"      contains=@mmdFaceFormatting
		syn match mmdFormatH5nouline "^##.\+\n\s\+\~\+$"  contains=@mmdFaceFormatting
		syn match mmdFormatH6nouline "^###.\+\n\~\+$"     contains=@mmdFaceFormatting
		syn match mmdFormatH6nouline "^###.\+\n\s\+\~\+$" contains=@mmdFaceFormatting

	" Old-Fashioned
	syn region mmdFormatH1 matchgroup=mmdHeadingDelimiter start="##\@!"          end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH1
	syn region mmdFormatH2 matchgroup=mmdHeadingDelimiter start="###\@!"         end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH2
	syn region mmdFormatH3 matchgroup=mmdHeadingDelimiter start="####\@!"        end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH3
	syn region mmdFormatH4 matchgroup=mmdHeadingDelimiter start="#####\@!"       end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH3
	syn region mmdFormatH5 matchgroup=mmdHeadingDelimiter start="######\@!"      end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH3
	syn region mmdFormatH6 matchgroup=mmdHeadingDelimiter start="#######\@!"     end="#*\s*$"     keepend oneline contains=@mmdFaceFormattingH3


" ===FORMATTING===

	" Escape Sequences
	syn match mmdFormatEscape "\\[][\\`*_{}()<>#+.!-~%]"
	syn match mmdFormatEscape "\\r\|\\n\|\\t"

	" Colours
	" TODO: add a customisable colouring system & more streamlined
	
		" Foreground
		syn region mmdFormatColourBlack     matchgroup=mmdColoursDelimiter start=+\\black"\|\\black{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourBlue      matchgroup=mmdColoursDelimiter start=+\\blue"\|\\blue{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourBrown     matchgroup=mmdColoursDelimiter start=+\\brown"\|\\brown{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourGreen     matchgroup=mmdColoursDelimiter start=+\\green"\|\\green{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourCyan      matchgroup=mmdColoursDelimiter start=+\\cyan"\|\\cyan{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourRed       matchgroup=mmdColoursDelimiter start=+\\red"\|\\red{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourMagenta   matchgroup=mmdColoursDelimiter start=+\\magenta"\|\\magenta{+             matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourYellow    matchgroup=mmdColoursDelimiter start=+\\yellow"\|\\yellow{+               matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourWhite     matchgroup=mmdColoursDelimiter start=+\\white"\|\\white{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourLightGrey matchgroup=mmdColoursDelimiter start=+\\grey"\|\\grey{\|\\gray"\|\\gray{+ matchgroup=mmdColoursDelimiter end=+"\|}+

		" Background (highlighting)
		syn region mmdFormatColourHiBlack     matchgroup=mmdColoursDelimiter start=+\\hiblack"\|\\hiblack{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiBlue      matchgroup=mmdColoursDelimiter start=+\\hiblue"\|\\hiblue{+                       matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiBrown     matchgroup=mmdColoursDelimiter start=+\\hibrown"\|\\hibrown{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiGreen     matchgroup=mmdColoursDelimiter start=+\\higreen"\|\\higreen{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiCyan      matchgroup=mmdColoursDelimiter start=+\\hicyan"\|\\hicyan{+                       matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiRed       matchgroup=mmdColoursDelimiter start=+\\hired"\|\\hired{+                         matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiMagenta   matchgroup=mmdColoursDelimiter start=+\\himagenta"\|\\himagenta{+                 matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiYellow    matchgroup=mmdColoursDelimiter start=+\\hiyellow"\|\\hiyellow{+                   matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiWhite     matchgroup=mmdColoursDelimiter start=+\\hiwhite"\|\\hiwhite{+                     matchgroup=mmdColoursDelimiter end=+"\|}+
		syn region mmdFormatColourHiLightGrey matchgroup=mmdColoursDelimiter start=+\\higrey"\|\\higrey{\|\\higray"\|\\higray{+ matchgroup=mmdColoursDelimiter end=+"\|}+

	" Comments
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="/\*"           matchgroup=mmdCommentDelimiter   end="\*/"  keepend contains=mmdCommentNotes
	syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="//"            matchgroup=mmdCommentDelimiter   end="\s*$" keepend contains=mmdCommentNotes
	""""""""syn region mmdFormatComment       matchgroup=mmdCommentDelimiter start="%"             matchgroup=mmdCommentDelimiter   end="\s*$" keepend

	" Meta Data Pre Proc
	syn match mmdFormatMetaProc "^//"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%%"  nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaProc "^%"   nextgroup=@mmdMetaDataParams
	syn match mmdFormatMetaData ".\+$" contained    contains=mmdFormatComment

	" Code
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="^\s\s\s\s\|^\t"     matchgroup=mmdFaceDelimiter    end="\s*$" keepend   contains=@mmdFaceFormattingCode
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="`"                  matchgroup=mmdFaceDelimiter    end="`"    keepend   contains=@mmdFaceFormattingCode
	syn region mmdFormatCode          matchgroup=mmdFaceDelimiter start="```"                matchgroup=mmdFaceDelimiter    end="```"  keepend   contains=@mmdFaceFormattingCode

	" Font Faces

		" Italics
		syn region mmdFormatItalics       matchgroup=mmdFaceDelimiter start="\S\@<=\*\|\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\|\*\S\@="     keepend

		" Bold
		syn region mmdFormatBold          matchgroup=mmdFaceDelimiter start="\S\@<=\*\*\|\*\*\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\|\*\*\S\@=" keepend

		" Underline
		syn region mmdFormatUnderline     matchgroup=mmdFaceDelimiter start="\S\@<=_\|_\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=_\|_\S\@="       keepend

		" Strikethrough
		syn region mmdFormatStrikethrough matchgroup=mmdFaceDelimiter start="\S\@<=\~\|\~\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\~\|\~\S\@="     keepend
		syn region mmdFormatStrikethrough matchgroup=mmdFaceDelimiter start="\S\@<=\~\~\|\~\~\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\~\~\|\~\~\S\@=" keepend

		" Permutations
		"""" Due to how Vim works, this is the only Order they will
		"""" work in, that I care to test, after the previous and these
		
		syn region mmdFormatItalicsBold            matchgroup=mmdFaceDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="       keepend
		syn region mmdFormatItalicsUnderline       matchgroup=mmdFaceDelimiter start="\S\@<=_\*\|_\*\S\@="             matchgroup=mmdFaceDelimiter end="\S\@<=\*_\|\*_\S\@="             keepend
		syn region mmdFormatItalicsStrike          matchgroup=mmdFaceDelimiter start="\S\@<=\~\*\|\~\*\S\@="           matchgroup=mmdFaceDelimiter end="\S\@<=\*\~\|\*\~\S\@="           keepend
		syn region mmdFormatBoldUnderline          matchgroup=mmdFaceDelimiter start="\S\@<=_\*\*\|_\*\*\S\@="         matchgroup=mmdFaceDelimiter end="\S\@<=\*\*_\|\*\*_\S\@="         keepend
		syn region mmdFormatBoldStrike             matchgroup=mmdFaceDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="       matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="       keepend
		syn region mmdFormatUnderlineStrike        matchgroup=mmdFaceDelimiter start="\S\@<=_\~\|_\~\S\@="             matchgroup=mmdFaceDelimiter end="\S\@<=\~_\|\~_\S\@="             keepend
		syn region mmdFormatAll                    matchgroup=mmdFaceDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@="     keepend
		syn region mmdFormatItalicsUnderlineStrike matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\|_\~\*\S\@="         matchgroup=mmdFaceDelimiter end="\S\@<=\*\~_\|\*\~_\S\@="         keepend
		syn region mmdFormatBoldUnderlineStrike    matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\*\|_\~\*\*\S\@="     matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\~_\|\*\*\~_\S\@="     keepend
		syn region mmdFormatAllPlus                matchgroup=mmdFaceDelimiter start="\S\@<=_\~\*\*\*\|_\~\*\*\*\S\@=" matchgroup=mmdFaceDelimiter end="\S\@<=\*\*\*\~_\|\*\*\*\~_\S\@=" keepend

		" Inline Formatting
		" NOTE: Formatting that is meant for certain cirumstances
		""""""""syn match mmdInlineComments      "/\*.*\*/"   keepend contained
		""""""""syn match mmdInlineCode          "`.*`"       keepend contained
		""""""""syn match mmdInlineItalics       "\*.*\*"     keepend contained
		""""""""syn match mmdInlineBold          "\*\*.*\*\*" keepend contained
		""""""""syn match mmdInlineUnedrline     "_.*_"       keepend contained
		""""""""syn match mmdInlineStrikethrough "\~\~.*\~\~" keepend contained


	" Block Quote
	syn region mmdFormatBlockQuote    matchgroup=mmdCommentDelimiter start="^>\|^\s\s\s\s>\|^\t>"                matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>>\|^\s\s\s\s>>\|^\t>>"             matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\|^\s\s\s\s>\s\|^\t>\s"         matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline
	syn region mmdFormatBlockQuote2   matchgroup=mmdCommentDelimiter start="^>\s>\s\|^\s\s\s\s>\s>\s\|^\t>\s>\s" matchgroup=mmdCommentDelimiter   end="\s*$"   keepend contains=@mmdInline

	" Lists
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[-*+~]\s"                      matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[-*+~]\s"                   matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting

	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.\s"                                                    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.)\s"                                                   matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                            matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                           matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"   matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                                                        matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                                                       matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                                matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                               matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"        matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"       matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting

	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.\s"                                                 matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.)\s"                                                matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                         matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                        matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                                                                             matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                                                                            matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                                                     matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                                                    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"                             matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"                            matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.\s"     matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting
	syn region mmdFormatList          matchgroup=mmdCommentDelimiter start="^\s*[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.[[0-9A-Za-z[:alnum:]]*\.)\s"    matchgroup=mmdFaceDelimiter end="\s*$" keepend contains=@mmdFormatting

	" Links
	syn region mmdFormatLink          matchgroup=mmdFaceDelimiter start="<"                matchgroup=mmdFaceDelimiter end=">"      keepend
	syn region mmdFormatLink          matchgroup=mmdLinkDelimiter start=+(+                matchgroup=mmdLinkDelimiter end=+)\|)\]+ keepend contained
	syn region mmdFormatHyperLink     matchgroup=mmdLinkDelimiter start="\["               matchgroup=mmdLinkDelimiter end="\]"     nextgroup=mmdFormatLink,mmdFormatHyperLink contains=@mmdInline,mmdFormatHyperLink,mmdFormatPseudonym
	syn region mmdFormatHyperLink     matchgroup=mmdLinkDelimiter start="\!\["             matchgroup=mmdLinkDelimiter end="\]"     keepend nextgroup=mmdFormatLink,mmdFormatHyperLink contains=@mmdInline,mmdFormatHyperLink,mmdFormatPseudonym
	syn region mmdFormatPseudonym     matchgroup=mmdLinkDelimiter start=+"+                matchgroup=mmdLinkDelimiter end=+"+      keepend contained

	" Footnotes/References
	syn match mmdFormatReferenceMark "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"
	syn match mmdFormatReferenceMark "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]"
	syn match mmdFormatReferenceMark "\[[0-9A-Za-z[:alnum:]]*\]:\s\|\[[0-9A-Za-z[:alnum:]]*\]:\s"
	syn match mmdFormatReferenceMark "\[^[0-9A-Za-z[:alnum:]]*\]:\s\|\[^[0-9A-Za-z[:alnum:]]*\]:\s"

	" Rules
	syn region mmdFormatRules start="^-\s-\s-" end=".*\s*$"    keepend
	syn region mmdFormatRules start="^=\s=\s=" end=".*\s*$"    keepend
	syn region mmdFormatRules start="^\~\s\~\s\~" end=".*\s*$" keepend


	" === Alternate Face Highlighting ===
	"
	" These are for even more permutations, and I hate them.

	" HEADER 1

		syn cluster mmdFaceFormattingH1     contains=mmdFormatItalicsH1,mmdFormatBoldH1,mmdFormatStrikethroughH1,mmdFormatItalicsBoldH1,mmdFormatItalicsStrikeH1,mmdFormatBoldStrikeH1,mmdFormatAllH1

		" Italics
		syn region mmdFormatItalicsH1       matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\|\*\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\|\*\S\@="     keepend contained

		" Bold
		syn region mmdFormatBoldH1          matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\|\*\*\@="         matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\|\*\*\@="   keepend contained

		" Strikethrough
		syn region mmdFormatStrikethroughH1 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\|\~\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\|\~\S\@="     keepend contained
		syn region mmdFormatStrikethroughH1 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\~\|\~\~\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\~\|\~\~\S\@=" keepend contained

		" Permutations
		syn region mmdFormatItalicsBoldH1   matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="   keepend contained
		syn region mmdFormatItalicsStrikeH1 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\|\~\*\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\~\|\*\~\S\@="       keepend contained
		syn region mmdFormatBoldStrikeH1    matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="   keepend contained
		syn region mmdFormatAllH1           matchgroup=mmdFaceHeaderDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@=" matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@=" keepend contained

		" Footnotes/References
		syn match mmdFormatReferenceMarkH1 "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"   contained
		syn match mmdFormatReferenceMarkH1 "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]" contained

	" HEADER 2

		syn cluster mmdFaceFormattingH2     contains=mmdFormatItalicsH2,mmdFormatBoldH2,mmdFormatStrikethroughH2,mmdFormatItalicsBoldH2,mmdFormatItalicsStrikeH2,mmdFormatBoldStrikeH2,mmdFormatAllH2,mmdFormatReferenceMarkH2

		" Italics
		syn region mmdFormatItalicsH2       matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\|\*\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\|\*\S\@="     keepend contained

		" Bold
		syn region mmdFormatBoldH2          matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\|\*\*\@="         matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\|\*\*\@="   keepend contained

		" Strikethrough
		syn region mmdFormatStrikethroughH2 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\|\~\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\|\~\S\@="     keepend contained
		syn region mmdFormatStrikethroughH2 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\~\|\~\~\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\~\|\~\~\S\@=" keepend contained

		" Permutations
		syn region mmdFormatItalicsBoldH2   matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="   keepend contained
		syn region mmdFormatItalicsStrikeH2 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\|\~\*\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\~\|\*\~\S\@="       keepend contained
		syn region mmdFormatBoldStrikeH2    matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="   keepend contained
		syn region mmdFormatAllH2           matchgroup=mmdFaceHeaderDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@=" matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@=" keepend contained

		" Footnotes/References
		syn match mmdFormatReferenceMarkH2 "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"   contained
		syn match mmdFormatReferenceMarkH2 "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]" contained

	" HEADER 3

		syn cluster mmdFaceFormattingH3     contains=mmdFormatItalicsH3,mmdFormatBoldH3,mmdFormatStrikethroughH3,mmdFormatItalicsBoldH3,mmdFormatItalicsStrikeH3,mmdFormatBoldStrikeH3,mmdFormatAllH3,mmdFormatReferenceMarkH3

		" Italics
		syn region mmdFormatItalicsH3       matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\|\*\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\|\*\S\@="     keepend contained

		" Bold
		syn region mmdFormatBoldH3          matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\|\*\*\@="         matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\|\*\*\@="   keepend contained

		" Strikethrough
		syn region mmdFormatStrikethroughH3 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\|\~\S\@="           matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\|\~\S\@="     keepend contained
		syn region mmdFormatStrikethroughH3 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\~\|\~\~\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\~\~\|\~\~\S\@=" keepend contained

		" Permutations
		syn region mmdFormatItalicsBoldH3   matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="   keepend contained
		syn region mmdFormatItalicsStrikeH3 matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\|\~\*\S\@="       matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\~\|\*\~\S\@="       keepend contained
		syn region mmdFormatBoldStrikeH3    matchgroup=mmdFaceHeaderDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="   matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="   keepend contained
		syn region mmdFormatAllH3           matchgroup=mmdFaceHeaderDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@=" matchgroup=mmdFaceHeaderDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@=" keepend contained

		" Footnotes/References
		syn match mmdFormatReferenceMarkH3 "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"   contained
		syn match mmdFormatReferenceMarkH3 "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]" contained

	" CODE

		syn cluster mmdFaceFormattingCode contains=mmdFormatItalicsCode,mmdFormatBoldCode,mmdFormatUnderlineCode,mmdFormatStrikethroughCode,mmdFormatItalicsBoldCode,,mmdFormatItalicsUnderlineCode,mmdFormatItalicsStrikeCode,mmdFormatBoldUnderlineCode,mmdFormatBoldStrikeCode,mmdFormatUnderlineStrikeCode,mmdFormatAllCode,mmdFormatItalicsUnderlineStrikeCode,mmdFormatBoldUnderlineStrikeCode,mmdFormatAllPlussCode,mmdFormatReferenceMarkCode

		" Italics
		syn region mmdFormatItalicsCode                matchgroup=mmdFaceCodeDelimiter start="\S\@<=\*\|\*\S\@="               matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\|\*\S\@="               keepend contained

		" Bold
		syn region mmdFormatBoldCode                   matchgroup=mmdFaceCodeDelimiter start="\S\@<=\*\*\|\*\*\S\@="           matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\|\*\*\S\@="           keepend contained

		" Underline
		"syn region mmdFormatUnderlineCode              matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\|_\S\@="                 matchgroup=mmdFaceCodeDelimiter end="\S\@<=_\|_\S\@="                 keepend contained

		" Strikethrough
		syn region mmdFormatStrikethroughCode          matchgroup=mmdFaceCodeDelimiter start="\S\@<=\~\|\~\S\@="               matchgroup=mmdFaceCodeDelimiter end="\S\@<=\~\|\~\S\@="               keepend contained
		syn region mmdFormatStrikethroughCode          matchgroup=mmdFaceCodeDelimiter start="\S\@<=\~\~\|\~\~\S\@="           matchgroup=mmdFaceCodeDelimiter end="\S\@<=\~\~\|\~\~\S\@="           keepend contained

		" Permutations
		syn region mmdFormatItalicsBoldCode            matchgroup=mmdFaceCodeDelimiter start="\S\@<=\*\*\*\|\*\*\*\S\@="       matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\*\|\*\*\*\S\@="       keepend contained
		syn region mmdFormatItalicsUnderlineCode       matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\*\|_\*\S\@="             matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*_\|\*_\S\@="             keepend contained
		syn region mmdFormatItalicsStrikeCode          matchgroup=mmdFaceCodeDelimiter start="\S\@<=\~\*\|\~\*\S\@="           matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\~\|\*\~\S\@="           keepend contained
		syn region mmdFormatBoldUnderlineCode          matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\*\*\|_\*\*\S\@="         matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*_\|\*\*_\S\@="         keepend contained
		syn region mmdFormatBoldStrikeCode             matchgroup=mmdFaceCodeDelimiter start="\S\@<=\~\*\*\|\~\*\*\S\@="       matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\~\|\*\*\~\S\@="       keepend contained
		syn region mmdFormatUnderlineStrikeCode        matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\~\|_\~\S\@="             matchgroup=mmdFaceCodeDelimiter end="\S\@<=\~_\|\~_\S\@="             keepend contained
		syn region mmdFormatAllCode                    matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\*\*\*\|_\*\*\*\S\@="     matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\*_\|\*\*\*_\S\@="     keepend contained
		syn region mmdFormatItalicsUnderlineStrikeCode matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\~\*\|_\~\*\S\@="         matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\~_\|\*\~_\S\@="         keepend contained
		syn region mmdFormatBoldUnderlineStrikeCode    matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\~\*\*\|_\~\*\*\S\@="     matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\~_\|\*\*\~_\S\@="     keepend contained
		syn region mmdFormatAllPlusCode                matchgroup=mmdFaceCodeDelimiter start="\S\@<=_\~\*\*\*\|_\~\*\*\*\S\@=" matchgroup=mmdFaceCodeDelimiter end="\S\@<=\*\*\*\~_\|\*\*\*\~_\S\@=" keepend contained

		" Footnotes/References
		syn match mmdFormatReferenceMarkCode "\[[0-9A-Za-z[:alnum:]]*\]\|\[[0-9A-Za-z[:alnum:]]*\]"   contained
		syn match mmdFormatReferenceMarkCode "\[^[0-9A-Za-z[:alnum:]]*\]\|\[^[0-9A-Za-z[:alnum:]]*\]" contained


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
		hi def mmdFormatRules cterm=strikethrough,bold                                                    gui=strikethrough,bold

		" Colours

			" Delimiter
			hi def link mmdColoursDelimiter Delimiter

			" Formatting

			" Foreground
			hi def mmdFormatColourBlack       ctermfg=black        ctermbg=white              guifg=black        guibg=white
			hi def mmdFormatColourBlue        ctermfg=blue                                    guifg=blue
			hi def mmdFormatColourBrown       ctermfg=darkyellow                              guifg=darkyellow   
			hi def mmdFormatColourLightGrey   ctermfg=lightgrey                               guifg=lightgrey
			hi def mmdFormatColourGreen       ctermfg=green                                   guifg=green
			hi def mmdFormatColourCyan        ctermfg=cyan                                    guifg=cyan
			hi def mmdFormatColourRed         ctermfg=red                                     guifg=red
			hi def mmdFormatColourMagenta     ctermfg=magenta                                 guifg=magenta
			hi def mmdFormatColourYellow      ctermfg=yellow                                  guifg=yellow
			hi def mmdFormatColourWhite       ctermfg=white        ctermbg=black              guifg=white        guibg=black

			" Background (Highlighting)
			hi def mmdFormatColourHiBlack     ctermbg=black        ctermfg=yellow             guibg=black        guifg=yellow
			hi def mmdFormatColourHiBlue      ctermbg=blue                                    guibg=blue
			hi def mmdFormatColourHiBrown     ctermbg=darkyellow                              guibg=darkyellow   
			hi def mmdFormatColourHiLightGrey ctermbg=lightgrey                               guibg=lightgrey
			hi def mmdFormatColourHiGreen     ctermbg=green                                   guibg=green
			hi def mmdFormatColourHiCyan      ctermbg=cyan                                    guibg=cyan
			hi def mmdFormatColourHiRed       ctermbg=red                                     guibg=red
			hi def mmdFormatColourHiMagenta   ctermbg=magenta                                 guibg=magenta
			hi def mmdFormatColourHiYellow    ctermbg=yellow                                  guibg=yellow
			hi def mmdFormatColourHiWhite     ctermbg=white        ctermfg=black              guibg=white        guifg=black

		" Font Faces

			" Delimiter
			hi def link mmdCommentDelimiter   Comment
			hi def link mmdFaceDelimiter      Delimiter
			hi def      mmdLinkDelimiter      ctermfg=darkyellow                              guifg=darkyellow

			" Inline
			hi def link mmdFormatComment           Comment
			hi def      mmdFormatMetaProc          cterm=bold           ctermfg=cyan               gui=bold           guifg=cyan
			hi def link mmdFormatMetaDataParams    mmdFormatMetaProc
			hi def link mmdFormatMetaData          Preproc
			hi def      mmdFormatCode              ctermfg=white        ctermbg=darkblue           guifg=white        guibg=darkblue

			" Meta
			hi def link mmdMetaTagsGeneral mmdFormatMetaProc
			hi def link mmdMetaTagsAuthor  mmdFormatMetaProc
			hi def link mmdMetaTagsAgent   mmdFormatMetaProc
			hi def link mmdMetaTagsPaper   mmdFormatMetaProc

			" Other Keywords
			hi def mmdCommentNotes    cterm=bold,underline      ctermfg=darkcyan      gui=bold,underline guifg=darkcyan

			" Italics
			hi def mmdFormatItalics                cterm=italic                                 gui=italic
			hi def mmdFormatItalicsBold            cterm=italic,bold                            gui=italic,bold
			hi def mmdFormatItalicsUnderline       cterm=italic,underline                       gui=italic,underline
			hi def mmdFormatItalicsUnderlineStrike cterm=italic,underline,strikethrough         gui=italic,underline,strikethrough
			hi def mmdFormatItalicsStrike          cterm=italic,strikethrough                   gui=italic,strikethrough

			" Bold                                                                                                                                
			hi def mmdFormatBold                   cterm=bold                                   gui=bold
			hi def mmdFormatBoldUnderline          cterm=bold,underline                         gui=bold,underline
			hi def mmdFormatBoldUnderlineStrike    cterm=bold,underline,strikethrough           gui=bold,underline,strikethrough
			hi def mmdFormatBoldStrike             cterm=bold,strikethrough                     gui=bold,strikethrough

			" Underline                                                                                                                           
			hi def mmdFormatUnderline              cterm=underline                              gui=underline
			hi def mmdFormatUnderlineStrike        cterm=underline,strikethrough                gui=underline,strikethrough

			" Strikethrough                                                                                                                       
			hi def mmdFormatStrikethrough          cterm=strikethrough                          gui=strikethrough

			" All                                                                                                                         
			hi def mmdFormatAll                    cterm=italic,bold,underline                  gui=italic,bold,underline
			hi def mmdFormatAllPlus                cterm=italic,bold,underline,strikethrough    gui=italic,bold,underline,strikethrough

			" Inline
			hi def link mmdInlineComments          mmdFormatComment
			hi def link mmdInlineCode              mmdFormatCode
			hi def link mmdInlineItalics           mmdFormatItalics
			hi def link mmdInlineBold              mmdFormatBold
			hi def link mmdInlineUnedrline         mmdFormatUnderline
			hi def link mmdInlineStrikethrough     mmdFormatStrikethrough

			" Block Quotes
			hi def mmdFormatBlockQuote             ctermfg=white        ctermbg=darkmagenta     guifg=white          guibg=darkmagenta
			hi def mmdFormatBlockQuote2            ctermfg=lightgreen   ctermbg=darkmagenta     guifg=lightgreen     guibg=darkmagenta

			" Links
			hi def link mmdFormatLink              Underlined
			hi def mmdFormatHyperLink              ctermfg=darkyellow                           guifg=darkyellow
			hi def mmdFormatPseudonym              ctermfg=lightgreen                           guifg=lightgreen

			" References                                                                                           
			hi def mmdFormatReferenceMark          ctermfg=lightgreen                           guifg=lightgreen

			" Escape Chars                                                                                         
			hi def mmdFormatEscape                 ctermfg=yellow                               guifg=yellow


		" === Alternate Face Highlights ===
		"
		" These are for within headers and coding, etc.
		" In otherwords, more, rediculous permutations
		" that I hate and want to burn.

		" Delimiters

			" Header
			hi def mmdFaceHeaderDelimiter          cterm=bold,underline    ctermfg=lightmagenta        gui=bold,underline    guifg=lightmagenta

			" Code
			hi def mmdFaceCodeDelimiter            ctermfg=yellow          ctermbg=darkblue            guifg=yellow          guibg=darkblue

		" HEADER 1

			" Italics
			hi def mmdFormatItalicsH1              cterm=italic,underline                      ctermfg=magenta    gui=italic,underline                       guifg=magenta
			hi def mmdFormatItalicsBoldH1          cterm=italic,bold,underline                 ctermfg=magenta    gui=italic,bold,underline                  guifg=magenta
			hi def mmdFormatItalicsStrikeH1        cterm=italic,underline,strikethrough        ctermfg=magenta    gui=italic,underline,strikethrough         guifg=magenta

			" Bold                                                                                                                                                             
			hi def mmdFormatBoldH1                 cterm=bold,underline                        ctermfg=magenta    gui=bold,underline                         guifg=magenta
			hi def mmdFormatBoldStrikeH1           cterm=bold,strikethrough,underline          ctermfg=magenta    gui=bold,strikethrough,underline           guifg=magenta

			" Strikethrough                                                                                                                                                
			hi def mmdFormatStrikethroughH1        cterm=strikethrough,underline               ctermfg=magenta    gui=strikethrough,underline                guifg=magenta

			" All                                                                                                                                                  
			hi def mmdFormatAllH1                  cterm=italic,bold,underline,strikethrough   ctermfg=magenta    gui=italic,bold,underline,strikethrough    guifg=magenta

			" References                                                                                 
			hi def mmdFormatReferenceMarkH1        cterm=bold                                  ctermfg=lightgreen gui=bold                                   guifg=lightgreen

		" HEADER 2

			" Italics
			hi def mmdFormatItalicsH2              cterm=italic,underline                      ctermfg=yellow     gui=italic,underline                       guifg=yellow
			hi def mmdFormatItalicsBoldH2          cterm=italic,bold,underline                 ctermfg=yellow     gui=italic,bold,underline                  guifg=yellow
			hi def mmdFormatItalicsStrikeH2        cterm=italic,underline,strikethrough        ctermfg=yellow     gui=italic,underline,strikethrough         guifg=yellow

			" Bold                                                                                                                                                          
			hi def mmdFormatBoldH2                 cterm=bold,underline                        ctermfg=yellow     gui=bold,underline                         guifg=yellow
			hi def mmdFormatBoldStrikeH2           cterm=bold,strikethrough,underline          ctermfg=yellow     gui=bold,strikethrough,underline           guifg=yellow

			" Strikethrough                                                                                                                                                 
			hi def mmdFormatStrikethroughH2        cterm=strikethrough,underline               ctermfg=yellow     gui=strikethrough,underline                guifg=yellow

			" All                                                                                                                                                           
			hi def mmdFormatAllH2                  cterm=italic,bold,underline,strikethrough   ctermfg=yellow     gui=italic,bold,underline,strikethrough    guifg=yellow

			" References                                                                                         
			hi def mmdFormatReferenceMarkH2        cterm=bold                                  ctermfg=lightgreen gui=bold                                   guifg=lightgreen

		" HEADER 3

			" Italics
			hi def mmdFormatItalicsH3              cterm=italic,underline                      ctermfg=cyan       gui=italic,underline                       guifg=cyan
			hi def mmdFormatItalicsBoldH3          cterm=italic,bold,underline                 ctermfg=cyan       gui=italic,bold,underline                  guifg=cyan
			hi def mmdFormatItalicsStrikeH3        cterm=italic,underline,strikethrough        ctermfg=cyan       gui=italic,underline,strikethrough         guifg=cyan

			" Bold                                                                                                                                                            
			hi def mmdFormatBoldH3                 cterm=bold,underline                        ctermfg=cyan       gui=bold,underline                         guifg=cyan
			hi def mmdFormatBoldStrikeH3           cterm=bold,strikethrough,underline          ctermfg=cyan       gui=bold,strikethrough,underline           guifg=cyan

			" Strikethrough                                                                                                                                                   
			hi def mmdFormatStrikethroughH3        cterm=strikethrough,underline               ctermfg=cyan       gui=strikethrough,underline                guifg=cyan

			" All                                                                                                                                                             
			hi def mmdFormatAllH3                  cterm=italic,bold,underline,strikethrough   ctermfg=cyan       gui=italic,bold,underline,strikethrough    guifg=cyan

			" References                                                                                         
			hi def mmdFormatReferenceMarkH3        cterm=bold                                  ctermfg=lightgreen gui=bold                                   guifg=lightgreen

		" CODE

			" Italics
			hi def mmdFormatItalicsCode                cterm=italic                              ctermfg=white ctermbg=darkblue gui=italic                              ctermfg=white ctermbg=darkblue
			hi def mmdFormatItalicsBoldCode            cterm=italic,bold                         ctermfg=white ctermbg=darkblue gui=italic,bold                         ctermfg=white ctermbg=darkblue
			hi def mmdFormatItalicsUnderlineCode       cterm=italic,underline                    ctermfg=white ctermbg=darkblue gui=italic,underline                    ctermfg=white ctermbg=darkblue
			hi def mmdFormatItalicsUnderlineStrikeCode cterm=italic,underline,strikethrough      ctermfg=white ctermbg=darkblue gui=italic,underline,strikethrough      ctermfg=white ctermbg=darkblue
			hi def mmdFormatItalicsStrikeCode          cterm=italic,strikethrough                ctermfg=white ctermbg=darkblue gui=italic,strikethrough                ctermfg=white ctermbg=darkblue

			" Bold
			hi def mmdFormatBoldCode                   cterm=bold                                ctermfg=white ctermbg=darkblue gui=bold                                ctermfg=white ctermbg=darkblue
			hi def mmdFormatBoldUnderlineCode          cterm=bold,underline                      ctermfg=white ctermbg=darkblue gui=bold,underline                      ctermfg=white ctermbg=darkblue
			hi def mmdFormatBoldUnderlineStrikeCode    cterm=bold,underline,strikethrough        ctermfg=white ctermbg=darkblue gui=bold,underline,strikethrough        ctermfg=white ctermbg=darkblue
			hi def mmdFormatBoldStrikeCode             cterm=bold,strikethrough                  ctermfg=white ctermbg=darkblue gui=bold,strikethrough                  ctermfg=white ctermbg=darkblue

			" Underline
			hi def mmdFormatUnderlineCode              cterm=underline                           ctermfg=white ctermbg=darkblue gui=underline                           ctermfg=white ctermbg=darkblue
			hi def mmdFormatUnderlineStrikeCode        cterm=underline,strikethrough             ctermfg=white ctermbg=darkblue gui=underline,strikethrough             ctermfg=white ctermbg=darkblue

			" Strikethrough
			hi def mmdFormatStrikethroughCode          cterm=strikethrough                       ctermfg=white ctermbg=darkblue gui=strikethrough                       ctermfg=white ctermbg=darkblue

			" All
			hi def mmdFormatAllCode                    cterm=italic,bold,underline               ctermfg=white ctermbg=darkblue gui=italic,bold,underline               ctermfg=white ctermbg=darkblue
			hi def mmdFormatAllPlusCode                cterm=italic,bold,underline,strikethrough ctermfg=white ctermbg=darkblue gui=italic,bold,underline,strikethrough ctermfg=white ctermbg=darkblue

			" References
			hi def link mmdFormatReferenceMarkCode     mmdFormatReferenceMark


let b:current_syntax = "mmarkdown"
