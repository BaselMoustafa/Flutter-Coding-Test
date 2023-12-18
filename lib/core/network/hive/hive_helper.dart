import "package:hive_flutter/hive_flutter.dart";

abstract class HiveHelper{

  void registerAdapters({required List<TypeAdapter> typeAdapters,});

  Future<void>put({required String boxName,required dynamic key,required dynamic value,});

  Future<void>putAt({required String boxName,required int index,required dynamic value,});

  Future<void>putAll({required String boxName,required Map<dynamic,dynamic>data,});

  Future<void>add({required String boxName,required dynamic value,});

  Future<void>addAll({required String boxName,required List<dynamic> values,});

  Future<dynamic>get({required String boxName,required dynamic key,dynamic defaultValue,});

  Future<dynamic>getAt({required String boxName,required int index,});

  Future<void>delete({required String boxName,required dynamic key,});

  Future<void>deleteAt({required String boxName,required int index,});

  Future<void>deleteAll({required String boxName,required List<dynamic> keys,});

  Future<void>clear({required String boxName,});

  Future<void>deleteFromDisk({required String boxName,});
}

class HiveHelperImpl extends HiveHelper{

  static bool _hiveIsInitialized =false;

  @override
  void registerAdapters({
    required List<TypeAdapter> typeAdapters,
  }){
    _excuteAfterInitialization(
      functionToExcute: ()async{
        for (var i = 0; i < typeAdapters.length; i++) {
          Hive.registerAdapter(typeAdapters[i]);
        }
      },
    );
  }

  @override
  Future<void>put({
    required String boxName,
    required dynamic key,
    required dynamic value,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).put(key, value);
      },
    );
  }

  @override
  Future<void>putAt({
    required String boxName,
    required int index,
    required dynamic value,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).putAt(index,value);
      },
    );
  }

  @override
  Future<void>putAll({
    required String boxName,
    required Map<dynamic,dynamic>data,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).putAll(data);
      },
    );
  }

  @override
  Future<void>add({
    required String boxName,
    required dynamic value,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).add(value);
      },
    );
  }

  @override
  Future<void>addAll({
    required String boxName,
    required List<dynamic> values,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).addAll(values);
      },
    );
  }

  @override
  Future<dynamic>get({
    required String boxName,
    required dynamic key,
    dynamic defaultValue,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        return await Hive.box(boxName).get(key, defaultValue: defaultValue);
      },
    );
  }

  @override
  Future<dynamic>getAt({
    required String boxName,
    required int index,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        return await Hive.box(boxName).getAt(index);
      },
    );
  }

  @override
  Future<void>delete({
    required String boxName,
    required dynamic key,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        return await Hive.box(boxName).delete(key);
      },
    );
  }

  @override
  Future<void>deleteAt({
    required String boxName,
    required int index,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        return await Hive.box(boxName).deleteAt(index);
      },
    );
  }

  @override
  Future<void>deleteAll({
    required String boxName,
    required List<dynamic> keys,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        return await Hive.box(boxName).deleteAll(keys);
      },
    );
  }

  @override
  Future<void>clear({
    required String boxName,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).clear();
      },
    );
  }

  @override
  Future<void>deleteFromDisk({
    required String boxName,
  })async{
    return await _excuteAfterOpenTheBox(
      boxName: boxName, 
      functionToExcute: () async{
        await Hive.box(boxName).deleteFromDisk();
      },
    );
  }

  static Future<T>_excuteAfterInitialization<T>({
    required Future<T> Function() functionToExcute,
  })async{
    if( ! _hiveIsInitialized){
      _hiveIsInitialized=true;
      await Hive.initFlutter();
    }
    return await functionToExcute();
  }

  static Future<T>_excuteAfterOpenTheBox<T>({
    required String boxName,
    required Future<T> Function() functionToExcute,
  })async{
    return _excuteAfterInitialization(
      functionToExcute: ()async{
        if( ! Hive.isBoxOpen(boxName)){
          await Hive.openBox(boxName);
        }
        return await functionToExcute();
      },
    );
  }

}