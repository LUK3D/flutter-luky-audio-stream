import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'luky_audio_stream_method_channel.dart';

abstract class LukyAudioStreamPlatform extends PlatformInterface {
  /// Constructs a LukyAudioStreamPlatform.
  LukyAudioStreamPlatform() : super(token: _token);

  static final Object _token = Object();

  static LukyAudioStreamPlatform _instance = MethodChannelLukyAudioStream();

  /// The default instance of [LukyAudioStreamPlatform] to use.
  ///
  /// Defaults to [MethodChannelLukyAudioStream].
  static LukyAudioStreamPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [LukyAudioStreamPlatform] when
  /// they register themselves.
  static set instance(LukyAudioStreamPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
