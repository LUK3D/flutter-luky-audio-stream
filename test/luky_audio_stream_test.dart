import 'package:flutter_test/flutter_test.dart';
import 'package:luky_audio_stream/luky_audio_stream.dart';
import 'package:luky_audio_stream/luky_audio_stream_platform_interface.dart';
import 'package:luky_audio_stream/luky_audio_stream_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockLukyAudioStreamPlatform
    with MockPlatformInterfaceMixin
    implements LukyAudioStreamPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final LukyAudioStreamPlatform initialPlatform = LukyAudioStreamPlatform.instance;

  test('$MethodChannelLukyAudioStream is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelLukyAudioStream>());
  });

  test('getPlatformVersion', () async {
    LukyAudioStream lukyAudioStreamPlugin = LukyAudioStream();
    MockLukyAudioStreamPlatform fakePlatform = MockLukyAudioStreamPlatform();
    LukyAudioStreamPlatform.instance = fakePlatform;

    expect(await lukyAudioStreamPlugin.getPlatformVersion(), '42');
  });
}
