<#
 .Synopsis
  Displays the Digest (Hash) of a specified String.

 .Description
  Displays the Digest (Hash) of a specified String, with a required parameter of the Algorith to use.

 .Parameter Algorith
  The Algorith that the cmdlet will use to compute the Digest.

 .Parameter inputObject
  The input, a String or an object that returns the String.

 .Example
   # Show the sha256 digest of hello world.
   Get-InputDigest -Algorith 'sha256' -inputObject 'Hello World!'

 .Example
   # Show the md5 digest of hello world.
   Get-InputDigest -Algorith 'md5' -inputObject 'Hello World!'

 .Example
   # Show the sha512 digest of hello world.
   Get-InputDigest -Algorith 'sha512' -inputObject 'Hello World!'
#>

function Get-InputDigest(){

    param(

        # Parameter help description
        [string]$inputObject,
        [String]$Algorith='sha256',
        [string]$PathContent

    )


    if($PathContent -ne $null){

      if(Test-Path $PathContent){

      $content = Get-Content -Path $PathContent

      $hash=[System.Security.Cryptography.HashAlgorithm]::Create($Algorith).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($content))
      $final=[System.BitConverter]::ToString($hash).replace("-","").ToLower()

      } else{

        Write-Error 'The Path supplied is incorrect!'

      }

    }


    $hash=[System.Security.Cryptography.HashAlgorithm]::Create($Algorith).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($inputObject))
    $final=[System.BitConverter]::ToString($hash).replace("-","").ToLower()
    
    Write-Output $final
    
    }