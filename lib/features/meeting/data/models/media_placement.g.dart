// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media_placement.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MediaPlacement _$MediaPlacementFromJson(Map<String, dynamic> json) =>
    MediaPlacement(
      audioHostUrl: json['AudioHostUrl'] as String,
      audioFallbackUrl: json['AudioFallbackUrl'] as String,
      signalingUrl: json['SignalingUrl'] as String,
      turnControlUrl: json['TurnControlUrl'] as String,
      screenDataUrl: json['ScreenDataUrl'] as String?,
      screenViewingUrl: json['ScreenViewingUrl'] as String?,
      screenSharingUrl: json['ScreenSharingUrl'] as String?,
      eventIngestionUrl: json['EventIngestionUrl'] as String?,
    );

Map<String, dynamic> _$MediaPlacementToJson(MediaPlacement instance) =>
    <String, dynamic>{
      'AudioHostUrl': instance.audioHostUrl,
      'AudioFallbackUrl': instance.audioFallbackUrl,
      'SignalingUrl': instance.signalingUrl,
      'TurnControlUrl': instance.turnControlUrl,
      'ScreenDataUrl': instance.screenDataUrl,
      'ScreenViewingUrl': instance.screenViewingUrl,
      'ScreenSharingUrl': instance.screenSharingUrl,
      'EventIngestionUrl': instance.eventIngestionUrl,
    };
