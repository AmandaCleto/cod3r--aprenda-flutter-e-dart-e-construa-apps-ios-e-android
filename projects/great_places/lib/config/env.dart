import 'package:flutter_dotenv/flutter_dotenv.dart';

getEnv(key) => dotenv.env[key];
