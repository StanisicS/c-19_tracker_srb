class Serbia {
  List<Stats> stats;

  Serbia({this.stats});

  Serbia.fromJson(Map<String, dynamic> json) {
    if (json['Stats'] != null) {
      stats = new List<Stats>();
      json['Stats'].forEach((v) {
        stats.add(new Stats.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (stats != null) {
      data['Stats'] = stats.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stats {
  int cases;
  int deaths;
  int recovered;
  int todayCases;
  int todayDeaths;

  Stats(
      {this.cases,
      this.deaths,
      this.recovered,
      this.todayCases,
      this.todayDeaths});

  Stats.fromJson(Map<String, dynamic> json) {
    cases = json['cases'];
    deaths = json['deaths'];
    recovered = json['recovered'];
    todayCases = json['todayCases'];
    todayDeaths = json['todayDeaths'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UKUPAN BROJ OBOLELIH'] = cases;
    data['UKUPAN BROJ PREMINULIH'] = deaths;
    data['UKUPAN BROJ IZLEČENIH'] = recovered;
    data['BROJ OBOLELIH U POSLEDNJA 24 ČASA'] = todayCases;
    data['BROJ PREMINULIH U POSLEDNJA 24 ČASA'] = todayDeaths;

    return data;
  }
}
