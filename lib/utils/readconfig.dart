
class APIConfig {
  final String? key;
  
  APIConfig({required this.key});
}
class Config{
  static APIConfig? _config;
  
  static APIConfig getAPIConfig(){
    //final key=Platform.environment['themoviedbAPI'];
    //only when build app 
    const key="f1903b18ee0d0f9de6a9c0ce03122f05";
     return _config ?? APIConfig(key: key);
  }
}