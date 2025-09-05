@echo off
echo ========================================
echo Configurando entorno virtual de Python
echo ========================================

REM Crear entorno virtual si no existe
if not exist "venv" (
    echo Creando entorno virtual...
    python -m venv venv
    if errorlevel 1 (
        echo Error: No se pudo crear el entorno virtual.
        echo Asegurate de tener Python instalado y accesible desde PATH.
        pause
        exit /b 1
    )
    echo Entorno virtual creado exitosamente.
) else (
    echo Entorno virtual ya existe.
)

echo.
echo Activando entorno virtual...
call venv\Scripts\activate.bat
if errorlevel 1 (
    echo Error: No se pudo activar el entorno virtual.
    pause
    exit /b 1
)

echo.
echo Instalando dependencias desde requirements.txt...
pip install -r requirements.txt
if errorlevel 1 (
    echo Error: No se pudieron instalar las dependencias.
    pause
    exit /b 1
)

echo.
echo ========================================
echo Configuracion completada exitosamente!
echo ========================================
echo.
echo Para activar manualmente el entorno virtual en el futuro:
echo   call venv\Scripts\activate.bat
echo.
echo Para desactivar el entorno virtual:
echo   deactivate
echo.
echo Presiona cualquier tecla para continuar con el entorno activado...
pause > nul

REM Mantener el entorno activado
cmd /k