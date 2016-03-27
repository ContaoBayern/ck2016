#!/bin/bash
#
# Präsentations-Slides für die Contao Konferenz 2016

TALK=slides

# Javascript Framework für die Slides
FORMAT=revealjs
## #FORMAT=S5
## #FORMAT=Slidy
## #FORMAT=DZSlides
## #FORMAT=Slideous

# Für FORMAT=revealjs

#THEME=beige
THEME=black
#THEME=blood
#THEME=league
#THEME=moon
###THEME=night
#THEME=serif
#THEME=simple
#THEME=sky
#THEME=solarized
#THEME=white

# Syntax-Highlighting Style

#HIGHLIGHT=pygments
### #HIGHLIGHT=kate
HIGHLIGHT=espresso
#HIGHLIGHT=haddock
#HIGHLIGHT=tango
#HIGHLIGHT=zenburn


if [ ${FORMAT} == 'revealjs' ]
then
  pandoc \
    --to=${FORMAT} \
    --standalone -V \
    theme=${THEME} \
    --highlight-style ${HIGHLIGHT}  \
    ${TALK}.md \
    --output=${TALK}.html
  sed -i '' -e "s/simple.css/${THEME}.css/" ${TALK}.html
else
  pandoc --to=${FORMAT} --standalone ${TALK}.md --output=${TALK}.html
fi


# PDF für den Druck

#pandoc ${TALK}.md --highlight-style ${HIGHLIGHT} --output=${TALK}.pdf
pandoc ${TALK}.md --output=${TALK}.pdf

echo "done!"

## EOF ##
