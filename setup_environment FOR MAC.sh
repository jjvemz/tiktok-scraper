#!/bin/bash

echo "========================================"
echo "Configurando entorno virtual de Python"
echo "========================================"

# Crear entorno virtual si no existe
if [ ! -d "venv" ]; then
    echo "Creando entorno virtual..."
    python3 -m venv venv
    if [ $? -ne 0 ]; then
        echo "Error: No se pudo crear el entorno virtual."
        echo "Asegurate de tener Python instalado y accesible desde PATH."
        read -p "Presiona Enter para continuar..."
        exit 1
    fi
    echo "Entorno virtual creado exitosamente."
else
    echo "Entorno virtual ya existe."
fi

echo
echo "Activando entorno virtual..."
source venv/bin/activate
if [ $? -ne 0 ]; then
    echo "Error: No se pudo activar el entorno virtual."
    read -p "Presiona Enter para continuar..."
    exit 1
fi

echo
echo "Instalando dependencias desde requirements.txt..."
pip install -r requirements.txt
if [ $? -ne 0 ]; then
    echo "Error: No se pudieron instalar las dependencias."
    read -p "Presiona Enter para continuar..."
    exit 1
fi

echo
echo "========================================"
echo "Configuracion completada exitosamente!"
echo "========================================"
echo
echo "Para activar manualmente el entorno virtual en el futuro:"
echo "   source venv/bin/activate"
echo
echo "Para desactivar el entorno virtual:"
echo "   deactivate"
echo
echo "Presiona cualquier tecla para continuar con el entorno activado..."
read -n 1

# Mantener el entorno activado
exec "$SHELL"