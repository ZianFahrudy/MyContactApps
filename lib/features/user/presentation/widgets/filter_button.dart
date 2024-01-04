import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_contact_app/infrastructure/shared/enum/filter_user_enum.dart';

class FilterButton extends StatelessWidget {
  const FilterButton({
    required this.selectedFilterContact,
    super.key,
    this.onApply,
  });

  final ValueNotifier<FilterUserEnum> selectedFilterContact;
  final void Function()? onApply;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.bottomSheet<void>(
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            color: Colors.white,
            width: double.infinity,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Filter Berdasarkan Jenis Kelamin',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                const Gap(30),
                ValueListenableBuilder(
                  valueListenable: selectedFilterContact,
                  builder: (context, _, __) => Column(
                    children: [
                      InkWell(
                        onTap: () {
                          selectedFilterContact.value = FilterUserEnum.male;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Laki-Laki',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.check_box,
                              color: selectedFilterContact.value ==
                                      FilterUserEnum.male
                                  ? Get.theme.primaryColor
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: () {
                          selectedFilterContact.value = FilterUserEnum.female;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Perempuan',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.check_box,
                              color: selectedFilterContact.value ==
                                      FilterUserEnum.female
                                  ? Get.theme.primaryColor
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                      const Gap(20),
                      InkWell(
                        onTap: () {
                          selectedFilterContact.value = FilterUserEnum.reset;
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Reset Filter',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(
                              Icons.check_box,
                              color: selectedFilterContact.value ==
                                      FilterUserEnum.reset
                                  ? Get.theme.primaryColor
                                  : Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(30),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 45),
                  ),
                  onPressed: onApply,
                  child: const Text('Apply'),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Padding(
        padding: EdgeInsets.only(right: 10),
        child: Row(
          children: [
            Text('Filter'),
            SizedBox(width: 5),
            Icon(
              Icons.tune,
            ),
          ],
        ),
      ),
    );
  }
}
