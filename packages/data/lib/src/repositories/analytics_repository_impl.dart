import 'package:mi_proyecto_domain/mi_proyecto_domain.dart';

/// En un entorno real, aquí se integraría el SDK de Firebase, Segment, etc.
class AnalyticsRepositoryImpl implements IAnalyticsRepository {
  @override
  Future<void> logEvent(String name, {Map<String, dynamic>? parameters}) async {
    // Aquí es donde conectarías con el servicio real.
    // Ejemplo: FirebaseAnalytics.instance.logEvent(name: name, parameters: parameters);

    // Por ahora, lo imprimimos en consola para verificar el flujo en el monorepo.
    print('📊 [ANALYTICS EVENT]: $name - Parámetros: $parameters');
  }

  @override
  Future<void> logScreenView(String screenName) async {
    // Ejemplo: FirebaseAnalytics.instance.setCurrentScreen(screenName: screenName);
    print('📱 [ANALYTICS SCREEN]: $screenName');
  }
}
