# Catbreeds: Ejercicio de acercamiento al rol

## 🌿 Branches del proyecto

| Rama       | Descripción                                                                |
| ---------- | -------------------------------------------------------------------------- |
| `master`   | Estructura base y arquitectura inicial del proyecto.                       |
| `dev_alex` | Rama de desarrollo activa (features, mejoras y pruebas personales).        |
| `main`     | **Versión final entregable. Ejecutar esta rama para evaluar el proyecto.** |

## Requisitos

- Flutter 3.29.3 (recomendado con FVM)

## ⚙️ Cómo Ejecutar el Proyecto Rápidamente

Sigue estos pasos para poner en marcha el proyecto en tu entorno local:

### 📦 Instalación Rápida

1.  **Clonar el repositorio:**
    ```bash
    git clone https://github.com/abialex/flutter_mobile_challenge_pragma.git
    cd flutter_mobile_challenge_pragma
    ```
2.  **Configurar FVM e instalar dependencias:**
    ```bash
    dart pub global activate fvm
    fvm install
    fvm use 3.29.3
    fvm flutter pub get
    ```
3.  **Generar archivos Freezed y JSON Serializable:**
    Este paso es crucial para los modelos de datos y los Blocs.
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```
4.  **Configurar variables de entorno:**
    Crea un archivo `.env` en la carpeta `assets/env/` con tu `API_KEY` para TheCatAPI.
    ```
    API_KEY=live_99Qe4Ppj34NdplyLW67xCV7Ds0oSLKGgcWWYnSzMJY9C0QOu0HUR4azYxWkyW2nr
    ```
5.  **Ejecutar la aplicación con un Flavor específico:**
    El proyecto está configurado con tres _flavors_: `development`, `staging` y `production`, que utilizan diferentes puntos de entrada (`main_development.dart`, `main_staging.dart`, `main_production.dart`).

    Para ejecutar en `development`:

    ```bash
    flutter run --flavor development --target lib/main_development.dart
    ```

    Para ejecutar en `staging`:

    ```bash
    flutter run --flavor stg --target lib/main_staging.dart
    ```

    Para ejecutar en `production`:

    ```bash
    flutter run --flavor production --target lib/main_production.dart
    ```

    _Nota: Asegúrate de que tu IDE esté configurado para reconocer y lanzar los flavors correctamente (e.g., en VS Code, puedes usar las configuraciones de lanzamiento para cada flavor)._

## 🏗️ Decisiones Técnicas Clave

### 1. Arquitectura y Manejo de Estado

- **BLoC:** Manejo de estado reactivo y desacoplado de la UI para mayor modularidad.
- **Freezed:** Generación de clases inmutables y union types para estados/eventos, reduciendo código repetitivo

### 2. Navegación

- **GoRouter:** Navegación declarativa, flexible y escalable, con soporte para rutas anidadas y estados de URL.
- **`GlobalKey<NavigatorState>` (`rootNavigatorKey`):** Permite mostrar diálogos globales desde cualquier parte del árbol, sin depender del BuildContext local.

### 3. Gestión de Errores HTTP Centralizada

- **`HttpErrorBloc` (Global):** Bloc global para gestionar errores HTTP de forma centralizada y coherente.
- **`AppHttpErrorListener` (Widget Reutilizable):** Widget reutilizable que escucha errores y muestra diálogos según el tipo de estado.
- **`AppDialogWidget` (Diálogo Reutilizable):** Diálogo personalizado implementado en el _AppHttpErrorListener_ que se muestra usando rootNavigatorKey para asegurar visibilidad global.

### 4. Soporte para Flavors

- **Flavors (`development`, `staging`, `production`):** La app soporta múltiples entornos de construcción, permitiendo configurar variables como URLs de API e íconos según el entorno.
- **Puntos de entrada:** Cada flavor cuenta con su propio archivo `main_*.dart` para facilitar la configuración específica por entorno.
- **`AppFlavorConfig`:** Clase centralizada para definir las URLs y ajustes personalizados de cada flavor.

### 5. Optimización de carga de imágenes

- **`Image.network` con `frameBuilder`:** Controla el proceso de carga mostrando indicadores personalizados mientras se descarga la imagen.
- **`precacheImage`:** Precarga el GIF de carga (`AppConstGif.loading_cat`) al inicio para evitar el _cuadro en blanco_ y mejorar la fluidez visual.

## 📁 Estructura del Proyecto

El proyecto sigue una estructura modular y limpia, separando las responsabilidades en distintas capas:

```
lib/                        # Carpeta raíz del proyecto Flutter
├── app/                    # Contiene toda la arquitectura de la app
│   ├── config/             # Configuración global, flavors y listeners
│   ├── core/               # Constantes, router, DI, widgets y lógica compartida
│   ├── data/               # Implementación concreta de servicios y repositorios
│   ├── domain/             # Interfaces y modelos puros del dominio
│   ├── modules/            # Módulos funcionales de la app (cat, home, splash, etc.)
│
│   ├── app.dart            # Widget raíz de la aplicación
│   └── main.dart           # Punto de entrada por defecto (producción)
│
├── main_development.dart   # Punto de entrada para entorno de desarrollo
├── main_production.dart    # Punto de entrada para entorno de producción
├── main_staging.dart       # Punto de entrada para entorno de staging
│
└── bootstrap.dart          # Inicialización global de la app (inyección, configuración)
```

## 👤 Autor

Alexis Jampier Yalle Alarcón

---
