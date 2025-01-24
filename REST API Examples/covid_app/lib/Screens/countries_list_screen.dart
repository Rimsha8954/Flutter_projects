import 'package:covid_app/Screens/details_screen.dart';
import 'package:covid_app/Services/stats_services.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CountriesListScreen extends StatefulWidget {
  const CountriesListScreen({super.key});

  @override
  State<CountriesListScreen> createState() => _CountriesListScreenState();
}

class _CountriesListScreenState extends State<CountriesListScreen> {
  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsServices statsServices = StatsServices();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextFormField(
              controller: searchController,
              onChanged: (value) {
                setState(() {

                });
              },
              decoration: InputDecoration(
                  hintText: 'Search with country name',
                  hintStyle: TextStyle(
                      color: Colors.white70,
                      fontWeight: FontWeight.w400,
                      fontSize: 15),
                  contentPadding: EdgeInsets.symmetric(horizontal: 25),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50))),
            ),
          ),
          Expanded(
              child: FutureBuilder(
                  future: statsServices.countriesListApi(),
                  builder: (context, AsyncSnapshot<List<dynamic>> snapshot) {
                    if(snapshot.hasData){
                      return ListView.builder(
                        itemCount: snapshot.data!.length,
                          itemBuilder: (context, index){
                          String name = snapshot.data![index]['country'];
                          if(searchController.text.isEmpty){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
                                  name: snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  test: snapshot.data![index]['tests'],
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  totalCases: snapshot.data![index]['cases'],
                                  active: snapshot.data![index]['active'],
                                  recovered: snapshot.data![index]['recovered'],
                                  critical: snapshot.data![index]['critical'],
                                )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),

                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                              ),
                            );
                          }else if(name.toLowerCase().contains(searchController.text.toLowerCase())){
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(
                                  name: snapshot.data![index]['country'],
                                  image: snapshot.data![index]['countryInfo']['flag'],
                                  test: snapshot.data![index]['tests'],
                                  totalDeaths: snapshot.data![index]['deaths'],
                                  totalCases: snapshot.data![index]['cases'],
                                  active: snapshot.data![index]['active'],
                                  recovered: snapshot.data![index]['recovered'],
                                  critical: snapshot.data![index]['critical'],


                                )));
                              },
                              child: ListTile(
                                title: Text(snapshot.data![index]['country']),
                                subtitle: Text(snapshot.data![index]['cases'].toString()),

                                leading: Image(
                                    height: 50,
                                    width: 50,
                                    image: NetworkImage(snapshot.data![index]['countryInfo']['flag'])),
                              ),
                            );
                          }else{
                            return Container();
                          }

                          });
                    }else{
                      return ListView.builder(
                          itemCount: 10,
                          itemBuilder: (context, index){
                            return Shimmer.fromColors(
                                baseColor: Colors.grey.shade700,
                                highlightColor: Colors.grey.shade100,
                              child: Column(
                                children: [
                                  ListTile(
                                    title: Container(height: 10, width: 80,color: Colors.white,),
                                    subtitle: Container(height: 10, width: 80,color: Colors.white,),
                                    leading: Container(height: 50, width: 50,color: Colors.white,),
                                  ),
                                ],
                              ),

                            );
                          });
                    }

                  }))
        ],
      ),
    );
  }
}
