set term wxt
set key top left box
set key spacing 1.5

set xlabel "množství ($Q$)"
set ylabel "úhrnná cena ($P \\cdot Q$)"
set xrange [0:40]
set yrange [0:120000]

TC(x) = 2*x**3 - 3*x**2 + 400*x + 5000
TR(x) = 4000*x - 33*x**2
Pi(x) = TR(x) - TC(x) 


set label 1 "Maximální profit" at 10,80000 center font ",5"
set label 2 "$[20; 39\\,000]$" at 21.5 , 52000 center
set arrow 1 from 10, 75000 to 20, 40000
set arrow 2 from 20,0 to 20, 39000 nohead linestyle 0 dashtype 3
set arrow 3 from 0, 39000 to 20, 39000 nohead linestyle 0 dashtype 3

plot TC(x) linewidth 4 t "Celkové náklady ($TC$)",\
    TR(x) linewidth 4 t "Celkový výnos ($TR$)",\
    Pi(x) linewidth 4 t "Celkový zisk ($\\Pi$)"

graf = "profitova-funkce"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 

set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL
