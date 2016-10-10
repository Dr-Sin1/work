#!/bin/sh
IFN="$1"					# Input File Name
OFN="${IFN%.*}"				# Output File Name
TMP=$(head -1 "${IFN}")		# get head from text
LEGENDS=(`echo ${TMP}`)		# head to array[]
TTL="${LEGENDS[0]}"			# Graph Title ( array[0] )
#
LEN="$2"					# number of element
XLB="$3"					# X Label
YLB="$4"					# Y Label
#
#YRS=0						# Y Range Start
#YRE=50						# Y Range End
#
gnuplot << EOF
set terminal postscript eps color enhanced size 4,3		# eps format (4:3)
set font "arial,21"										# font:arial, font-size:21
set output '/dev/null'
#
set title "${TTL}"
set xlabel "${XLB}"
set ylabel "${YLB}"
#set yrange["${YRS}":"${YRE}"]
#
set key left top			# Key's coordinate [left],[right],[top],[bottom],[outside],[below] or [x,y]
set key reverse				# Position of the line [reverse] or [noreverse]
set key samplen 2			# Length of the line (ex. 2 characters)
set key Left				# Position of the character [Right] or [Left]
set key box					# Frame border
#set key title "legend"		# Key's Title
#
#set zeroaxis				# Coordinate axes
#set grid xtics				# X-axis scale
set grid ytics				# Y-axis scale
#set logscale x 10			# X-axis Log Scale (10 base)
#set logscale y 2			# Y-axis Log Scale ( 2 base)
set format y "%g"			# format of Numeric value
#
# Plot of the Bar Graph (max 8 elements)
#
set style histogram clustered
set style histogram rowstacked		# Stacked bar chart [rowstacked] or [columnstacked]
set style fill solid border linecolor rgbcolor "#ffffff"
#
plot "${IFN}" using 2:xtic(1) with histogram title "${LEGENDS[1]}"
if (${LEN}>=2) replot "${IFN}" using 3:xtic(1) with histogram title "${LEGENDS[2]}"
if (${LEN}>=3) replot "${IFN}" using 4:xtic(1) with histogram title "${LEGENDS[3]}"
if (${LEN}>=4) replot "${IFN}" using 5:xtic(1) with histogram title "${LEGENDS[4]}"
if (${LEN}>=5) replot "${IFN}" using 6:xtic(1) with histogram title "${LEGENDS[5]}"
if (${LEN}>=6) replot "${IFN}" using 7:xtic(1) with histogram title "${LEGENDS[6]}"
if (${LEN}>=7) replot "${IFN}" using 8:xtic(1) with histogram title "${LEGENDS[7]}"
if (${LEN}>=8) replot "${IFN}" using 9:xtic(1) with histogram title "${LEGENDS[8]}"
#
set output "${OFN}.eps"						# Output eps format
replot
#
set terminal png enhanced size 960,720		# png format (960px,720px)
set output "${OFN}.png"						# Output png format
replot
#
EOF
