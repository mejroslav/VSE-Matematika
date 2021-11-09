set term wxt
set key spacing 1.5
set key tmargin box width 2.5

set zeroaxis

set xrange [0:5]
set yrange [0:5]

set bmargin 4
set lmargin 9

f(x) = -(x-1)*(x-1)*(x-4) 

set label at 2,-0.7 "$x_0$" center
set label at -0.4,2 "$f(x_0)$" right

set arrow from 2,0 to 2,f(2) nohead lw 2 dt 3
set arrow from 0,f(2) to 2,f(2) nohead lw 2 dt 3

set label at 3,2 "pro $h \\rightarrow 0$ \\dots" center
set label at 1.3,3.7 "\\dots přejdou sečny v tečnu" center
set arrow from 1.7,3.5 to 2.25,f(2.3)+0.1 lw 2

plot f(x) title "$f(x)$" lw 3 lt 6 ,\
3*(x-2)+2 title "tečna" lw 3 lt 7

graf = "tecna-graf"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL

reset