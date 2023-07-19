// this file is not the one generated by ffiGen.
// ffiGen will generate [flutter_soloud_bindings_ffi_TMP.dart]
// from [ffi_gen_tmp.h] file
// ignore_for_file: require_trailing_commas, avoid_bool_literals_in_conditional_expressions

import 'dart:ffi' as ffi;
import 'package:ffi/ffi.dart';

/// Possible player errors
enum PlayerErrors {
  /// No error
  noError,

  /// Some parameter is invalid
  invalidParameter,

  /// File not found
  fileNotFound,

  /// File found, but could not be loaded
  fileLoadFailed,

  /// DLL not found, or wrong DLL
  dllNotFound,

  /// Out of memory
  outOfMemory,

  /// Feature not implemented
  notImplemented,

  /// Other error
  unknownError,

  /// null pointer. Could happens when passing a non initialized
  /// pointer (with calloc()) to retrieve FFT or wave data
  nullPointer,

  /// The sound with specified hash is not found
  soundHashNotFound,

  /// Player not initialized
  backendNotInited,

  /// Audio isolate not yet started
  isolateAlreadyStarted,

  /// Audio isolate not yet started
  isolateNotStarted,

  /// Engine not yet started
  engineNotStarted,
}

/// FFI bindings to SoLoud
class FlutterSoLoudFfi {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  // ignore: sort_constructors_first
  FlutterSoLoudFfi(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  // ignore: sort_constructors_first
  FlutterSoLoudFfi.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  /// FOR NOW THIS CALLBACK IS NOT USED
  ///
//   /// Since using the callback passed to [setPlayEndedCallback] will throw
//   /// ```Error: fromFunction expects a static function as parameter.
//   /// dart:ffi only supports calling static Dart functions from native code.
//   /// Closures and tear-offs are not supported because
//   /// they can capture context.```
//   static void Function(int)? _userPlayEndedCallback;
//   /// here the user callback given to [setPlayEndedCallback] will be temporarly
// /// saved into [_userPlayEndedCallback]. The [_playEndedCallback] will instead
// /// passed to C side to be called, which then call the user callback.
//   static void _playEndedCallback(int handle) {
//     if (_userPlayEndedCallback != null) {
//       // ignore: prefer_null_aware_method_calls
//       _userPlayEndedCallback!(handle);
//     }
//   }
//   /// @brief Set a dart function to call when the sound with [handle] handle ends
//   /// @param callback this is the dart function that will be called
//   ///     when the sound ends to play.
//   ///     Must be global or a static class member:
//   ///     ```@pragma('vm:entry-point')
//   ///        void playEndedCallback(int handle) {
//   ///             // here the sound with [handle] has ended.
//   ///             // you can play again
//   ///             soLoudController.soLoudFFI.play(handle);
//   ///             // or dispose it
//   ///             soLoudController.soLoudFFI.stop(handle);
//   ///        }
//   ///     ```
//   /// @param handle the handle to the sound
//   /// @return callback this is the dart function that will be called
//   ///         when the sound ends to play
//   /// @return true if success;
//   /// https://github.com/dart-lang/sdk/issues/37022
//   /// PS: NOT USED, maybe in another time
//   bool setPlayEndedCallback(
//     void Function(int) callback,
//     int handle,
//   ) {

//     _userPlayEndedCallback = callback;
//     final ret = _setPlayEndedCallback(
//       ffi.Pointer.fromFunction(_playEndedCallback),
//       handle,
//     );

//     return ret == 1 ? true : false;
//   }

//   late final _setPlayEndedCallbackPtr = _lookup<
//       ffi.NativeFunction<
//           ffi.Int Function(
//               ffi.Pointer<
//                   ffi.NativeFunction<ffi.Void Function(ffi.UnsignedInt)>>,
//               ffi.UnsignedInt)>>('setPlayEndedCallback');
//   late final _setPlayEndedCallback = _setPlayEndedCallbackPtr.asFunction<
//       int Function(
//           ffi.Pointer<ffi.NativeFunction<ffi.Void Function(ffi.UnsignedInt)>>,
//           int)>();

  /// @brief Initialize the player. Must be called before any
  /// other player functions
  /// @return Returns [PlayerErrors.noError] if success
  PlayerErrors initEngine() {
    return PlayerErrors.values[_initEngine()];
  }

  late final _initEnginePtr =
      _lookup<ffi.NativeFunction<ffi.Int32 Function()>>('initEngine');
  late final _initEngine = _initEnginePtr.asFunction<int Function()>();

  /// @brief Must be called when there is no more need of the
  /// player or when closing the app
  /// @return
  void dispose() {
    return _dispose();
  }

  late final _disposePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('dispose');
  late final _dispose = _disposePtr.asFunction<void Function()>();

  /// @brief Load a new sound to be played once or multiple times later
  /// @param completeFileName the complete file path
  /// @param hash return hash of the sound
  /// @return Returns [PlayerErrors.noError] if success and a new [sound]
  ({PlayerErrors error, int soundHash}) loadFile(String completeFileName) {
    // ignore: omit_local_variable_types
    final ffi.Pointer<ffi.UnsignedInt> h =
        calloc(ffi.sizeOf<ffi.UnsignedInt>());
    final e = _loadFile(
      completeFileName.toNativeUtf8().cast<ffi.Char>(),
      h,
    );
    final ret = (error: PlayerErrors.values[e], soundHash: h.value);
    calloc.free(h);
    return ret;
  }

  late final _loadFilePtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.UnsignedInt>)>>('loadFile');
  late final _loadFile = _loadFilePtr.asFunction<
      int Function(ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.UnsignedInt>)>();

  /// @brief T2S
  /// @param textToSpeech the text to be spoken
  /// @param handle sound identifier
  /// @return Returns [PlayerErrors.noError] if success
  /// TODO(me): add other T2S parameters and a new [sound]
  ({PlayerErrors error, int handle}) speechText(String textToSpeech) {
    // ignore: omit_local_variable_types
    final ffi.Pointer<ffi.UnsignedInt> handle = calloc(1);
    final e = _speechText(
      textToSpeech.toNativeUtf8().cast<ffi.Char>(),
      handle,
    );
    final ret = (error: PlayerErrors.values[e], handle: handle.value);
    calloc.free(handle);
    return ret;
  }

  late final _speechTextPtr = _lookup<
      ffi.NativeFunction<
          ffi.Int32 Function(ffi.Pointer<ffi.Char>,
              ffi.Pointer<ffi.UnsignedInt>)>>('speechText');
  late final _speechText = _speechTextPtr.asFunction<
      int Function(ffi.Pointer<ffi.Char>, ffi.Pointer<ffi.UnsignedInt>)>();

  /// @brief Pause or unpause already loaded sound identified by [handle]
  /// @param handle the sound handle
  void pauseSwitch(int handle) {
    return _pauseSwitch(handle);
  }

  late final _pauseSwitchPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UnsignedInt)>>(
          'pauseSwitch');
  late final _pauseSwitch = _pauseSwitchPtr.asFunction<void Function(int)>();

  /// @brief Gets the pause state
  /// @param handle the sound handle
  /// @return true if paused
  bool getPause(int handle) {
    return _getPause(handle) == 1 ? true : false;
  }

  late final _getPausePtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.UnsignedInt)>>(
          'getPause');
  late final _getPause = _getPausePtr.asFunction<int Function(int)>();

  /// @brief Play already loaded sound identified by [soundHash]
  /// @param soundHash the unique sound hash of a sound
  /// @param volume 1.0f full volume
  /// @param pan 0.0f centered
  /// @param paused 0 not pause
  /// @return Returns the new [handle] of the sound, 0 if error
  int play(
    int soundHash, {
    double volume = 1,
    double pan = 0,
    bool paused = false,
  }) {
    return _play(soundHash, volume, pan, paused ? 1 : 0);
  }

  late final _playPtr = _lookup<
      ffi.NativeFunction<
          ffi.UnsignedInt Function(
              ffi.UnsignedInt, ffi.Float, ffi.Float, ffi.Int)>>('play');
  late final _play =
      _playPtr.asFunction<int Function(int, double, double, int)>();

  /// @brief Stop already loaded sound identified by [handle] and clear it
  /// @param handle
  void stop(int handle) {
    return _stop(handle);
  }

  late final _stopPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UnsignedInt)>>('stop');
  late final _stop = _stopPtr.asFunction<void Function(int)>();

  /// @brief Stop all handles of the already loaded sound identified 
  ///     by [soundHash] and clear it
  /// @param hash
  void stopSound(int soundHash) {
    return _stopSound(soundHash);
  }

  late final _stopSoundPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.UnsignedInt)>>(
          'stopSound');
  late final _stopSound = _stopSoundPtr.asFunction<void Function(int)>();

  /// @brief Enable or disable visualization
  /// @param enabled
  /// @return
  // ignore: avoid_positional_boolean_parameters
  void setVisualizationEnabled(bool enabled) {
    return _setVisualizationEnabled(
      enabled ? 1 : 0,
    );
  }

  late final _setVisualizationEnabledPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Int)>>(
          'setVisualizationEnabled');
  late final _setVisualizationEnabled =
      _setVisualizationEnabledPtr.asFunction<void Function(int)>();

  /// @brief Returns valid data only if VisualizationEnabled is true
  /// @param fft
  /// @return a 256 float array containing FFT data.
  void getFft(ffi.Pointer<ffi.Float> fft) {
    return _getFft(fft);
  }

  late final _getFftPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'getFft');
  late final _getFft =
      _getFftPtr.asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  /// @brief Returns valid data only if VisualizationEnabled is true
  /// @param fft
  /// @return a 256 float array containing wave data.
  void getWave(ffi.Pointer<ffi.Float> wave) {
    return _getWave(wave);
  }

  late final _getWavePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'getWave');
  late final _getWave =
      _getWavePtr.asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  /// @brief return in [samples] a 512 float array.
  /// The first 256 floats represent the FFT frequencies data [0.0~1.0].
  /// The other 256 floats represent the wave data (amplitude) [-1.0~1.0].
  /// @param samples should be allocated and freed in dart side
  /// @return
  void getAudioTexture(ffi.Pointer<ffi.Float> samples) {
    return _getAudioTexture(samples);
  }

  late final _getAudioTexturePtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Float>)>>(
          'getAudioTexture');
  late final _getAudioTexture =
      _getAudioTexturePtr.asFunction<void Function(ffi.Pointer<ffi.Float>)>();

  /// @brief Return a floats matrix of 256x512
  /// Every row are composed of 256 FFT values plus 256 of wave data
  /// Every time is called, a new row is stored in the
  /// first row and all the previous rows are shifted
  /// up (the last one will be lost).
  /// @param samples
  /// @return
  void getAudioTexture2D(ffi.Pointer<ffi.Pointer<ffi.Float>> samples) {
    if (samples.address == ffi.nullptr.address) return;
    _getAudioTexture2D(samples);
  }

  late final _getAudioTexture2DPtr = _lookup<
      ffi.NativeFunction<
          ffi.Void Function(
              ffi.Pointer<ffi.Pointer<ffi.Float>>)>>('getAudioTexture2D');
  late final _getAudioTexture2D = _getAudioTexture2DPtr
      .asFunction<void Function(ffi.Pointer<ffi.Pointer<ffi.Float>>)>();

  /// @brief get the sound length in seconds
  /// @param soundHash the sound hash
  /// @return returns sound length in seconds
  double getLength(int soundHash) {
    return _getLength(soundHash);
  }

  late final _getLengthPtr =
      _lookup<ffi.NativeFunction<ffi.Double Function(ffi.UnsignedInt)>>(
          'getLength');
  late final _getLength = _getLengthPtr.asFunction<double Function(int)>();

  /// @brief seek playing in [time] seconds
  /// @param time
  /// @param handle the sound handle
  /// @return Returns [PlayerErrors.noError] if success
  int seek(int handle, double time) {
    return _seek(handle, time);
  }

  late final _seekPtr = _lookup<
          ffi.NativeFunction<ffi.Int32 Function(ffi.UnsignedInt, ffi.Float)>>(
      'seek');
  late final _seek = _seekPtr.asFunction<int Function(int, double)>();

  /// @brief get current sound position in seconds
  /// @param handle the sound handle
  /// @return time in seconds
  double getPosition(int handle) {
    return _getPosition(handle);
  }

  late final _getPositionPtr =
      _lookup<ffi.NativeFunction<ffi.Double Function(ffi.UnsignedInt)>>(
          'getPosition');
  late final _getPosition = _getPositionPtr.asFunction<double Function(int)>();

  /// @brief check if a handle is still valid.
  /// @param handle handle to check
  /// @return true if it still exists
  bool getIsValidVoiceHandle(int handle) {
    return _getIsValidVoiceHandle(handle) == 1 ? true : false;
  }

  late final _getIsValidVoiceHandlePtr =
      _lookup<ffi.NativeFunction<ffi.Int Function(ffi.UnsignedInt)>>(
          'getIsValidVoiceHandle');
  late final _getIsValidVoiceHandle =
      _getIsValidVoiceHandlePtr.asFunction<int Function(int)>();

  /// @brief smooth FFT data.
  /// When new data is read and the values are decreasing, the new value will be
  /// decreased with an amplitude between the old and the new value.
  /// This will resul on a less shaky visualization
  /// @param [smooth] must be in the [0.0 ~ 1.0] range.
  /// 0 = no smooth
  /// 1 = full smooth
  /// the new value is calculated with:
  /// newFreq = smooth * oldFreq + (1 - smooth) * newFreq
  /// @return
  void setFftSmoothing(double smooth) {
    return _setFftSmoothing(smooth);
  }

  late final _setFftSmoothingPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Float)>>(
          'setFftSmoothing');
  late final _setFftSmoothing =
      _setFftSmoothingPtr.asFunction<void Function(double)>();

  /// internal test. Does nothing now
  void test() {
    return _test();
  }

  late final _testPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function()>>('test');
  late final _test = _testPtr.asFunction<void Function()>();
}
