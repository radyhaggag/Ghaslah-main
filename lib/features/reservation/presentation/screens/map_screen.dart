import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/reservation_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:uuid/uuid.dart';

import '../../../../core/functions/build_toast.dart';
import '../../../../core/helpers/location_helper.dart';
import '../../../../core/utils/color_manager.dart';
import '../widgets/map/custom_map_search_bar.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  CameraPosition? _currentCameraPosition;
  bool _isLoading = true;
  late LatLng location;
  Set<Marker> markers = {};

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  getLocation() async {
    Position position = await LocationHelper.getCurrentLocation();
    location = LatLng(position.latitude, position.longitude);
    _currentCameraPosition = CameraPosition(target: location, zoom: 17.0);
    setState(() => _isLoading = false);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _goToMyCurrentLocation();
  }

  _onLocationTapped(double lat, double lng) {
    final sessiontoken = const Uuid().v4();

    context.read<ReservationBloc>().add(
          GetPlaceDetailsByLatLng(
            lat: lat,
            lng: lng,
            sessiontoken: sessiontoken,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ReservationBloc, ReservationState>(
      listener: (context, state) async {
        if (state is GetPlaceDetailsSuccess) {
          if (context.mounted) {
            context.read<ReservationBloc>().add(
                  ChangeReservationLocation(
                    location: state.placeDetailsModel.formattedAddress,
                  ),
                );
          }
          await _goToSearchedPlaceLocation(
            state.placeDetailsModel.location.lat,
            state.placeDetailsModel.location.lng,
            state.placeDetailsModel.formattedAddress,
          );
        }
        if (state is GetPlaceDetailsByLatLngSuccess) {
          if (context.mounted) {
            context.read<ReservationBloc>().add(
                  ChangeReservationLocation(
                    location: state.placeDetailsModel.formattedAddress,
                  ),
                );
          }
          await _goToSearchedPlaceLocation(
            state.placeDetailsModel.location.lat,
            state.placeDetailsModel.location.lng,
            state.placeDetailsModel.formattedAddress,
          );
        }
        if (state is GetMapSuggestionsFailed) {
          buildToast(msg: state.message, toastType: ToastType.error);
        }
        if (state is GetPlaceDetailsFailed) {
          buildToast(msg: state.message, toastType: ToastType.error);
        }
      },
      child: Scaffold(
        floatingActionButton: Container(
          margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
          child: _isLoading
              ? null
              : FloatingActionButton(
                  onPressed: () => _goToMyCurrentLocation(),
                  backgroundColor: AppColors.primaryColor,
                  child: const Icon(
                    Icons.place,
                    color: AppColors.whiteColor,
                  ),
                ),
        ),
        body: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Stack(
                children: [
                  _buildMap(),
                  const CustomMapSearchBar(),
                ],
              ),
      ),
    );
  }

  GoogleMap _buildMap() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      mapType: MapType.normal,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: false,
      myLocationEnabled: true,
      markers: markers,
      initialCameraPosition: _currentCameraPosition!,
      onTap: (latLng) => _onLocationTapped(latLng.latitude, latLng.longitude),
    );
  }

  _changeMarkerPosition(double lat, double lng, [String? address]) async {
    if (markers.isNotEmpty) markers.clear();
    final marker = Marker(
      markerId: MarkerId((lat).toString()),
      position: LatLng(lat, lng),
      infoWindow: InfoWindow(title: address),
    );
    markers.add(marker);
    setState(() {});
  }

  _goToMyCurrentLocation() async {
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(_currentCameraPosition!),
    );
    await _changeMarkerPosition(
      location.latitude,
      location.longitude,
      "موقعك الحالى",
    );
    if (context.mounted) {
      final sessiontoken = const Uuid().v4();

      context.read<ReservationBloc>().add(GetPlaceDetailsByLatLng(
            lat: location.latitude,
            lng: location.longitude,
            sessiontoken: sessiontoken,
          ));
    }
  }

  _goToSearchedPlaceLocation(double lat, double lng, String? address) async {
    final newCameraPosition = CameraPosition(
      target: LatLng(lat, lng),
      zoom: 17.0,
    );
    mapController.animateCamera(
      CameraUpdate.newCameraPosition(newCameraPosition),
    );
    await _changeMarkerPosition(lat, lng, address);
  }
}
