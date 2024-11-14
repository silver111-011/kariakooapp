import 'dart:async';
import 'dart:io';
import 'dart:ui' as ui; // Use 'as ui' to avoid conflicts
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class LocalFileImageProvider extends ImageProvider<File> {
  final File file;

  LocalFileImageProvider(this.file);

  @override
  ImageStreamCompleter load(File key, DecoderCallback decode) {
    return MultiFrameImageStreamCompleter(
      codec: _loadAsync(key, decode),
      scale: 1.0,
      informationCollector: () sync* {
        yield ErrorDescription('File: ${file.path}');
      },
    );
  }

  Future<ui.Codec> _loadAsync(File key, DecoderCallback decode) async {
    assert(key == file);

    // Read bytes from file
    final Uint8List bytes = await key.readAsBytes();
    // Decode image from bytes
    return await ui.instantiateImageCodec(bytes);
  }

  @override
  Future<File> obtainKey(ImageConfiguration configuration) {
    return SynchronousFuture<File>(file);
  }
}

class DecoderCallback {
}
