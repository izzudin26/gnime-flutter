class StreamData {
  String file;
  String label;
  String type;
  StreamData.fromJson(Map<String, dynamic> json)
      : file = json['file'],
        label = json['label'],
        type = json['type'];
}

class StreamUrl {
  String referer;
  List<StreamData> sources;
  List<StreamData> sourcesbk;
  StreamUrl.fromJson(Map<String, dynamic> json)
      : referer = json['Referer'],
        sources = (json['sources'] as List).map((e) => StreamData.fromJson(e)).toList(),
        sourcesbk = (json['sources'] as List).map((e) => StreamData.fromJson(e)).toList();
}
