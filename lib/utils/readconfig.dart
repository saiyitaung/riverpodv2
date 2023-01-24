

import 'dart:io';

class APIConfig {
  final String? key;
  
  APIConfig({required this.key});
}
class Config{
  static APIConfig? _config;
  
  static APIConfig getAPIConfig(){
    final key=Platform.environment['themoviedbAPI'];    
    
     return _config ?? APIConfig(key: key);
  }
}