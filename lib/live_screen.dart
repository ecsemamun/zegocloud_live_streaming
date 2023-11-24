import 'package:flutter/material.dart';
import 'package:live_streaming/utils.dart';
import 'package:zego_uikit_prebuilt_live_streaming/zego_uikit_prebuilt_live_streaming.dart';
import 'package:zego_uikit_signaling_plugin/zego_uikit_signaling_plugin.dart';

class LiveScreenView extends StatelessWidget {
  final String liveID;
  final bool isHost;

  const LiveScreenView({Key? key, required this.liveID, this.isHost = false, required String userId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ZegoUIKitPrebuiltLiveStreaming(
        appID: 1302548583, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
        appSign: "1c7f94b9a925d1634ad970f853b6c45bf70ca27f77b2a0414450cf4be427c4a7", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
        userID: 'user_id',
        userName: 'user_name',
        liveID: liveID,
        config: isHost
            ? ZegoUIKitPrebuiltLiveStreamingConfig.host(
          plugins: [ZegoUIKitSignalingPlugin()],
        )
            : ZegoUIKitPrebuiltLiveStreamingConfig.audience(
          plugins: [ZegoUIKitSignalingPlugin()],
        ),
      ),
    );
  }
}