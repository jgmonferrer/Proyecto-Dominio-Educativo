
function Show-Menu
{
     param (
           [string]$Titulo = 'Menú principal'
     )
     Clear-Host
     Write-Host "================ $Titulo ================"
    
     Write-Host "1: Opcion '1' Buscar todas las UOs."
     Write-Host "2: Opci�n  '2' Buscar todos los Equipos."
     Write-Host "3: Opcion '3' Buscar todos los Grupos."
     Write-Host "4: Opción '4' Buscar todos los Usuarios."
     Write-Host "Q: Opción 'Q' Salir."
}
function busqueda_UOs
{
#Listar los usuarios del dominio smr.local
Write-Host UOs -Fore green 
Get-ADOrganizationalUnit -filter * -SearchBase "dc=IESJaume-I,dc=mylocal" 
#| Select Name
}
function busqueda_grupos
{
#Listar los usuarios del dominio smr.local
Write-Host Grupos -Fore green 
Get-ADGroup -filter * -SearchBase "dc=IESJaume-I,dc=mylocal" 
#| Select Name
}
function busqueda_usuarios
{
#Listar los usuarios del dominio smr.local
Write-Host usuarios -Fore green 
Get-ADUser -filter * -SearchBase "dc=IESJaume-I,dc=mylocal" 
#| Select Name
}

function busqueda_equipos
{
#Listar los usuarios del dominio smr.local
Write-Host Equipos -Fore green 
Get-ADComputer -filter * -SearchBase "dc=IESJaume-I,dc=mylocal" 
#| Select Name
}

#Primero comprobaremos si se tiene cargado el módulo Active Directory
if (!(Get-Module -Name ActiveDirectory)) #Accederá al then solo si no existe una entrada llamada ActiveDirectory
{
  Import-Module ActiveDirectory #Se carga el módulo
}


#
#MENU PRINCIPAL
#
do
{
     Show-Menu
     $input = Read-Host "Por favor, pulse una opcion"
     switch ($input)
     {
           '1' {
                Clear-Host
                busqueda_UOs
           } '2' {
                Clear-Host
                busqueda_equipos
           } '3' {
                Clear-Host
                busqueda_grupos
           } '4' {
                Clear-Host
                busqueda_usuarios
           } 'q' {
                'Salimos de la App'
                return
           }
     }
     pause
}
until ($input -eq 'q')

