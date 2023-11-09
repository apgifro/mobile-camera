import 'package:camera/camera.dart';
import 'package:get/get.dart';
import 'package:mobcamera/src/model/camera_model.dart';

class CustomCameraController extends GetxController {
  final customCameraModel = CustomCameraModel();
  var isControllerInitialized = false.obs;

  @override
  void onInit() {
    super.onInit();
    initCamera();
  }

  initCamera() async {
    var cameras = await availableCameras();
    customCameraModel.customCameraController =
        CameraController(cameras[0], ResolutionPreset.medium);
    await customCameraModel.customCameraController.initialize();
    isControllerInitialized.value = true;
  }

  initCameraPreview() {
    return CameraPreview(customCameraModel.customCameraController);
  }

  Future<void> captureImage() async {
    XFile file = await customCameraModel.customCameraController.takePicture();
    print("Imagem salva em ${file.path}");
  }
}
