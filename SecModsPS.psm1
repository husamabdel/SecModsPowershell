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
        [Parameter(Mandatory=$true)]
        [string]$inputObject,
        [String]$Algorith='sha256',
        [string]$Path

    )


    $hash=[System.Security.Cryptography.HashAlgorithm]::Create($Algorith).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($inputObject))
    $final=[System.BitConverter]::ToString($hash).replace("-","").ToLower()
    
    Write-Output $final
    
    }