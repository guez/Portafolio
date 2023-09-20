import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:permission_handler/permission_handler.dart';

class PlayerController extends GetxController{
  final audioQuery = OnAudioQuery();
  final audioPlayer = AudioPlayer();
  var playIndex = 0.obs;
  var isPlaying = false.obs;

  @override
  void onInit() {
    super.onInit();
    checkPermision();
  }

  playSong(String? uri, index){
    playIndex.value = index;
    try{
      audioPlayer.setAudioSource(
          AudioSource.uri(Uri.parse(uri!))
      );
      audioPlayer.play();
      isPlaying(true);
    }on Exception catch(e){
      print(e.toString());
    }

  }

  checkPermision() async{
    var perm = await Permission.storage.request();
    if(!perm.isGranted){
      checkPermision();
    }
  }
}