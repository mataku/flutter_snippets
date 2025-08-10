import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _controller;
  late List<CameraDescription> cameras;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    cameras = await availableCameras();
    if (cameras.isNotEmpty) {
      _controller = CameraController(
        cameras[0],
        ResolutionPreset.high,
      );
      await _controller!.initialize();
      if (mounted) {
        setState(() {});
      }
    }
  }

  Future<void> _takePicture() async {
    if (_controller != null && _controller!.value.isInitialized) {
      try {
        final image = await _controller!.takePicture();
        final directory = await getApplicationDocumentsDirectory();
        final imagePath =
            '${directory.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
        await File(image.path).copy(imagePath);

        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Picture saved to: $imagePath')),
          );
        }

        /// for OS error
        /// ignore: avoid_catches_without_on_clauses
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error taking picture: $e')),
          );
        }
      }
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Camera Example'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  if (_controller != null)
                    Expanded(
                      child: CameraPreview(_controller!),
                    )
                  else
                    const Expanded(
                      child: Center(
                        child: Text(
                          'Camera placeholder...',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(32),
                    child: ElevatedButton(
                      onPressed: _takePicture,
                      child: const Text('Take Picture'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
