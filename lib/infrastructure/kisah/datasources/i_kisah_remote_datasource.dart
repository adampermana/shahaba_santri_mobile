import 'package:sahaba_mobile/domains/kisah/kisah_response.dart';

abstract class IKisahRemoteDatasource {
  Future<KisahResponse> getKisahList();
  Future<KisahData> getKisahDetail(int id);
}
