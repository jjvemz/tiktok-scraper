# Extractor de Comentarios de TikTok

Este extractor/scraper de comentarios logra obtener todos los comentarios de prácticamente cualquier publicación de TikTok. Puede ser útil para sorteos, votaciones u otras interacciones comunitarias más grandes.

## Instalación

Contrario a la convención, este repositorio sí contiene el entorno virtual en el que se ejecuta (**Windows**, para Linux ver abajo), por lo que es instantáneamente utilizable también para personas que no quieren instalar primero Python y los requisitos.

El entorno de Python está fuertemente reducido (~7MB).

La instalación es tan simple como:

```bash
git clone https://github.com/cubernetes/TikTokCommentScraper
```

Alternativamente, descarga el zip directamente si no tienes git instalado:

```bash
curl -L -o "TikTokCmtScraper.zip" https://github.com/cubernetes/TikTokCommentScraper/archive/refs/heads/main.zip
```

Si estás ejecutando Windows 7 y por lo tanto no tienes curl instalado, simplemente descarga el zip directamente desde este repositorio y extráelo.

## Requisitos

Los requisitos de Python serían (si no quieres usar el venv o si no estás usando Windows):

- `pyperclip`
- `openpyxl`
- `requests`

## Uso Rápido

1. Abre tu navegador basado en **Chromium** favorito (ej. Chrome, Brave, Chromium)
2. Ve a la publicación de TikTok de la que quieres extraer los comentarios (asegúrate de poder desplazarte por los comentarios manualmente)
3. Presiona F12 (ir a consola de desarrollador) o CTRL+SHIFT+J (debería abrir la consola directamente)
4. Abre el explorador de archivos de Windows en la raíz de esta carpeta del proyecto (donde están los archivos .cmd)
5. Haz doble clic en 'Copy JavaScript for Developer Console.cmd'
   - **Si no estás usando Windows**, simplemente ejecuta el archivo `src/CopyJavascript.py` manualmente con Python (ver requisitos)
6. Regresa a la consola de desarrollador; pega el JavaScript; ejecútalo
7. Espera hasta que diga 'CSV copied to clipboard!'
8. Regresa al explorador de archivos; haz doble clic en 'Extract Comments from Clipboard.cmd'
   - **Si no estás usando Windows**, simplemente ejecuta el archivo `src/ScrapeTikTokComments.py` manualmente con Python (ver requisitos)
9. ¡Listo! El archivo se guardará en la carpeta `exported data/` con el nombre `video_tiktok_<fecha>.xlsx` conteniendo todos los comentarios e información adicional

## Funcionalidades

- **Extracción completa**: Obtiene comentarios de primer nivel y respuestas
- **Información del usuario**: Incluye nickname, @ del usuario, número de seguidores, foto de perfil
- **Metadatos del post**: URL, likes, shares, descripción, fecha de publicación
- **Formato Excel**: Exporta a archivo .xlsx con formato organizado
- **Carpeta dedicada**: Los archivos se guardan automáticamente en `exported data/`

## Estructura del Archivo Exportado

El archivo Excel generado contiene:
- **Fila 1**: Headers de metadatos del post (columnas 1-14) + Headers de comentarios (columnas 17-28)
- **Fila 2**: Valores de metadatos del post
- **Fila 3+**: Datos de cada comentario
- **Columnas 15-16**: Vacías (separador visual)

### Información incluida:
**Metadatos del Post:**
- Fecha actual, URL del post, nickname del publicador, @ del publicador
- Fecha de publicación, likes, shares, descripción
- Número de comentarios de 1er nivel, 2do nivel, total

**Información de Comentarios:**
- Número de comentario, nickname, @ del usuario, URL del usuario
- Texto del comentario, fecha, likes, foto de perfil
- Número de seguidores, si es respuesta, a quién responde, número de respuestas

## Detalles Técnicos

Este extractor de comentarios usa la consola de desarrollador de Chrome (navegador basado en Chromium recomendado/posiblemente necesario), JavaScript y Python.

### Proceso paso a paso:
1. El JavaScript se copia al portapapeles cuando se ejecuta el archivo `.cmd`
2. Con la publicación de TikTok abierta, abre la consola de desarrollador
3. Pega y ejecuta el JavaScript
4. El script carga todos los comentarios desplazándose automáticamente
5. Extrae todos los datos y los convierte a formato CSV
6. El script de Python convierte el CSV a formato Excel y lo guarda en `exported data/`

**⚠️ Seguridad**: Nunca pegues código desconocido en la consola de desarrollador sin revisarlo primero. Este es un riesgo de seguridad importante.

## Limitaciones

- Probado en publicaciones con hasta 3000 comentarios
- TikTok a veces no muestra todos los comentarios disponibles
- Con muchos comentarios, puede volverse lento durante la fase de carga
- Un pequeño porcentaje de comentarios puede no cargarse (generalmente insignificante)

## Estructura del Proyecto

```
TikTokCommentScraper/
├── src/
│   ├── CopyJavascript.py
│   ├── ScrapeTikTokComments.js
│   └── ScrapeTikTokComments.py
├── exported data/          # Carpeta donde se guardan los archivos Excel
├── python38/              # Entorno Python portable (Windows)
├── venv/                  # Entorno virtual
├── requirements.txt
├── Copy JavaScript for Developer Console.cmd
├── Extract Comments from Clipboard.cmd
└── README.md
```

## Licencia

Este proyecto está disponible bajo la licencia incluida en el archivo LICENSE.