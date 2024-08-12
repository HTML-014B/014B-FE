import 'dart:async';
import 'dart:collection';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:html_front/components/custom_appbar.dart';
import 'package:html_front/components/farm_item.dart';
import 'dart:ui' as ui;
import 'package:html_front/models/farm_model.dart';
import 'package:html_front/screens/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String themeForMap = '';
  List<FarmModel> farmsList = farmList;
  /** 위치 서비스 권한, 활성화 여부 확인 */
  Future<String> checkPermission() async {
    final isLocationEnabled =
        await Geolocator.isLocationServiceEnabled(); // 위치 서비스 활성화 여부 확인

    if (!isLocationEnabled) {
      return '위치 서비스를 활성화해주세요.';
    }
    LocationPermission checkedPermission =
        await Geolocator.checkPermission(); // 위치 권한 확인

    if (checkedPermission == LocationPermission.denied) {
      // 위치 권한 거절
      checkedPermission = await Geolocator.requestPermission();

      if (checkedPermission == LocationPermission.deniedForever) {
        return '앱의 위치 권한을 설정에서 허가해주세요';
      }
    }
    return '위치 권한이 허가되었습니다';
  }

  final Completer<GoogleMapController> _controller = Completer();
  //final curPosition = Geolocator.getCurrentPosition();

  /** 지도 초기 위치 설정 */
  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.24120, 127.0709),
    zoom: 18,
  );

  /** 텃밭 위치 마커 */
  //BitmapDescriptor markerIcon = BitmapDescriptor.defaultMarker;

  /*Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }*/

  /*void addCustomIcon() {
    */ /*BitmapDescriptor.fromAssetImage(
            ImageConfiguration(size: Size(20, 20)), "assets/marker.png")
        .then(
      (icon) {
        setState(() {
          markerIcon = icon;
        });
      },
    );*/ /*
    final Uint8List markerIcon = getBytesFromAsset('assets/marker.png', 100);
  }*/

  void onTappedMarker(index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(farm: farmsList[0]),
        fullscreenDialog: true,
      ),
    );
  }

  final List<Marker> myMarker = [];

  Future<Uint8List> getImagesFromMarkers(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: width);
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return (await frameInfo.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  packData() async {
    final Uint8List iconMaker =
        await getImagesFromMarkers('assets/marker.png', 140);
    myMarker.add(Marker(
        markerId: MarkerId('1'),
        position: LatLng(37.24192, 127.0721),
        icon: BitmapDescriptor.fromBytes(iconMaker),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    farm: this.farmsList[0],
                  )));
        }));
    myMarker.add(Marker(
        markerId: MarkerId('2'),
        position: LatLng(37.24196, 127.0703),
        icon: BitmapDescriptor.fromBytes(iconMaker),
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => DetailScreen(
                    farm: this.farmsList[0],
                  )));
        }));
    print(myMarker);
    setState(() {});
  }
  /*final List<Marker> markerList = [
    Marker(
      markerId: MarkerId('first'),
      position: LatLng(37.23937, 127.0702),
    )
    */ /* const Marker(
        markerId: MarkerId('two'), position: LatLng(37.2393679, 127.0701500)),*/ /*
    */ /*const Marker(
        markerId: MarkerId('three'), position: LatLng(37.23726, 127.0705)),
    const Marker(
        markerId: MarkerId('three'), position: LatLng(37.23633, 127.0749)),*/ /*
  ];*/

  /** 폴리곤 영역 */
  final Set<Polygon> myPolygon = HashSet<Polygon>();
  final List<Polygon> polygonList = [
    const Polygon(
        polygonId: const PolygonId('First'),
        points: [
          const LatLng(37.241753, 127.071887),
          const LatLng(37.241920, 127.072233),
          const LatLng(37.242126, 127.072062),
          const LatLng(37.242069, 127.071857),
          const LatLng(37.241906, 127.071957),
          const LatLng(37.241868, 127.071811),
          const LatLng(37.241753, 127.071887),
        ],
        fillColor: Colors.transparent,
        geodesic: true,
        strokeWidth: 3,
        strokeColor: Colors.brown),
    const Polygon(
        polygonId: const PolygonId('two'),
        points: [
          const LatLng(37.242014, 127.069753),
          const LatLng(37.242176, 127.069854),
          const LatLng(37.242264, 127.070230),
          const LatLng(37.241903, 127.070439),
          const LatLng(37.241758, 127.070273),
        ],
        fillColor: Colors.transparent,
        geodesic: true,
        strokeWidth: 3,
        strokeColor: Colors.brown)
  ];
  // List<LatLng> points = [
  //   //const LatLng(37.2363288, 127.0748667),
  //   const LatLng(37.23844, 127.0668),
  //   const LatLng(37.23217, 127.0708),
  //   const LatLng(37.23759, 127.0801),
  //   const LatLng(37.24155, 127.0714),
  //   const LatLng(37.24001, 127.0676)
  // ];

  /** circle */
  static final Set<Circle> myCircle = HashSet<Circle>();

  @override
  void initState() {
    super.initState();

    //addCustomIcon();
    DefaultAssetBundle.of(context)
        .loadString('i_theme/retro_theme.json')
        .then((value) => {themeForMap = value});
    packData();
    //myMarker.addAll(markerList);
    myPolygon.addAll(polygonList);
    /*myCircle.add(Circle(
        circleId: CircleId('target'),
        center: LatLng(37.23937, 127.0702),
        fillColor: Colors.brown.withOpacity(0.5),
        radius: 100,
        strokeColor: Colors.brown,
        strokeWidth: 1));*/
  }

  /**
      @override
      void initState() async {
      // TODO: implement initState
      super.initState();
      final curPosition = await Geolocator.getCurrentPosition();
      print(curPosition);
      }**/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'CIFARM'),
      body: FutureBuilder<String>(
        future: checkPermission(),
        builder: (context, snapshot) {
          //로딩중
          if (!snapshot.hasData &&
              snapshot.connectionState == ConnectionState.waiting) {
            return (Center(child: CircularProgressIndicator()));
          }
          // 통과
          if (snapshot.data == '위치 권한이 허가되었습니다') {
            return Stack(
              children: [
                GoogleMap(
                  style: themeForMap,
                  initialCameraPosition: _initialPosition,
                  myLocationEnabled: true,
                  markers: Set<Marker>.of(myMarker),
                  //Set<Marker>.of(myMarker),
                  circles: Set<Circle>.of(myCircle),
                  polygons: myPolygon,
                ),
                DraggableScrollableSheet(
                  // 화면 비율로 높이 조정
                  initialChildSize: 0.4,
                  minChildSize: 0.02,
                  maxChildSize: 1.0,
                  builder: (BuildContext context,
                      ScrollController scrollController) {
                    return SingleChildScrollView(
                        controller: scrollController,
                        child: Container(
                          height: 1500,
                          decoration: BoxDecoration(color: Color(0xFFFFFFFF)),
                          child: ListView.separated(
                              controller: scrollController,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  DetailScreen(
                                                      farm: farmsList[index])));
                                    },
                                    child: FarmItem(farm: farmsList[index]));
                              },
                              separatorBuilder: (context, index) =>
                                  const Divider(
                                      color: Color(0xffDFDFDF),
                                      height: 0,
                                      indent: 16,
                                      endIndent: 1),
                              itemCount: farmsList.length),
                        ));
                  },
                )
              ],
            );
          }
          // 권한 없는 상태
          return Center(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }
}
