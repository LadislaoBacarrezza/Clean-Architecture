# Flutter Clean Architecture Monorepo 🚀

Este proyecto es un ejemplo de referencia para construir aplicaciones Flutter escalables utilizando **Clean Architecture (Hexagonal)**, un entorno de **Monorepo gestionado con Melos 7.5.1** y la nueva potencia de los **Dart Workspaces**.

## 🏗️ Arquitectura
El proyecto sigue rigurosamente la separación de capas para asegurar una lógica de negocio independiente de la infraestructura y la UI:

- **Domain Layer**: Contiene las Entidades, Contratos de Repositorio (Interfaces) y Casos de Uso. Es puro Dart, sin dependencias de Flutter.
- **Data Layer**: Implementaciones de Repositorios, Modelos de Datos (DTOs), Mappers y DataSources (gRPC/REST).
- **Presentation Layer (Features)**: Módulos independientes por funcionalidad (PDP, Checkout) que contienen su propia lógica de Bloc y UI.
- **App Shell**: La aplicación principal que orquesta las rutas y la inyección de dependencias.

## 🛠️ Stack Tecnológico
- **Estado**: [Flutter Bloc](https://pub.dev/packages/flutter_bloc)
- **Navegación**: [GoRouter](https://pub.dev/packages/go_router) (Navegación desacoplada entre features)
- **Inyección de Dependencias**: [GetIt](https://pub.dev/packages/get_it)
- **Monorepo**: [Melos 7.5.1](https://melos.invertase.dev/)
- **Programación Funcional**: [Dartz](https://pub.dev/packages/dartz) (Manejo de errores con Either)
- **Workspaces**: Configuración nativa de Dart SDK 3.11+

## 📁 Estructura del Proyecto
```text
apps/
└── clean_architecture/ # Aplicación principal (Shell/Runner)
├── lib/
│ ├── app_router.dart # Configuración central de GoRouter
│ ├── injection_container.dart # Service Locator (GetIt)
│ └── main.dart # Punto de entrada
packages/
├── domain/ # Capa de Dominio (Business Logic)
│ ├── lib/src/
│ │ ├── entities/ # Entidades de negocio
│ │ ├── repositories/ # Interfaces de repositorios
│ │ ├── usercases/ # Casos de uso
│ │ └── error/ # Failures de dominio
├── data/ # Capa de Datos (Infrastructure)
│ ├── lib/src/
│ │ ├── datasources/ # Orígenes de datos y Mocks gRPC
│ │ ├── models/ # DTOs y Mapeadores
│ │ └── repositories/ # Implementaciones
└── features/
├── pdp/ # Feature: Product Detail Page
│ ├── lib/src/presentation/
│ │ ├── bloc/ # Gestión de estado PDP
│ │ └── pages/ # UI de la página de producto
└── checkout/ # Feature: Proceso de pago
├── lib/src/presentation/
│ ├── bloc/ # Gestión de estado Checkout
│ └── pages/ # UI del proceso de compra
```

## 🚀 Instalación y Ejecución

### Pre-requisitos
- Flutter SDK (Recomendado 3.24+ / Dart 3.11+)
- Melos instalado globalmente: `dart pub global activate melos`

### Configuración inicial
Clona el proyecto y ejecuta el bootstrap para vincular todos los paquetes locales y descargar dependencias:

## 🧪 Características Destacadas
- **Desacoplamiento Total**: Las features no se conocen entre sí; la comunicación se realiza mediante rutas y el módulo App.
- **Analíticas Desacopladas**: Interfaz de analíticas implementada siguiendo Clean Architecture para cambiar de proveedor (Firebase/Segment) sin afectar la UI.
- **Mocking de Datos**: Cliente gRPC simulado para pruebas inmediatas sin necesidad de un backend activo.
- **Manejo de Errores Profesional**: Uso de `Failures` de dominio para propagar errores de forma tipada hasta la UI.

---
Hecho con ❤️ para la comunidad de Flutter.