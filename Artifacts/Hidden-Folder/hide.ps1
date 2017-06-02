$Filepath = Get-Item -path "D:\temp" -Force   
 $Filepath.Attributes = "System,Hidden,ReadOnly"

 