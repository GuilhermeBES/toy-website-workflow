function UpdateParams($filePath, $values) {
    $a = Get-Content $filePath

    $v = $values | ConvertFrom-Json
    Write-Output($v)
    foreach ($val in $v.PSObject.Properties) {
        Write-Output("{$($val).Name)}")
        $a = $a.replace("{$($val.Name)}", $val.Value)
    }
    Write-Output($a)
    $a | set-content $filepath
}

function UpdateSharedSubscriptionId($filePath, $deploymentStage) {
    $subscription = Get-AzSubscription -SubscriptionName "Microsoft Partner Network"
    $values = "{'SharedSubscription': '$subscription'}"
    UpdateParams -filePath $filePath -values $values 
}