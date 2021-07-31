set term wxt

# Plotování funkcí dvou proměnných
set samples 100000
set isosamples 40 # počet křivek
set hidden3d trianglepattern 3
# hidden3d zakryje, co je oku neviditelné
# má možnost trianglepattern, která umožňuje znázornit křivky různým směrem
# možnosti jsou 0-7

set contour both
# set contour udělá vrstevnice
# má možnosti: base, surface, both podle toho, kam se mají vytisknout

set xlabel "$x$"
set ylabel "$y$"
set zlabel "$z$"
set format z "%.1f"
set xtics 0.4
set ytics 0.4
set ztics 0.5

set zrange [0:2]
set grid

f(x,y) = exp(-(x**2+4*y**2))


splot [-1:1][-1:1] f(x,y) w l lt -1



graf = "dvepromenne"
set term epslatex standalone
set output './Figures/'.graf.'.tex' 
rep 
set output

system('pdflatex '.'./Figures/'.graf.'.tex && mv '.graf.'.pdf ./Figures/ && rm '.graf.'*') 


set term wxt	# NASTAVÍ OPĚT DEFAULTNÍ TERMINÁL