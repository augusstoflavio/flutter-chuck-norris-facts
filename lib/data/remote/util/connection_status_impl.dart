import 'package:chuck_norris_facts/data/remote/util/connection_status.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectionStatusImpl extends ConnectionStatus {

  final Connectivity connectivity;

  ConnectionStatusImpl({
    required this.connectivity,
  });

  @override
  Future<bool> isAvailable() async {
    var connectionType = await connectivity.checkConnectivity();
    return connectionType != ConnectivityResult.none;
  }
}