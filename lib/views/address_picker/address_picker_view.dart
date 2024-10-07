import 'package:domi/controllers/address_picker_state_controller.dart';
import 'package:domi/views/widgets/address_box.dart';
import 'package:domi/views/widgets/error_search_item.dart';
import 'package:domi/views/widgets/info_card.dart';
import 'package:domi/views/widgets/loading_search_item.dart';
import 'package:domi/views/widgets/map.dart';
import 'package:domi/views/widgets/search_item.dart';
import 'package:domi/views/widgets/slider_box.dart';
import 'package:domi/views/widgets/utils/ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddressPickerView extends ConsumerWidget {
  const AddressPickerView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addressPickerCtrl = ref.watch(providerAddressPickerViewCtrl);

    return Scaffold(
        body: Stack(
      children: [
        const MapView(),
        Align(
          alignment: Alignment.bottomCenter,
          child: SingleChildScrollView(
            child: InfoCard(
              title: addressPickerCtrl.cardTitle,
              subtitle: "Open mails and earn money",
              step: "${addressPickerCtrl.step}/4",
              showActionButton: addressPickerCtrl.shouldShowClaimAddressBtn,
              content: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  addressPickerCtrl.step == 1
                      ? AddressBoxWidget(
                          controller:
                              addressPickerCtrl.completeAddressController,
                          validator: addressPickerCtrl.validateCompleteAddress)
                      : addressPickerCtrl.step == 2
                          ? const SliderBoxWidget()
                          : const SizedBox(),
                  if (addressPickerCtrl.step == 1)
                    ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: context.h),
                      child: addressPickerCtrl.addressSearchState ==
                              AddressSearchState.loading
                          ? LoadingSearchItemWidget()
                          : addressPickerCtrl.addressSearchState ==
                                  AddressSearchState.error
                              ? ErrorSearchItemWidget(
                                  errorMessage: addressPickerCtrl
                                      .addressSearchErrorMessage!)
                              : ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: addressPickerCtrl
                                      .suggestedAddresses.length,
                                  itemBuilder: (context, index) {
                                    return SearchItemWidget(
                                      name: addressPickerCtrl
                                          .suggestedAddresses[index].streetName,
                                      subTitle: addressPickerCtrl
                                          .suggestedAddresses[index].city,
                                      onPressed: () {
                                        addressPickerCtrl.onPressedSearchedItem(
                                            addressPickerCtrl
                                                .suggestedAddresses[index]);
                                      },
                                    );
                                  },
                                ),
                    ),
                ],
              ),
              onPressedActionButton:
                  addressPickerCtrl.onPressedClaimYourAddress,
              onPressedBack: addressPickerCtrl.onPressedBackButton,
            ),
          ),
        ),
      ],
    ));
  }
}
