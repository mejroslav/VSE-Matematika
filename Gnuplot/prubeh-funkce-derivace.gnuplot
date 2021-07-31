set term wxt enhanced
set key top right box
set key spacing 1.5
unset tics
set ytics (0)
unset label

set xrange [-5:12]
set yrange [-2:10]
set xlabel "$x$"
set ylabel "$y$"

c = 0.08
p = 1
q = 9
K = 8

f(x) = c*( 0.33333 * x**3 - 0.5 * (p+q) * x**2 + p*q *x) + K

df(x) = c*(x-p)*(x-q)

unset arrow 

set arrow from -5,0 to 12,0 lw 2 dashtype 3 nohead 
set arrow from 1,0 to 1,f(1) lw 2 heads
set arrow from 9,0 to 9,f(9) lw 2 heads 

set label "Lokální maximum" at 1,f(1)+1 center font ",5"
set label "Lokální minimum" at 9,f(9)+3 center font ",5"
set arrow from 9,4 to 9,f(9) lw 2 dashtype 2 nohead 
set arrow from 1,f(1)+0.5 to 1,f(1) lw 2 dashtype 2 nohead 

set label "$f'(x)=0$" at 5,2 center font ",5" boxed
set arrow from 3.5,1.5 to 1+0.2,0+0.2 lw 2
set arrow from 6.5,1.5 to 9-0.2,0+0.2 lw 2




plot f(x) lw 3 title "$f(x)$" , df(x) lw 3 title "$f'(x)$"



graf = "funkce-derivace"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL
