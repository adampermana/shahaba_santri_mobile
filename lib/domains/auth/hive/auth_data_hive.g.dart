// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_data_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AuthDataHiveAdapter extends TypeAdapter<AuthDataHive> {
  @override
  final typeId = 0;

  @override
  AuthDataHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthDataHive(
      id: (fields[0] as num?)?.toInt(),
      name: fields[1] as String?,
      phoneNumber: fields[2] as String?,
      accessToken: fields[3] as String?,
      refreshToken: fields[4] as String?,
      tokenType: fields[5] as String?,
      expiresIn: (fields[6] as num?)?.toInt(),
      isProfileCompleted: fields[7] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthDataHive obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.phoneNumber)
      ..writeByte(3)
      ..write(obj.accessToken)
      ..writeByte(4)
      ..write(obj.refreshToken)
      ..writeByte(5)
      ..write(obj.tokenType)
      ..writeByte(6)
      ..write(obj.expiresIn)
      ..writeByte(7)
      ..write(obj.isProfileCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthDataHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
