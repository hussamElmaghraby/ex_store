import 'package:flutter_dotenv/flutter_dotenv.dart';


enum EnvTypeEnum {
  DEV,
  PROD
}
class EnvVariable{
  EnvVariable._();
  String _envType = '';

  static final EnvVariable instance = EnvVariable._();

  Future<void> init({required EnvTypeEnum envType}) async {

    switch (envType) {
      case EnvTypeEnum.DEV:
        await dotenv.load(fileName:'.env.dev');
      case EnvTypeEnum.PROD:
        await dotenv.load(fileName:'.env.prod');
    }
    _envType = dotenv.get('ENV_TYPE');
  }

  String get envType => _envType;
}