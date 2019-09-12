$countryName_lowercase = ''
$countryName_uppercase = ''

$htmlDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\' + $countryName_lowercase + '.html'

#Need to fill in textFind
$textFind = Get-Content -path $htmlDestination -Raw 
$textReplace = ""
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination

