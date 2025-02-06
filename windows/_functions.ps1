function Set-Profile-Command
{
  param (
    [string]$Tag,       # The unique tag/check string
    [string]$Command    # The command to add if missing
  )

  $profileContent = Get-Content $PROFILE -Raw -ErrorAction SilentlyContinue
  $check = "# Already Configured TAG: $Tag"
  if (-not $profileContent -or $profileContent -notmatch [regex]::Escape($check))
  {
    Write-Host "Adding $Tag command to profile."
    Add-Content $PROFILE "`n$check"
    Add-Content $PROFILE "`n$Command"
  } else
  {
    Write-Host "Command already exists in profile."
  }
}


function Install-Node-LTS
{
  if (-not(Get-Command node -ErrorAction Ignore))
  {
    C:\ProgramData\nvm\nvm.exe install lts
    C:\ProgramData\nvm\nvm.exe use lts
  }

}


function Install-Scoop-Modules
{
  try
  {
    scoop update
    scoop bucket add main
    scoop install main/luarocks
  } Catch
  {
    Invoke-Expression (Invoke-RestMethod get.scoop.sh -RunAsAdmin)
  }

}
