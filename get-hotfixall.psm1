Function Get-HotfixAll
{
 
        [CmdletBinding()]
        [Alias()]
        [OutputType([int])]
        Param
        (
            # Param1 help description
            [Parameter(Mandatory=$true,
                       ValueFromPipelineByPropertyName=$true,
                       Position=0)]
            $Computername
        )
    Invoke-Command -ScriptBlock {
    $Session = New-Object -ComObject Microsoft.Update.Session            
    $Searcher = $Session.CreateUpdateSearcher()         
    $HistoryCount = $Searcher.GetTotalHistoryCount()            
    # http://msdn.microsoft.com/en-us/library/windows/desktop/aa386532%28v=vs.85%29.aspx            
    $Searcher.QueryHistory(0,$HistoryCount) | ForEach-Object -Process {            
  
          $Title = $null            
        if($_.Title -match "\(KB\d{6,7}\)"){            
            # Split returns an array of strings            
            $Title = ($_.Title -split '.*\((KB\d{6,7})\)')[1]            
        }else{            
            $Title = $_.Title            
        }  
             
 
        # http://msdn.microsoft.com/en-us/library/windows/desktop/aa387095%28v=vs.85%29.aspx            
        $Result = $null            
        Switch ($_.ResultCode)            
        {            
            0 { $Result = 'NotStarted'}            
            1 { $Result = 'InProgress' }            
            2 { $Result = 'Succeeded' }            
            3 { $Result = 'SucceededWithErrors' }            
            4 { $Result = 'Failed' }            
            5 { $Result = 'Aborted' }            
            default { $Result = $_ }            
        }            
        New-Object -TypeName PSObject -Property @{            
            ComputerName = $ENV:Computername;
            InstalledOn = Get-Date -Date $_.Date;            
            KBArticle = $Title;            
            Name = $_.Title;            
            Status = $Result            
        }            
           
    } | Sort-Object -Descending:$true -Property InstalledOn |             
    Select-Object -Property *  
    } 
}
