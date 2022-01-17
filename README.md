# Purpose

- This is a module that will give you more accurate information on hotfix details on your windows machine;
- This has been tested on my windows laptop;
- This was created for sole purpose of enjoying powershell;

## Pre-Requisite

- For new users who are running powershell the first time around:
	- Ensure that you have the ability to run powershell scripts
	- If you do not know what i meant, on a machine with admin priveleges, type Powershell in admin mode: Set-ExecutionPolicy -ExecutionPolicy Unrestricted

## Steps to Install the module

- Download the PSM1 Module to a directory of your choice.
- Browse to the directory where the module is stored
- Type: Import-Module .\get-hotfixall.psm1

## Access Module

- Access module using the command: get-hotfixall
- IF prompted for computer and you leave it blank, it should return the patch detail of your terminal.
- Additional formatting can be done by piping (Example: ft, fl)

## Sample Output
	Status       : Succeeded
	ComputerName : SKAYS
	Name         : Realtek Semiconductor Corp. - MTD - 10.0.19041.21339
	KBArticle    : Realtek Semiconductor Corp. - MTD - 10.0.19041.21339
	InstalledOn  : 1/15/2022 9:00:00 PM

	Status       : Succeeded
	ComputerName : SKAYS
	Name         : Advanced Micro Devices, Inc. - Extension - 27.20.21020.4003
	KBArticle    : Advanced Micro Devices, Inc. - Extension - 27.20.21020.4003
	InstalledOn  : 1/15/2022 8:59:57 PM

	Status       : Succeeded
	ComputerName : SKAYS
	Name         : 2021-11 Update for Windows 11 for x64-based Systems (KB5008295)
	KBArticle    : KB5008295
	InstalledOn  : 1/15/2022 7:09:24 PM
