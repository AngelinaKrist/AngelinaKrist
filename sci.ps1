# WebRequest ($url)
# функция запроса по заданному адресу, возвращающая время запроса и код ответа в милисекундах
#
# ErrorCodes:
# 101 = Длинна переданного на вход функции адреса сайта = 0
 function WebRequest($url) {
	$returnqwe = @{"StatusCodeTest"= 0;"ElapsedTest"= 0;"RawContentLengthTest"= 0;"ErrorStatusTest" = $true; "ErrorCodeTest" = 0} 
	if ($url.Length -eq 0)
	{
		Write-Host "Содержимое переменной Surl переданное на вход функции = 0" 
		$returnqwe.ErrorStatusTest = $false
		$returnqwe. ErrorCodeTest = "101"
		return $returnqwe
	}

	if (($url -like "*http*") -eq $false) {
		Write-Host "Содержимое переменной не является ссылкой на сайт"
		$returnqwe.ErrorStatusTest = $false
		$returngwe.ErrorCodeTest ="202"
		return $returnqwe
	}
	$timer = [Diagnostics.Stopwatch]::StartNew() #инишиализировать таймеp
	$r = Invoke-WebRequest $url #Сделать запрос к адресу сайта переданному из вне в переменную $ur1


	$returnqwe.StatusCodeTest = $r.StatusCode #отобразить код ответа сайта

	$timer.stop() #Остановить таймер

	$returnqwe.ElapsedTest = $timer.Elapsed.Milliseconds #0тобразить сколько милисекунд ушло на зaпрос Sreturnqwe. RawContentLengthTest = $r.RawContentLength
	
    $returnqwe.RawContentLengthTest = $r.RawContentLength

	#Sreturn. StatusCodeTest
	#Sreturn.ElapsedTest
	return $returnqwe;
}

function CalcTime($url) {
	$request_time_spent_sum = 0
	$request_wight_sum = 0
	for ($counter = 0; $counter -lt 10; $counter++)
	{	
		Write-Host $counter
		$calTimeTest = WebRequest($url)
		#write-Host "Kод текушего заnpoca: ScalTimeTest.StatusCodeTest"
		Write-Host "Bpемя потраченное на текуший запрoc (MC): " + $calTimeTest.ElapsedTest 
        #Write-Host "Размер ответа в байтах: + ScalTimeTest.RawContentLengthTest
		$request_time_spent_sum += $calTimeTest.ElapsedTest
		$request_wight_sum += $calTimeTest.RawContentLengthTest
	}
	Write-Host "Cymмарно на 10 запросов потрачено времени (мс): $request_time_spent_sum" 
	$request_time_avg = $request_time_spent_sum / 10
	Write-Host "Cpедняя подолжительность одного зaпpoca (MC): $request_time_avg"
}

function Calcweight ($url) {
	$request_time_spent_sum = 0
	$request_wight_sum = 0
	for ($counter = 0; $counter -lt 10; $counter++)
	{
		Write-Host $counter
		$calTimeTest = WebRequest($url)
		#Write-Host "код текушего зanpoca: $calTimeTest.StatusCodeTest"
		#write-Host "Bpемя потраченное на текуший запpoc (MC): " + ScalTimeTest.ElapsedTest Write-Host "Размер ответа в байтах: ScalTimeTest. RawContentLengthTest
		$request_time_spent_sum += $calTimeTest.ElapsedTest
		$request_wight_sum += $calTimeTest.RawContentLengthTest
	}

	Write-Host "Суммарно на 10 запросов получено байт: $request_wight_sum" 
	$request_wight_avg = $request_wight_sum / 10
	Write-Host "B среднем 1 запрос весит байт: $request_wight_avg"
}

$test_url="http://mail.ru"
$testreturn = WebRequest($test_url) #Bызвать функцию WebRequest 
Write-Host "Проверка результатов опроса адреса $test_url" 
$testreturn.StatusCodeTest
$testreturn.ElapsedTest


$test_url = "https://mail.ru"
#Stest_url = ""
$testreturn = WebRequest($test_url) #BызBaть функцию WebRequest 
if ($testreturn.ErrorStatusTest) {
	Write-Host "ошибки нету"
	Write-Host "Проверка результатов опроса адреса $test_url" 
	$testreturn.StatusCodeTest
	$testreturn.ElapsedTest
}else{
	Write-Host "Ошибка выполнения функции."
}
CalcTime("https://mail.ru")
CalcWeight("https://mail.ru")
