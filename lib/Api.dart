import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:casetube/model/Video.dart';

const CHAVE_YOUTUBE_API = "";
// canal do casimiro troque pelo id de um canal que quiser
const ID_CANAL = "UC4aiJNDUviw_vMhdCq5Kq1Q";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    Uri url = Uri.parse(URL_BASE +
        "search"
            "?part=snippet"
            "&type=video"
            "&maxResults=20"
            "&order=date"
            "&key=$CHAVE_YOUTUBE_API"
            "&channelId=$ID_CANAL"
            "&q=$pesquisa");
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);

      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
        //return Video.converterJson(map);
      }).toList();

      return videos;
    }

    return pesquisar(pesquisa);
  }
}
