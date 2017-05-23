$LeftFolder = "sf"
$RightFolder = "df"
$LeftSideHash = Get-ChildItem $LeftFolder -Recurse | Get-FileHash | Select-Object @{Label="Path";Expression={$_.Path.Replace($LeftFolder,"")}},Hash
$RightSideHash = Get-ChildItem $RightFolder -Recurse | Get-FileHash | Select-Object @{Label="Path";Expression={$_.Path.Replace($RightFolder,"")}},Hash
Compare-Object $LeftSideHash $RightSideHash -Property Path,Hash