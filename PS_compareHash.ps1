$LeftFolder = ""
$RightFolder = ""
$LeftSideHash = Get-ChildItem $LeftFolder -Recurse | Get-FileHash | select @{Label="Path";Expression={$_.Path.Replace($LeftFolder,"")}},Hash
$RightSideHash = Get-ChildItem $RightFolder -Recurse | Get-FileHash | select @{Label="Path";Expression={$_.Path.Replace($RightFolder,"")}},Hash
Compare-Object $LeftSideHash $RightSideHash -Property Path,Hash