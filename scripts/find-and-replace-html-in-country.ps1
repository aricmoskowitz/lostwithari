$countryName_lowercase = 'country_template'
$countryName_uppercase = 'var_country_name_uppercase'
#$countryName_uppercase = (Get-Culture).TextInfo.ToTitleCase($countryName_lowercase)

$htmlDestination = 'C:\Users\aricm\Documents\GitHub\lostwithari\' + $countryName_lowercase + '.html'

$textFind = '<div id="factsContainer" class="col-12 border-secondary_color">'
$textReplace = '	 <div id="factsContainer" class="col-12 border-secondary_color"><h5>Facts About '+$countryName_uppercase+'</h5><ul><li>'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination

$textFind = '</div>
                </div>
            </div>
            <div class="col-12 col-sm-6">
                <div class="row">
                    <div class="col-12 list-group p-0">
                        <div class="bg-primary_color poi-list-header border-secondary_color">
                            <h1 class="color-secondary_color">Points of Interest.</h1>'
$textReplace = '	</li>
</ul>
</div>
</div>
</div>
<div class="col-12 col-sm-6">
<div class="row">
<div class="col-12 list-group p-0">
<div class="bg-primary_color poi-list-header border-secondary_color">
    <h1 class="color-secondary_color">Points of Interest.</h1>'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination

#If something has two or more facts manually fix it

$textFind = '<div id="articleContainer" class="col-12 border-top text-center">'
$textReplace = '<div id="articleContainer" class="col-12 border-top"><h5>Articles About '+$countryName_uppercase+'</h5>'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination

$textFind = '<ul class="articleList p-0">'
$textReplace = '<ul class="articleList px-3">'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination


$textFind = '<ul class="p-0">'
$textReplace = '<li class="px-2">'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination


$textFind = '</a></ul>'
$textReplace = '</a></li>'
((Get-Content -path $htmlDestination -Raw) -replace $textFind, $textReplace) | Set-Content -Path $htmlDestination

