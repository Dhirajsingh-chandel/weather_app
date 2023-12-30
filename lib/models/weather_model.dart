/// count : 1
/// data : [{"app_temp":9.1,"aqi":152,"city_name":"Hingoli","clouds":21,"country_code":"IN","datetime":"2023-12-29:18","dewpt":9.1,"dhi":0,"dni":0,"elev_angle":-77.12,"ghi":0,"gust":2.4003906,"h_angle":-90,"lat":19.71464,"lon":77.14238,"ob_time":"2023-12-29 17:59","pod":"n","precip":0,"pres":961.5,"rh":50,"slp":1012.4656,"snow":0,"solar_rad":0,"sources":["analysis","radar","satellite"],"state_code":"16","station":"VAAU","sunrise":"01:31","sunset":"12:29","temp":19.8,"timezone":"Asia/Kolkata","ts":1703872752,"uv":0,"vis":16,"weather":{"code":741,"icon":"a05n","description":"Fog"},"wind_cdir":"E","wind_cdir_full":"east","wind_dir":88,"wind_spd":2.3250241}]

class WeatherModel {
  WeatherModel({
      num? count, 
      List<Data>? data,}){
    _count = count;
    _data = data;
}

  WeatherModel.fromJson(dynamic json) {
    _count = json['count'];
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data?.add(Data.fromJson(v));
      });
    }
  }
  num? _count;
  List<Data>? _data;
WeatherModel copyWith({  num? count,
  List<Data>? data,
}) => WeatherModel(  count: count ?? _count,
  data: data ?? _data,
);
  num? get count => _count;
  List<Data>? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['count'] = _count;
    if (_data != null) {
      map['data'] = _data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// app_temp : 9.1
/// aqi : 152
/// city_name : "Hingoli"
/// clouds : 21
/// country_code : "IN"
/// datetime : "2023-12-29:18"
/// dewpt : 9.1
/// dhi : 0
/// dni : 0
/// elev_angle : -77.12
/// ghi : 0
/// gust : 2.4003906
/// h_angle : -90
/// lat : 19.71464
/// lon : 77.14238
/// ob_time : "2023-12-29 17:59"
/// pod : "n"
/// precip : 0
/// pres : 961.5
/// rh : 50
/// slp : 1012.4656
/// snow : 0
/// solar_rad : 0
/// sources : ["analysis","radar","satellite"]
/// state_code : "16"
/// station : "VAAU"
/// sunrise : "01:31"
/// sunset : "12:29"
/// temp : 19.8
/// timezone : "Asia/Kolkata"
/// ts : 1703872752
/// uv : 0
/// vis : 16
/// weather : {"code":741,"icon":"a05n","description":"Fog"}
/// wind_cdir : "E"
/// wind_cdir_full : "east"
/// wind_dir : 88
/// wind_spd : 2.3250241

class Data {
  Data({
      num? appTemp, 
      num? aqi, 
      String? cityName, 
      num? clouds, 
      String? countryCode, 
      String? datetime, 
      num? dewpt, 
      num? dhi, 
      num? dni, 
      num? elevAngle, 
      num? ghi, 
      num? gust, 
      num? hAngle, 
      num? lat, 
      num? lon, 
      String? obTime, 
      String? pod, 
      num? precip, 
      num? pres, 
      num? rh, 
      num? slp, 
      num? snow, 
      num? solarRad, 
      List<String>? sources, 
      String? stateCode, 
      String? station, 
      String? sunrise, 
      String? sunset, 
      num? temp, 
      String? timezone, 
      num? ts, 
      num? uv, 
      num? vis, 
      Weather? weather, 
      String? windCdir, 
      String? windCdirFull, 
      num? windDir, 
      num? windSpd,}){
    _appTemp = appTemp;
    _aqi = aqi;
    _cityName = cityName;
    _clouds = clouds;
    _countryCode = countryCode;
    _datetime = datetime;
    _dewpt = dewpt;
    _dhi = dhi;
    _dni = dni;
    _elevAngle = elevAngle;
    _ghi = ghi;
    _gust = gust;
    _hAngle = hAngle;
    _lat = lat;
    _lon = lon;
    _obTime = obTime;
    _pod = pod;
    _precip = precip;
    _pres = pres;
    _rh = rh;
    _slp = slp;
    _snow = snow;
    _solarRad = solarRad;
    _sources = sources;
    _stateCode = stateCode;
    _station = station;
    _sunrise = sunrise;
    _sunset = sunset;
    _temp = temp;
    _timezone = timezone;
    _ts = ts;
    _uv = uv;
    _vis = vis;
    _weather = weather;
    _windCdir = windCdir;
    _windCdirFull = windCdirFull;
    _windDir = windDir;
    _windSpd = windSpd;
}

  Data.fromJson(dynamic json) {
    _appTemp = json['app_temp'];
    _aqi = json['aqi'];
    _cityName = json['city_name'];
    _clouds = json['clouds'];
    _countryCode = json['country_code'];
    _datetime = json['datetime'];
    _dewpt = json['dewpt'];
    _dhi = json['dhi'];
    _dni = json['dni'];
    _elevAngle = json['elev_angle'];
    _ghi = json['ghi'];
    _gust = json['gust'];
    _hAngle = json['h_angle'];
    _lat = json['lat'];
    _lon = json['lon'];
    _obTime = json['ob_time'];
    _pod = json['pod'];
    _precip = json['precip'];
    _pres = json['pres'];
    _rh = json['rh'];
    _slp = json['slp'];
    _snow = json['snow'];
    _solarRad = json['solar_rad'];
    _sources = json['sources'] != null ? json['sources'].cast<String>() : [];
    _stateCode = json['state_code'];
    _station = json['station'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _temp = json['temp'];
    _timezone = json['timezone'];
    _ts = json['ts'];
    _uv = json['uv'];
    _vis = json['vis'];
    _weather = json['weather'] != null ? Weather.fromJson(json['weather']) : null;
    _windCdir = json['wind_cdir'];
    _windCdirFull = json['wind_cdir_full'];
    _windDir = json['wind_dir'];
    _windSpd = json['wind_spd'];
  }
  num? _appTemp;
  num? _aqi;
  String? _cityName;
  num? _clouds;
  String? _countryCode;
  String? _datetime;
  num? _dewpt;
  num? _dhi;
  num? _dni;
  num? _elevAngle;
  num? _ghi;
  num? _gust;
  num? _hAngle;
  num? _lat;
  num? _lon;
  String? _obTime;
  String? _pod;
  num? _precip;
  num? _pres;
  num? _rh;
  num? _slp;
  num? _snow;
  num? _solarRad;
  List<String>? _sources;
  String? _stateCode;
  String? _station;
  String? _sunrise;
  String? _sunset;
  num? _temp;
  String? _timezone;
  num? _ts;
  num? _uv;
  num? _vis;
  Weather? _weather;
  String? _windCdir;
  String? _windCdirFull;
  num? _windDir;
  num? _windSpd;
Data copyWith({  num? appTemp,
  num? aqi,
  String? cityName,
  num? clouds,
  String? countryCode,
  String? datetime,
  num? dewpt,
  num? dhi,
  num? dni,
  num? elevAngle,
  num? ghi,
  num? gust,
  num? hAngle,
  num? lat,
  num? lon,
  String? obTime,
  String? pod,
  num? precip,
  num? pres,
  num? rh,
  num? slp,
  num? snow,
  num? solarRad,
  List<String>? sources,
  String? stateCode,
  String? station,
  String? sunrise,
  String? sunset,
  num? temp,
  String? timezone,
  num? ts,
  num? uv,
  num? vis,
  Weather? weather,
  String? windCdir,
  String? windCdirFull,
  num? windDir,
  num? windSpd,
}) => Data(  appTemp: appTemp ?? _appTemp,
  aqi: aqi ?? _aqi,
  cityName: cityName ?? _cityName,
  clouds: clouds ?? _clouds,
  countryCode: countryCode ?? _countryCode,
  datetime: datetime ?? _datetime,
  dewpt: dewpt ?? _dewpt,
  dhi: dhi ?? _dhi,
  dni: dni ?? _dni,
  elevAngle: elevAngle ?? _elevAngle,
  ghi: ghi ?? _ghi,
  gust: gust ?? _gust,
  hAngle: hAngle ?? _hAngle,
  lat: lat ?? _lat,
  lon: lon ?? _lon,
  obTime: obTime ?? _obTime,
  pod: pod ?? _pod,
  precip: precip ?? _precip,
  pres: pres ?? _pres,
  rh: rh ?? _rh,
  slp: slp ?? _slp,
  snow: snow ?? _snow,
  solarRad: solarRad ?? _solarRad,
  sources: sources ?? _sources,
  stateCode: stateCode ?? _stateCode,
  station: station ?? _station,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
  temp: temp ?? _temp,
  timezone: timezone ?? _timezone,
  ts: ts ?? _ts,
  uv: uv ?? _uv,
  vis: vis ?? _vis,
  weather: weather ?? _weather,
  windCdir: windCdir ?? _windCdir,
  windCdirFull: windCdirFull ?? _windCdirFull,
  windDir: windDir ?? _windDir,
  windSpd: windSpd ?? _windSpd,
);
  num? get appTemp => _appTemp;
  num? get aqi => _aqi;
  String? get cityName => _cityName;
  num? get clouds => _clouds;
  String? get countryCode => _countryCode;
  String? get datetime => _datetime;
  num? get dewpt => _dewpt;
  num? get dhi => _dhi;
  num? get dni => _dni;
  num? get elevAngle => _elevAngle;
  num? get ghi => _ghi;
  num? get gust => _gust;
  num? get hAngle => _hAngle;
  num? get lat => _lat;
  num? get lon => _lon;
  String? get obTime => _obTime;
  String? get pod => _pod;
  num? get precip => _precip;
  num? get pres => _pres;
  num? get rh => _rh;
  num? get slp => _slp;
  num? get snow => _snow;
  num? get solarRad => _solarRad;
  List<String>? get sources => _sources;
  String? get stateCode => _stateCode;
  String? get station => _station;
  String? get sunrise => _sunrise;
  String? get sunset => _sunset;
  num? get temp => _temp;
  String? get timezone => _timezone;
  num? get ts => _ts;
  num? get uv => _uv;
  num? get vis => _vis;
  Weather? get weather => _weather;
  String? get windCdir => _windCdir;
  String? get windCdirFull => _windCdirFull;
  num? get windDir => _windDir;
  num? get windSpd => _windSpd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['app_temp'] = _appTemp;
    map['aqi'] = _aqi;
    map['city_name'] = _cityName;
    map['clouds'] = _clouds;
    map['country_code'] = _countryCode;
    map['datetime'] = _datetime;
    map['dewpt'] = _dewpt;
    map['dhi'] = _dhi;
    map['dni'] = _dni;
    map['elev_angle'] = _elevAngle;
    map['ghi'] = _ghi;
    map['gust'] = _gust;
    map['h_angle'] = _hAngle;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['ob_time'] = _obTime;
    map['pod'] = _pod;
    map['precip'] = _precip;
    map['pres'] = _pres;
    map['rh'] = _rh;
    map['slp'] = _slp;
    map['snow'] = _snow;
    map['solar_rad'] = _solarRad;
    map['sources'] = _sources;
    map['state_code'] = _stateCode;
    map['station'] = _station;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['temp'] = _temp;
    map['timezone'] = _timezone;
    map['ts'] = _ts;
    map['uv'] = _uv;
    map['vis'] = _vis;
    if (_weather != null) {
      map['weather'] = _weather?.toJson();
    }
    map['wind_cdir'] = _windCdir;
    map['wind_cdir_full'] = _windCdirFull;
    map['wind_dir'] = _windDir;
    map['wind_spd'] = _windSpd;
    return map;
  }

}

/// code : 741
/// icon : "a05n"
/// description : "Fog"

class Weather {
  Weather({
      num? code, 
      String? icon, 
      String? description,}){
    _code = code;
    _icon = icon;
    _description = description;
}

  Weather.fromJson(dynamic json) {
    _code = json['code'];
    _icon = json['icon'];
    _description = json['description'];
  }
  num? _code;
  String? _icon;
  String? _description;
Weather copyWith({  num? code,
  String? icon,
  String? description,
}) => Weather(  code: code ?? _code,
  icon: icon ?? _icon,
  description: description ?? _description,
);
  num? get code => _code;
  String? get icon => _icon;
  String? get description => _description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = _code;
    map['icon'] = _icon;
    map['description'] = _description;
    return map;
  }

}