import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'luky_audio_stream_platform_interface.dart';

/// An implementation of [LukyAudioStreamPlatform] that uses method channels.
class MethodChannelLukyAudioStream extends LukyAudioStreamPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('luky_audio_stream');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
