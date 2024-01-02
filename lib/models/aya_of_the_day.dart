class AyaOfTheDay
{
  late String arText;
  late String enTran;
  late String surEnName;
  late int surNum;
  AyaOfTheDay({this.arText="",this.enTran="",this.surEnName="",this.surNum=0});

  factory AyaOfTheDay.fromJSON(Map<String,dynamic>json){
    print(json['data'][0]['text']);
    print(json['data'][2]['text']);
    print(json['data'][2]['surah']['englishName,']);
    print(json['data'][2]['numberInSurah']);
    return AyaOfTheDay(
      arText: json['data'][0]['text'],
      enTran: json['data'][2]['text'],
      surEnName: json['data'][2]['surah']['englishName'],
      surNum: json['data'][2]['numberInSurah']


    );
  }

}
