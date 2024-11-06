class Environments {
  static const String production = 'prod';
  static const String qa = 'QA';
  static const String dev = 'dev';
  static const String local = 'local';
}

class ConfigEnvironments {
  static const String _currentEnvironment = Environments.local;
  static final List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.local,
      'url': 'http://13.202.27.112/api/v1/'
    },
    {
      'env': Environments.dev,
      'url': ''
    },
    {
      'env': Environments.qa,
      'url': ''
    },
    {
      'env': Environments.production,
      'url': ''
    },
  ];

  static Map<String, String> getEnvironments() {
    return _availableEnvironments.firstWhere(
      (d) => d['env'] == _currentEnvironment,
    );
  }


}