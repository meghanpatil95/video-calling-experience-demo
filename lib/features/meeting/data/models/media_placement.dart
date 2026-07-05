import 'package:json_annotation/json_annotation.dart';

part 'media_placement.g.dart';

@JsonSerializable()
class MediaPlacement {
  @JsonKey(name: "AudioHostUrl")
  final String audioHostUrl;

  @JsonKey(name: "AudioFallbackUrl")
  final String audioFallbackUrl;

  @JsonKey(name: "SignalingUrl")
  final String signalingUrl;

  @JsonKey(name: "TurnControlUrl")
  final String turnControlUrl;

  @JsonKey(name: "ScreenDataUrl")
  final String? screenDataUrl;

  @JsonKey(name: "ScreenViewingUrl")
  final String? screenViewingUrl;

  @JsonKey(name: "ScreenSharingUrl")
  final String? screenSharingUrl;

  @JsonKey(name: "EventIngestionUrl")
  final String? eventIngestionUrl;

  MediaPlacement({
    required this.audioHostUrl,
    required this.audioFallbackUrl,
    required this.signalingUrl,
    required this.turnControlUrl,
    this.screenDataUrl,
    this.screenViewingUrl,
    this.screenSharingUrl,
    this.eventIngestionUrl,
  });

  factory MediaPlacement.fromJson(Map<String, dynamic> json) =>
      _$MediaPlacementFromJson(json);

  Map<String, dynamic> toJson() => _$MediaPlacementToJson(this);
}