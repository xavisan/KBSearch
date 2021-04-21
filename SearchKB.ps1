
#----------------------------------------------------------------------
# Script by Javier Sanchez / CTXDOM.COM / admincitrix@ctxdom.com
# Permite saber que Hotfixes hay pendientes de instalar y cuales están
# Script to know that KB is pending to be installed on your Windows, valid 
# for Windows 2008R2 / 2012 / 2012R2 / 2016/2019/7/8 / 8.1 / 10 
#----------------------------------------------------------------------

$Computername = $env:COMPUTERNAME

  $updatesession =  [activator]::CreateInstance([type]::GetTypeFromProgID("Microsoft.Update.Session",$Computername))
  $updatesearcher = $updatesession.CreateUpdateSearcher() 
  $searchresult = $updatesearcher.Search("IsInstalled=0")  
  #0 = NoInstalados | 1 = Instalados
     
  $resultado = $searchresult.Updates.Count 
  Write-Host "Server: $Computername Numeber KBs pending to install: $resultado KB(s)"
  

  For ($i=0; $i -lt $resultado; $i++) {
    #Create  object holding update
    $Update  = $searchresult.Updates.Item($i)
    $KBResultado = $Update.KBArticleIDs
    Write-Host "KB$KBResultado,"
    
}

