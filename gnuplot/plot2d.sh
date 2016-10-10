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
XRS=0						# X Range Start
XRE=360						# X Range End
YRS=-1						# Y Range Start
YRE=1						# Y Range End
#
#TYP="lines linewidth 3"	# LineGraph
TYP="points pointsize 1"	# PointGraph
#TYP="linespoints"			# etc [linespoints],[impulses],[steps] or [boxes]
#
gnuplot << EOF
set terminal postscript eps color enhanced size 4,3		# eps format (4:3)
set font "arial,21"										# font:arial, font-size:21
set output '/dev/null'
#
set title "${TTL}"
set xlabel "${XLB}"
set ylabel "${YLB}"
set xrange["${XRS}":"${XRE}"]
set yrange["${YRS}":"${YRE}"]
#
set key left bottom			# Key's coordinate [left],[right],[top],[bottom],[outside],[below] or [x,y]
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
#set format x "10^{%L}"		# format of Numeric value (ex. 10^n)
set format y "%.1f"			# (ex. The first decimal place)
#
# Plot of the Graph (max 8 elements)
#
plot "${IFN}" using 1:2 with ${TYP} linecolor rgbcolor "#0000ff" title "${LEGENDS[1]}"
if (${LEN}>=2) replot "${IFN}" using 1:3 with ${TYP} linecolor rgbcolor "#ff0000" title "${LEGENDS[2]}"
if (${LEN}>=3) replot "${IFN}" using 1:4 with ${TYP} linecolor rgbcolor "#00ff00" title "${LEGENDS[3]}"
if (${LEN}>=4) replot "${IFN}" using 1:5 with ${TYP} linecolor rgbcolor "#ffff00" title "${LEGENDS[4]}"
if (${LEN}>=5) replot "${IFN}" using 1:6 with ${TYP} linecolor rgbcolor "#00ffff" title "${LEGENDS[5]}"
if (${LEN}>=6) replot "${IFN}" using 1:7 with ${TYP} linecolor rgbcolor "#ff00ff" title "${LEGENDS[6]}"
if (${LEN}>=7) replot "${IFN}" using 1:8 with ${TYP} linecolor rgbcolor "#ff8800" title "${LEGENDS[7]}"
if (${LEN}>=8) replot "${IFN}" using 1:9 with ${TYP} linecolor rgbcolor "#006400" title "${LEGENDS[8]}"
#
set output "${OFN}.eps"						# Output eps format
replot
#
set terminal png enhanced size 960,720		# png format (960px,720px)
set output "${OFN}.png"						# Output png format
replot
#
EOF
