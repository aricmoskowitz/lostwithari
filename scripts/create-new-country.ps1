$countryName_lowercase = 'hungary'
$countryName_uppercase = 'Hungary'
$googleMaps_country_abbrev = 'HU'
$continent_name = 'Europe'

$htmlDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\' + $countryName_lowercase + '.html'
$jsDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\js\' + $countryName_lowercase + '.js'

Copy-Item -Destination $htmlDestination -Path C:\Users\aricm\Documents\GitHub\lostwithari\country_template.html 

((Get-Content -path $htmlDestination -Raw) -replace 'var_country_name_uppercase',$countryName_uppercase) | Set-Content -Path $htmlDestination
((Get-Content -path $htmlDestination -Raw) -replace 'var_country_name_lowercase',$countryName_lowercase) | Set-Content -Path $htmlDestination
((Get-Content -path $htmlDestination -Raw) -replace 'var_googleMaps_country_abbrev',$googleMaps_country_abbrev) | Set-Content -Path $htmlDestination
((Get-Content -path $htmlDestination -Raw) -replace 'var_continent_name',$continent_name) | Set-Content -Path $htmlDestination


Copy-Item -Destination $jsDestination -Path C:\Users\aricm\Documents\GitHub\lostwithari\js\country_template.js 

((Get-Content -path $jsDestination -Raw) -replace 'var_country_name_lowercase',$countryName_lowercase) | Set-Content -Path $jsDestination
((Get-Content -path $jsDestination -Raw) -replace 'var_country_name_uppercase',$countryName_uppercase) | Set-Content -Path $jsDestination
