import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color katakanaColour = Color(0xFF438AFE);
const Color hiraganaColour = Color(0xFF50B149);
const Color inactiveColour = Color(0xFF607D8B);

const List<String> choices = <String>[
  "Катакана",
  "Хирагана",
];

ButtonStyle archiveCardStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(Colors.indigo[200]),
    minimumSize: MaterialStateProperty.all(Size(179, 83)),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)))),
    side: MaterialStateProperty.all(
        BorderSide(width: 0.2, color: Colors.indigo)));

const List<String> SoundsEng = [
  'a i u e o',
  'K',
  'G',
  'S',
  'Z',
  'T',
  'D',
  'N',
  'H',
  'B',
  'P',
  'M',
  'Y',
  'R',
  'W N'
];

const Map<String, String> keysHira = {
  'a': 'あ',
  'i': 'い',
  'u': 'う',
  'e': 'え',
  'o': 'お',
  'ka': 'か',
  'ki': 'き',
  'ku': 'く',
  'ke': 'け',
  'ko': 'こ',
  'ga': 'が',
  'gi': 'ぎ',
  'gu': 'ぐ',
  'ge': 'げ',
  'go': 'ご',
  'sa': 'さ',
  'shi': 'し',
  'su': 'す',
  'se': 'せ',
  'so': 'そ',
  'za': 'ざ',
  'ji': 'じ(ぢ)',
  'zu': 'ず',
  'ze': 'ぜ',
  'zo': 'ぞ',
  'ta': 'た',
  'chi': 'ち',
  'tsu': 'つ',
  'te': 'て',
  'to': 'と',
  'da': 'だ',
  'zu(d)': 'づ',
  'de': 'で',
  'do': 'ど',
  'na': 'な',
  'ni': 'に',
  'nu': 'ぬ',
  'ne': 'ね',
  'no': 'の',
  'ha': 'は',
  'hi': 'ひ',
  'fu': 'ふ',
  'he': 'へ',
  'ho': 'ほ',
  'ba': 'ば',
  'bi': 'び',
  'bu': 'ぶ',
  'be': 'べ',
  'bo': 'ぼ',
  'pa': 'ぱ',
  'pi': 'ぴ',
  'pu': 'ぷ',
  'pe': 'ぺ',
  'po': 'ぽ',
  'ma': 'ま',
  'mi': 'み',
  'mu': 'む',
  'me': 'め',
  'mo': 'も',
  'ya': 'や',
  'yu': 'ゆ',
  'yo': 'よ',
  'ra': 'ら',
  'ri': 'り',
  'ru': 'る',
  're': 'れ',
  'ro': 'ろ',
  'wa': 'わ',
  'n': 'ん',
  'wo': 'を',
};

const Map<String, String> keysKata = {
  'a': 'ア',
  'i': 'イ',
  'u': 'ウ',
  'e': '工',
  'o': 'オ',
  'ka': 'カ',
  'ki': 'キ',
  'ku': 'ク',
  'ke': 'ケ',
  'ko': 'コ',
  'ga': 'ガ',
  'gi': 'ギ',
  'gu': 'グ',
  'ge': 'ゲ',
  'go': 'ゴ',
  'sa': 'サ',
  'shi': 'シ',
  'su': 'ス',
  'se': 'セ',
  'so': 'ソ',
  'za': 'ザ',
  'ji': 'ジ',
  'zu(z)': 'ズ',
  'ze': 'ゼ',
  'zo': 'ゾ',
  'ta': 'タ',
  'chi': 'チ',
  'tsu': 'ツ',
  'te': 'テ',
  'to': 'ト',
  'da': 'ダ',
  'di': 'ヂ',
  'du': 'ジ',
  'de': 'デ',
  'do': 'ド',
  'na': 'ナ',
  'ni': 'ニ',
  'nu': 'ヌ',
  'ne': 'ネ',
  'no': 'ノ',
  'ha': 'ハ',
  'hi': 'ヒ',
  'fu': 'フ',
  'he': 'ヘ',
  'ho': 'ホ',
  'ba': 'バ',
  'bi': 'ビ',
  'bu': 'ブ',
  'be': 'ベ',
  'bo': 'ボ',
  'pa': 'パ',
  'pi': 'ピ',
  'pu': 'プ',
  'pe': 'ペ',
  'po': 'ポ',
  'ma': 'マ',
  'mi': 'ミ',
  'mu': 'ム',
  'me': 'メ',
  'mo': 'モ',
  'ya': 'ヤ',
  'yu': 'ユ',
  'yo': 'ヨ',
  'ra': 'ラ',
  'ri': 'リ',
  'ru': 'ル',
  're': 'レ',
  'ro': 'ロ',
  'wa': 'ワ',
  'n': 'ン',
  'wo': 'ヲ',
};
