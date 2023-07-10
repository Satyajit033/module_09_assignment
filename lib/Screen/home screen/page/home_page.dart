 

import 'package:intl/intl.dart';

import '../../../Const/const/export.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
//Timer Counter method
  Timer? timer;
  void startTimer() {
    const refreshInterval = Duration(seconds: 1);
    timer = Timer.periodic(refreshInterval, (Timer timer) {
      getHttpWeatherData(lat: latitude, lon: longitude);
      if (mounted) {
        setState(() {});
      }
    });
  }

//Get Current Location
  double? latitude;
  double? longitude;
  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      getHttpWeatherData(lat: latitude, lon: longitude);
      if (mounted) {
        setState(() {});
      }
    } catch (e) {
      throw Exception('Not allow');
    }
  }

  @override
  void initState() {
    super.initState();
    startTimer();
    if (latitude == null && longitude == null) {
      getCurrentLocation();
    }
  }

  @override
  void dispose() {
    super.dispose();
    timer!.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Weather'),
        actions: [
          ReloadPageButton(
            onTap: () async {
              Navigator.of(context).pushNamedAndRemoveUntil(
                  RouteName.homeScreen, (route) => false);
            },
          )
        ],
      ),
      body: FutureBuilder(
        future: getHttpWeatherData(
            lat: latitude ?? 55.0000007241972,
            lon: longitude ?? -2.700007342192975),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            int localTime = snapshot.data['timezone'];
            DateTime? dateTime =
                DateTime.now().add(Duration(seconds: localTime));
            String? formattedTime = DateFormat('hh:mm:ss a').format(dateTime);
            return Column(
              children: [
                TopTempDependImg(
                  img: snapshot.data['weather'][0]['main'] == 'Clouds'
                      ? "https://media.tenor.com/yWQg4oOG2gEAAAAj/sweet-sweetener.gif"
                      : snapshot.data['weather'][0]['main'] == 'Rain'
                          ? "https://media.tenor.com/tN4UF7eb59QAAAAj/love-you-lots-love.gif"
                          : 'https://media.tenor.com/TZ0Duq3g1vEAAAAi/hot-summer.gif',
                ),
                Column(
                  children: [
                    LocationText(text: "${snapshot.data['name']}"),
                    UpdateTime(text: 'Updated: $formattedTime')
                  ],
                ),
                const SizedBox(height: 60),
                TempShowCard(
                    img: snapshot.data['weather'][0]['main'] == 'Clouds'
                        ? "https://media.tenor.com/6pYB1NjecKEAAAAj/agenturleben-hannover.gif"
                        : snapshot.data['weather'][0]['main'] == 'Rain'
                            ? "https://media.tenor.com/V_EUZW2bL_AAAAAj/clouds-raining.gif"
                            : 'https://media.tenor.com/TZ0Duq3g1vEAAAAi/hot-summer.gif',
                    temp: '${snapshot.data['main']['temp']}°',
                    maxTemp: 'Max:${snapshot.data['main']['temp_max']}°',
                    minTemp: 'Min:${snapshot.data['main']['temp_min']}°'),
                const SizedBox(height: 20),
                CloudOrSunny(text: snapshot.data['weather'][0]['main']),
                const Spacer(),
              ],
            );
          }
          if (snapshot.hasError) {
            return const ConnectionLostScreen();
          }
          return const Center(
            child: RefreshProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getCurrentLocation();
        },
        child: const Icon(Icons.location_on),
      ),
    );
  }
}
