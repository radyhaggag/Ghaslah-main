import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ghaslah/core/functions/build_toast.dart';
import '../../../data/models/city_model.dart';

import '../../bloc/auth_bloc.dart';

class SelectCityDropdown extends StatefulWidget {
  const SelectCityDropdown({super.key});

  @override
  State<SelectCityDropdown> createState() => _SelectCityDropdownState();
}

class _SelectCityDropdownState extends State<SelectCityDropdown> {
  List<CityModel> cities = [];
  CityModel? selectedCity;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is GetCitiesSuccess) {
          cities = state.cities;
          if (cities.isNotEmpty) {
            selectedCity = cities.firstWhere(
              (city) =>
                  city.id == context.read<AuthBloc>().registerModel.cityId,
            );
          }
        }
        if (state is GetCitiesFailed) {
          buildToast(toastType: ToastType.error, msg: state.message);
        }
      },
      buildWhen: (previous, current) {
        return current is RegisterCityFieldsUpdate ||
            current is GetCitiesSuccess ||
            current is GetCitiesFailed ||
            current is GetCitiesLoading;
      },
      builder: (context, state) {
        final authBloc = context.read<AuthBloc>();
        return DropdownButtonFormField<CityModel>(
          style: Theme.of(context).textTheme.bodyMedium,
          decoration: const InputDecoration(
            labelText: 'أختر المدينة',
          ),
          value: selectedCity,
          onChanged: (CityModel? newValue) {
            authBloc.add(UpdateRegisterModel(cityId: newValue?.id));
          },
          items: cities.map((value) {
            return DropdownMenuItem<CityModel>(
              value: value,
              child: Text(value.name),
            );
          }).toList(),
        );
      },
    );
  }
}
