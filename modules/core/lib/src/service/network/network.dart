import 'package:core/src/service/cache/cache_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'api.dart';
import 'src/rest_client.dart';

final networkProvider = Provider<RestClient>(
  (ref) {
    ref.read(cacheServiceProvider).init();

    return RestClient(
      baseUrl: API.base,
      token: () async {
        return await ref.read(cacheServiceProvider).bearerToken;
      },
    );
  },
);
