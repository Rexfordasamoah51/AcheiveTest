import 'package:achievetest/env.dart';

// Development environment
const SERVER_HOST_DEV = 'api.coincap.io/v2/assets';

// Production Environment
const SERVER_HOST_PROD = '';

const SERVER_API_URL = ENV_IS_DEV ? SERVER_HOST_DEV : SERVER_HOST_PROD;

const ENV_IS_DEV = ENV == "DEV";

const PUSH_PREFIX = ENV_IS_DEV ? "test_" : "prod_";
