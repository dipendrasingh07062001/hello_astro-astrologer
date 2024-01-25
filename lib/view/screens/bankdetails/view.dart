import 'package:astro/services/localization/keywords.dart';
import 'package:astro/theme/colorpalatt.dart';
import 'package:astro/theme/themedata.dart';
import 'package:astro/util/buttons.dart';
import 'package:astro/util/images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../widgets/custom_appbar.dart';

class UpdateBankDetails extends StatefulWidget {
  const UpdateBankDetails({super.key});

  @override
  State<UpdateBankDetails> createState() => _UpdateBankDetailsState();
}

class _UpdateBankDetailsState extends State<UpdateBankDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palatt.white,
      appBar: CustomAppBar(
        title: Words.UpdateBankdetails.tr,
      ),
      floatingActionButton: RRButton(
          backgroundColor: Palatt.primary,
          height: 50,
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          radius: 10,
          width: Get.width,
          onTap: () {},
          data: Words.EditBankDetails.tr,
          style: googleFontstyle(
            const TextStyle(
              fontSize: 18,
              color: Palatt.white,
              fontWeight: FontWeight.w500,
            ),
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            width: Get.width,
            height: Get.height * .88,
            decoration: const BoxDecoration(
                color: Palatt.white,
                image:
                    DecorationImage(image: AssetImage(AppImages.background2))),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(Words.Accountinformation.tr,
                            style: googleFontstyle(
                              TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                              ),
                            )),
                        Text(
                          "${Words.Lastupdatedon.tr} 27 Feb. 2022",
                          style: TextStyle(fontSize: 13, color: Palatt.grey),
                        ),
                      ],
                    ),
                    RRButton(
                      onTap: () {},
                      borderColor: Palatt.primary,
                      width: 131,
                      height: 38,
                      radius: 5,
                      data: Words.Approval.tr,
                      style: const TextStyle(
                        fontSize: 16,
                        color: Palatt.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: Get.height * .01,
                ),
                bankdetails(
                    "${Words.BeneficiaryName.tr} :", "Lal Singh Chauhan",
                    trailingstyle: const TextStyle(fontSize: 15),
                    leadingstyle: const TextStyle(
                      color: Palatt.grey,
                      fontSize: 15,
                    )),
                bankdetails("${Words.BankName.tr} :", "State Bank of India",
                    trailingstyle: const TextStyle(fontSize: 15),
                    leadingstyle: const TextStyle(
                      color: Palatt.grey,
                      fontSize: 15,
                    )),
                bankdetails("${Words.AccountNumber.tr} :", "12345678901234",
                    trailingstyle: const TextStyle(fontSize: 15),
                    leadingstyle: const TextStyle(
                      color: Palatt.grey,
                      fontSize: 15,
                    )),
                bankdetails("${Words.IFSCcode.tr} :", "SBI0000360",
                    trailingstyle: const TextStyle(fontSize: 15),
                    leadingstyle: const TextStyle(
                      color: Palatt.grey,
                      fontSize: 15,
                    )),
                bankdetails("${Words.BranchName.tr} :", "State Bank Of India",
                    trailingstyle: const TextStyle(fontSize: 15),
                    leadingstyle: const TextStyle(
                      color: Palatt.grey,
                      fontSize: 15,
                    )),
                bankdetails(
                  Words.CancelledCheque.tr,
                  Words.Download.tr,
                  icon: AppImages.download,
                  trailingstyle:
                      const TextStyle(fontSize: 14, color: Palatt.primary),
                  leadingstyle: const TextStyle(
                    color: Palatt.grey,
                    fontSize: 15,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 7),
                  child: Text(Words.Have_any_issues_related_to_bank_details.tr,
                      style: googleFontstyle(
                        const TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                      )),
                ),
                Row(
                  children: [
                    SvgPicture.asset(
                      AppImages.request,
                      height: 15,
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Text(Words.Raise_request.tr,
                        style: googleFontstyle(
                          TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bankdetails(String leading, String trailing,
      {String? icon, TextStyle? trailingstyle, TextStyle? leadingstyle}) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: Get.height * .006),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                leading,
                style: leadingstyle,
              ),
              Row(
                children: [
                  Text(
                    trailing,
                    style: trailingstyle,
                  ),
                  SizedBox(
                    width: 4,
                  ),
                  Visibility(
                      visible: icon != null,
                      child: SvgPicture.asset(
                        icon ?? "",
                      ))
                ],
              )
            ],
          ),
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
