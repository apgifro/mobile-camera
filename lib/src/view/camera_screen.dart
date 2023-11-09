import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mobcamera/src/controller/camera_controller.dart';

class CameraScreen extends StatelessWidget {
  CameraScreen({super.key});

  final cameraController = Get.put(CustomCameraController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  _buildAppBar() {
    return AppBar(
        title: const Text(
      'Uso da Câmera',
    ));
  }

  _buildBody() {
    return Column(
      children: [
        _buildCameraPreview(),
        _buildTakePhotoButton(),
      ],
    );
  }

  _buildCameraPreview() {
    return Obx(() {
      if (cameraController.isControllerInitialized.value) {
        return cameraController.initCameraPreview();
      }
      return const Center(child: CircularProgressIndicator());
    });
  }

  _buildTakePhotoButton() {
    return ElevatedButton(
        onPressed: () => cameraController.captureImage(),
        child: const Text('Tirar Foto'));
  }
}
