import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:luky_audio_stream/luky_audio_stream_method_channel.dart';

void main() {
  MethodChannelLukyAudioStream platform = MethodChannelLukyAudioStream();
  const MethodChannel channel = MethodChannel('luky_audio_stream');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
