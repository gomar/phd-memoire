set macro

# ===========
# = TO FILL =
# ===========
case = 'multifreq_tsm'
result_path = 'multifreq/'

do for [nharm=1:25] {

set output 'convection_'.case.'_N'.nharm.'.tex'
	reset

	# global parameters
	set style line 2 lc rgb "#268bd2" linetype 2 linewidth 6
	set style line 1 linetype -1 linewidth 3 pt 6 pi 100
	set style line 3 lc rgb "#d33682" linetype -1 linewidth 1
	set style line 4 lc rgb "#6c71c4" linetype -1 linewidth 1
	set style line 5 lc rgb "#dc322f" linetype -1 linewidth 1
	set style line 6 lc rgb "#2aa198" linetype -1 linewidth 1
	set style line 7 lc rgb "#002b36" linetype -1 linewidth 1
	set terminal epslatex standalone color colortext header \
   		"\\usepackage{wasysym}\n\\usepackage{sfmath}\n\\renewcommand{\\familydefault}{\\sfdefault}\n"
	set key reverse Left right box spacing 1.5
	set xrange [0:1.0]
	set xtics ("\\Large 0" 0, "\\Large $L_x / 4$" 0.25, "\\Large $L_x / 2$" 0.5, "\\Large $3 L_x / 4$" 0.75, "\\Large $L_x$" 1.0)
	set ytics ("\\Large -1" -1, "\\Large 0" 0, "\\Large 1" 1, "\\Large 2" 2,"\\Large 3" 3)
	# SIN
	set yrange [-1:3]

	# figure n 1
	NX=1; NY=3
	DX=0.6; DY=0.; SX=0.85; SY=0.4
	set bmargin DX
	set tmargin DX
	set lmargin DY
	set rmargin DY
	## set the margin of each side of a plot as small as possible
	## to connect each plot without space
	set size SX*NX+DX*1.5, SY*NY+DY*1.8
	set multiplot
	##—— First Figure–bottom
	set size SX,SY
	# t = 0.
	set label '\Large $t = 2T / 3$' center at graph 1.03, graph 0.5 rotate by 90
	unset key
	set xlabel "\\Large Axial direction [m]"
	set origin DX, DY
	plot result_path.'TSM_N'.nharm.'_analytic_0002.dat' w l ls 1,\
	result_path.'TSM_N'.nharm.'_0000_0002.dat' w l ls 2
	unset label
	unset key
	set xtics ("" 0, "" 0.25, "" 0.5, "" 0.75, "" 1.0)
	set ytics ("" -1, "" 0, "" 1, "" 2,"" 3)
	# set xtics ("" 0,  "" 0.5, "" 1)
	# t = 1 / 3  Lt
	set label '\Large $t = T / 3$' center at graph 1.03, graph 0.5 rotate by 90
	set xlabel ""
	set format x ""
	set origin DX,DY+SY*1
	plot result_path.'TSM_N'.nharm.'_analytic_0001.dat' w l ls 1,\
	result_path.'TSM_N'.nharm.'_0000_0001.dat' w l ls 2
	unset label
	# t = 2 / 3  Lt
	set label '\Large $t = 0$' center at graph 1.03, graph 0.5 rotate by 90
	set origin DX,DY+SY*2
	set key reverse Left box spacing 1.5 center at graph 0.5, graph 1.13 maxrows 1
	plot result_path.'TSM_N'.nharm.'_analytic_0000.dat' w l ls 1 title '\Large Analytic', \
	result_path.'TSM_N'.nharm.'_0000_0000.dat' w l ls 2 title '\Large HB $N='.nharm.'$  '
	unset multiplot
	reset
}