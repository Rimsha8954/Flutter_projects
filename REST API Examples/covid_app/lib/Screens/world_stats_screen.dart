
import 'package:covid_app/Reuseable%20Widgets/reuseable_row.dart';
import 'package:covid_app/Screens/countries_list_screen.dart';
import 'package:covid_app/Services/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:pie_chart/pie_chart.dart';

class WorldStatsScreen extends StatefulWidget {
  const WorldStatsScreen({super.key});

  @override
  State<WorldStatsScreen> createState() => _WorldStatsScreenState();
}

class _WorldStatsScreenState extends State<WorldStatsScreen> with TickerProviderStateMixin{

  late final AnimationController _controller = AnimationController(vsync: this, duration: const Duration(seconds: 5))..repeat();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  final colorlist = <Color>[
    const Color(0xff4285F4),
    const Color(0xff1aa260),
    const Color(0xffde5246),

  ];
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
              FutureBuilder(future: statsServices.fetchWorldStatsRecords(),
                  builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Expanded(flex: 1,child: SpinKitFadingCircle(color: Colors.white, size: 50,controller: _controller,));
                }else{
                  return Column(
                    children: [
                      PieChart(
                        dataMap:  {
                        "Total": double.parse(snapshot.data!.cases!.toString()),
                        "Recovered": double.parse(snapshot.data!.recovered!.toString()),
                        "Deaths": double.parse(snapshot.data!.deaths!.toString()),
                      },
                        animationDuration: const Duration(seconds: 1),
                        chartRadius: MediaQuery.of(context).size.width / 3.2,
                        legendOptions: LegendOptions(
                          legendPosition: LegendPosition.left,
                          legendTextStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                          ),
                        ),
                        chartType: ChartType.ring,
                        colorList: colorlist,
                        chartValuesOptions: ChartValuesOptions(
                          showChartValueBackground: true,
                          showChartValues: true,
                          showChartValuesInPercentage: true,
                          showChartValuesOutside: false,
                          decimalPlaces: 2,
                        ),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.06),
                        child: Card(
                          color: Colors.black,
                          child: Column(
                            children: [
                              ReuseableRow(value: snapshot.data!.population.toString(), title: "Total Population"),
                              ReuseableRow(value: snapshot.data!.cases.toString(), title: "Total"),
                              ReuseableRow(value: snapshot.data!.recovered.toString(), title: "Recovered"),
                              ReuseableRow(value: snapshot.data!.deaths.toString(), title: "Deaths"),
                              ReuseableRow(value: snapshot.data!.active.toString(), title: "Active Cases"),
                              ReuseableRow(value: snapshot.data!.affectedCountries.toString(), title: "Affected Countries"),
                              ReuseableRow(value: snapshot.data!.critical.toString(), title: "Critical"),
                              ReuseableRow(value: snapshot.data!.todayCases.toString(), title: "Today Cases"),
                              ReuseableRow(value: snapshot.data!.todayDeaths.toString(), title: "Today Deaths"),
                            ],
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => CountriesListScreen()));
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
                          child: Text("Track Countries", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            )
                        ),
                      ),
                    ],
                  );
                }
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
