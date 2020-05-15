#Example MMD Document 1

The purpose of this series is to show what all M-Markdown strives to do;
to show good M-Markdown, etc.
But this first document is to demonstrate that M-Markdown is fully compatible with normal Markdown, despite it's different purpose intent
(to be on easy-to-learn, simple typesetting markup language;
perhaps even a simplistic front end for more traditionals, like LaTeX or some Roff implementations.)


##Formatting

The most important types of formatting in Markdown (MD) your inline formatting and blocks quotes.
After that, are your code blocks, embedded links, and headings.
Though, because MD was made as a front-end HTML, it was _**never**_ intended for extensive formatting options---%
rather, it was relies on CSS to determine those things.

Extending MD is rather controversial in my own mind.
I have opted to eliminate any felt redundancy, and extend where necessary, such as options for setting page size and the like, if compiled.


###Inline Formatting

Inline formatting is formatting that seldom begins or ends a line, often having unformatted or even differently formatted text on both sides.
Normal MD utilises *emphasis*, *oblique (bold)*, *url/link*, *embedded links*, *code*, and *strikethrough*.
M-Markdown (MMD) Uses all of these, with the addition of options for highlighting, colouring text, in-line comments, and underlining.


####Emphasis

*Emphasis* is usually synonymous with *italics*, however, it is context-based.
Whatever formatting is easier to read in context of the relevant font face, that is what emphasis uses.
MD only has emphasis, as again, CSS styling under the hood handles, when compiling the HTML code.

As MMD distinguishes, *emphasis* is now replaced thematically with *italic(s)*.
As of the time of writing this document, there is no compiler for MMD, thus it is purely an idealogical construct.
It is notable that MMD is compatible with [*good*](https://www.markdownguide.org/basic-syntax) Markdown,
but in the future, the opposite certainly will not be true.

*Italics* is delimited by wrapping the desired content in two single asterisks (\*).
As stated before, unlike MD's *emphasis*, MMD's *italics* cannot be delimited via underscores (\_).

Again, what matters is *compiler*.
The MMD Syntax highlighting file will only show underscores as underlined text.
Something like `pandoc` can, obviously, only show it how your CSS styling demands it.


####Bold

**Bold** in _*good*_ MD is delineäted solely through the use of asterisks, unlike *emphasis*, whereïn underscores are acceptable.

Text may be emboldened via two asterisks on both sides of the pursuant content.


####Monospace

Depending on the content in question, mono-spaced formatting, or "code" may be desired.
As the name implies, `code`, or `monospace`, is often used for *code* or *shell commands*, etc.

`Monospace` may be dileneäted by way of a single grave about both sides of the relevant.

####Permutations at a Glance:

*italics*
***BI***
_*IU*_
_*IUS*_
*IS*

**Bold**
_**BU**_
_**BUS**_
**BS**

Strike

_Underline_
_US_

_***All***_
_***ALL+***_


###Block Formatting

Block formatting is usful where you have an entire block of text that needs a specific form of formatting.
Unlike inline formatting, block formatting begins at the beginning of a line, but only ends at the end of the line.
There are only three basic types of block formatting in MD and, likewise, in MMD, *block quotes*, *code blocks*, and *list blocks*.


####Block Quotes

Block quotes are dilineäted by a single or double *greater than* (\>) sign at the beginning of the line.
In MD, these compile to block quotes and block quotes within block quotes.

>This is a block quote of meaningless text.
>>This is a block within a block.
>This text is completely meaningless.
>  No One


####Code Block

A *code block* or *monospaced block* is almost always used to list segments of code or configs.
In MD, they are easily listed via four initial spaces ( ) or a lone tab.

    \1. #include <stdio.h>
    \2.
    \3. int main(void) {
    \4.         printf("Hello, World\!\n");
    \5. }

And again:

    % echo -n "\\ESC\[1;31mHello\\ESC\[32m, \\ESC\[33mWorld\\ESC\[34\!\\ESC\[0m"

_**NOTE**_**:** In order to avoid confusion with bulleted lists, do escape numbers and bullet characters, if put at the beginning of the line.


####Lists Blocks

*Lists* are blocks used for listing items (go figure.)


#####Bulleted Lists

*Bulleted*, or *“unoreded”*, lists are lists that follow no hiërarchy (unlike a numbered list/outline.)
They are dilineated in MD with any of the following characters:
\*, \+, \-.
But, in MMD, they can also be called with \,
and they must have a space after the bullet character.

* Take out the trash
* Do the dishes
* Learn the Fo programming language

-- or --

+ Throw out the cabbage
+ Plant some carrots
+ Invest in UV lights for the “indoor” plants

-- or --

- Film rant about Distrowatch again
- Tell Amy happy birthday
- Set up rat traps and don't tell my vegan neighbour

While I cannot recall if it is good MD, it certainly is good MMD to indent lists and their children:

* Go to the store; get:
    + Carrots
        - Raw
	     if out, settle for baby carrots
    + Corn
        - Preferrably whole kernel corn
    + Organic beef steaks
* Swing by pet shop:
    + Get raw cow milk for lactose intolerance
    + Lust after the Macaws
    + Get fish food
* Pretend to consider attending the Mardi Gras parade, but don't, then drop $40 on a _**GOOD**_ King Cake


#####Numbered Lists

*Numbered* or *ordered* lists are lists that often use numbers.
With MMD, Ordered lists can start with numbers or letters.

1. This is the first thing on the list
    1.1. Sub Item 1
    1.2. And so on...
2. This is the second
3. And so on...

-- or --

A. Item 1
B. Item 2
C. Onward...

-- or --

a. Item 1
b. Item 2
c. Onward...

-- or --

I.   Line 1
II.  Line 2
III. Line 3
IV.  Line 4
V.   etc.

-- or --

i.   Line 1
ii.  Line 2
iii. Line 3
iv.  Line 4
v.   etc.


###Headers

All header options are viable in MMD and beyond, and they have been extended.


####Poundsigns

By placing poundsigns (\#) at the start of a line, you dileneäte headers.
There are six levels.

+ #H1
+ ##H2
+ ###H3
...
+ ######H6

Alternatively, you may enwrap them:

+ #H1#
...
+ ######H6######


####MD Alternative

In MD, *H1* and *H2* have an alternative formattings, using equal signs or dashes on the next line.
You may put unly one or extend them unto the end of the line:

+ H1\r
  =
+ H2\r
  -

--or--

+ Heading 1\r
  =========
+ Heading 2\r
  ---------


####MDD Extended Alternatives

MDD has extended these, logically, using tildes (\) and initial hashtags in increasingly diminishing order


#####MDD Ext. Alt. 1

It is extent to how it is in MD

+ H1\r
  =

There are no further variations at the present time.
While it is tempting to redundantly continue that from H2 to H6, that is not on the table right now.


#####MDD Ext. Alt. 2

H2 is the same as in MD, but, you add a poundsign (\#) from one four before to dileneäte H3 to H6.

+ H2\r
  -
+ #H3\r
  -
+ ##H4\r
  -
+ ###H5\r
  -
+ ####H6\r
  -

#####MDD Ext. Alt. 3

H3 can alternatively be dileneäted with tildes.

+ H3\r
  

Following the pattern, you may extend from H4 to H6 using one pound sign to three pound signs.

+ H3\r
+ #H4\r
+ ##H5\r
+ ###H6\r
  


###Embedded Links

Links and embedded links are shown via round ( () ) and square ( \[\] ) brackets, as well as an exclamation point (\!) and less than and greater than signs ( \<\> ).


####Embedded URL's

Simple links that show the full URL are farmatted with the less/greater signs surrounding the link in question.

<https://Devuan.org>


####Pseudonym Embedded Links

Embedded links are made by placing the text you want to make clickable in either square brackets or in double quotes in the square brackets, then place the link in round brackets.

For a more stream-lined \*NIX experience, [enter the Void, now](https://voidlinux.org)\!

--or--

["Red Hat"](https://www.redhat.com/en) was one of the first companies to bring the Linux kernel to to the enterprise, professionally.


####Embedding images

Using the same construct above, but adding an exclamation point before the initial square bracket.
Just be sure to link directly to the location of the image itself.

!["Debiän--stable, efficient, and better than Ubuntu\!"](https://www.debian.org/Pics/openlogo-50.png)

The text in the quotes in the square brackets, represents text that would show when hovering over the image with a mouse.


####Hyperlinked Embedded Images

Similar to the previous, but wrap that within itself.

[!["Pop\!\_OS, the only reason Ubuntu should exist\!"](https://pop.system76.com/_nuxt/img/623f266-700.png)](https://pop.system76.com/)


####Footnotes, Endnotes, and References

Footnotes, Endnotes, and References work using square brackets and carrots (^).
They work the same in MMD as in MD.

#####Reference Markers

*References* are done by simply placing the reference within square brackets[1].
Alternatively, you may use letters, of course.


#####Footnote Markers

*Footnote markers* are shown the same as reference marks, but with a carrot before the number, letter, or series--think of powers in math[^26].


#####References

The actual information that the *ref.* mark or footnote mark is pointing to (or the *reference*) is dileneäted the same exact way as reference and footnote marks themselves are, but at the beginning of their own line, with a colon after them.

[1]: Example reference

[^26]: Example Reference 2

Note, you just place them after the section you are writing or even after the mark.
A compiler ***should*** try and place it where it is--MD is not clear in the differences between *end notes* and footnotes, so it is wise to place them where they are supposed to physically end up.


######Endnotes

Finally, *end notes*.
They are exactly the same as footnotes, just manually place them at the end of the document.

**\[EOF\]**

- - - -

[2a]:  Example
[^57]: Example


##Conclusion

This version shows what you might need to do to prepare the M-Markdown version for compiling as an MD file, if you are using MMD's syntax highlighting for ease of navigation, so long as you tried to keep *good MD* habits.
