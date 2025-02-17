import 'package:get_it/get_it.dart';
import 'package:yafsa/yafsa/data/network/impl/core/dio_client.dart';
import 'package:yafsa/yafsa/data/network/impl/service/book_network_service.dart';

import '../../source/book_network_source.dart';
import '../source/book_network_source_impl.dart';

void initializeNetworkLocator() {
  GetIt.instance.registerSingleton<DioClient>(DioClient());
  GetIt.instance.registerSingleton<BookNetworkService>(
      BookNetworkService(GetIt.instance<DioClient>()));
  GetIt.instance.registerSingleton<BookNetworkSource>(
      BookNetworkSourceImpl(GetIt.instance<BookNetworkService>()));
}
