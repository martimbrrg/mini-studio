@echo off
color 0A

:menu
cls
echo            ========================================
echo               Configuration de ton mini studio
echo            ========================================
echo.
echo         Quel mode veux-tu ?
echo         1. Portrait
echo         2. Paysage (centre de controle vers la gauche)
echo         3. Paysage (centre de controle vers la droite)
echo.
set /p mode=    Entre ton choix (1, 2 ou 3): 

:connection
cls
echo            ========================================
echo               Configuration de ton mini studio
echo            ========================================
echo.
echo         Quelle connexion veux-tu ?
echo         1. USB
echo         2. WiFi
echo         3. Retour au menu
echo.
set /p connection=    Entre ton choix (1, 2 ou 3): 

if "%connection%"=="3" goto menu

if "%connection%"=="1" (
    echo     Détection de l'appareil USB en cours...
    adb devices
    timeout /t 5 >nul
    if "%mode%"=="1" (
        scrcpy
    ) else if "%mode%"=="2" (
        scrcpy --display-orientation 270
    ) else (
        scrcpy --display-orientation 90
    )
) else if "%connection%"=="2" (
    set /p ip=    Entre l'adresse IP de ton appareil: 
    set /p port=    Entre le numéro de port: 
    adb connect %ip%:%port%
    if "%mode%"=="1" (
        scrcpy
    ) else if "%mode%"=="2" (
        scrcpy --display-orientation 270
    ) else (
        scrcpy --display-orientation 90
    )
) else (
    echo Choix invalide. Retour au menu.
    goto menu
)

echo.
echo         Réalisé par Martim B.
pause
goto menu
