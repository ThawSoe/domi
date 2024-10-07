import 'package:domi/controllers/based_controller.dart';
import 'package:domi/di.dart';
import 'package:domi/models/search_item.dart';
import 'package:domi/services/api_service/api_service.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class AddressPickerStateController extends BasedController {
  final ApiService apiService;

  AddressPickerStateController(this.apiService);

  final TextEditingController completeAddressController =
      TextEditingController();

  // Config: debounce time of search textfield
  final searchThrottleTime = const Duration(milliseconds: 500);

  // UI: to determine claim should show or not
  bool shouldShowClaimAddressBtn = false;

  // UI: to show state of address searching
  AddressSearchState addressSearchState = AddressSearchState.idle;

  // UI: to show error message in address search
  String? addressSearchErrorMessage;

  // UI: to show reterived addresses
  List<AddressSearchItem> suggestedAddresses = [];

  // UI: step x/x inside card
  int step = 1;

  // UI: title of card
  String get cardTitle {
    switch (step) {
      case 1:
        return "Claim your Domi ID";

      case 2:
        return "Earn with your Domi ID";

      default:
        throw UnsupportedError("Need to handle for $step");
    }
  }

  void init() {
    completeAddressController.addListener(_listenerOnAddressChanged);
    completeAddressController.addListener(_addressAutoCompletionListener);
  }

  @override
  void dispose() {
    completeAddressController.removeListener(_listenerOnAddressChanged);
    completeAddressController.removeListener(_addressAutoCompletionListener);
    super.dispose();
  }

  String? validateCompleteAddress(String? input) {
    return null;
  }

  void _listenerOnAddressChanged() {
    bool isTextEmpty = completeAddressController.text.isEmpty;
    if (shouldShowClaimAddressBtn == isTextEmpty) {
      shouldShowClaimAddressBtn = !isTextEmpty;
      notifyListeners();
    }
  }

  void _addressAutoCompletionListener() {
    searchAddress(completeAddressController.text);
  }

  void searchAddress(String query) {
    EasyDebounce.debounce(
      'search-address',
      searchThrottleTime,
      () async {
        addressSearchState = AddressSearchState.loading;
        notifyListeners();
        if (query.isEmpty) {
          suggestedAddresses.clear();
          addressSearchState = AddressSearchState.retrieved;
        } else {
          final searchResult = await apiService.getSuggestions(query);
          searchResult.fold((error) {
            addressSearchErrorMessage = error.errorMessage;
            addressSearchState = AddressSearchState.error;
          }, (addrResult) {
            suggestedAddresses = addrResult;
            addressSearchState = AddressSearchState.retrieved;
          });
        }

        notifyListeners();
      },
    );
  }

  void onPressedClaimYourAddress() {
    step = 2;
    notifyListeners();
  }

  void _resetSearch() {
    suggestedAddresses.clear();
    addressSearchState = AddressSearchState.idle;
    notifyListeners();
  }

  void onPressedSearchedItem(AddressSearchItem item) {
    if (completeAddressController.text != item.streetName) {
      completeAddressController.text = item.streetName;
    }

    _resetSearch();
  }

  void onPressedBackButton() {
    if (step == 2) {
      step = 1;
      notifyListeners();
    }
  }
}

final providerAddressPickerViewCtrl = ChangeNotifierProvider(
    (ref) => AddressPickerStateController(di.get<ApiService>())..init());

enum AddressSearchState { idle, loading, error, retrieved }
