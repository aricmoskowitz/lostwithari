$countryName = 'croatia'
$var2 = 'HR'
$var3 = 'Croatia'
$var4 = 'Europe'

$htmlDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\' + $countryName + '.html'
$jsDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\js\' + $countryName + '.js'

Copy-Item -Destination $htmlDestination -Path C:\Users\aricm\Documents\GitHub\lostwithari\country_template.html 

Copy-Item -Destination $jsDestination -Path C:\Users\aricm\Documents\GitHub\lostwithari\js\country_template.js 

