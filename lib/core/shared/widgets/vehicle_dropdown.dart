import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../gen/locale_keys.g.dart';
import '../../blocs/vehicles/manager/vehicles_cubit.dart';
import '../../blocs/vehicles/manager/vehicles_state.dart';
import '../../services/service_locator.dart';
import 'app_dropdown.dart';

/// Vehicle type picker, fed by the app-wide [VehiclesCubit].
class VehicleDropdown extends StatefulWidget {
  const VehicleDropdown({super.key, required this.value, required this.onChanged});

  final int? value;
  final ValueChanged<int?> onChanged;

  @override
  State<VehicleDropdown> createState() => _VehicleDropdownState();
}

class _VehicleDropdownState extends State<VehicleDropdown> {
  final VehiclesCubit cubit = sl<VehiclesCubit>();

  @override
  void initState() {
    super.initState();
    cubit.getVehicles();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehiclesCubit, VehiclesState>(
      bloc: cubit,
      builder: (context, state) => AppDropdownField<int>(
        label: LocaleKeys.auth_vehicle_type.tr(),
        value: widget.value,
        items: {for (final v in state.vehicles) v.intId: v.name},
        onChanged: widget.onChanged,
        validator: (v) =>
            v == null ? LocaleKeys.validations_choose_vehicle.tr() : null,
      ),
    );
  }
}
