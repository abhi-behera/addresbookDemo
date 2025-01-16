import 'package:dumyapp1/model/dynamicfield_model/dynamicfield_model.dart';
import 'package:dumyapp1/provider/user_profile_provider.dart';
import 'package:dumyapp1/utill/utill_values.dart';
import 'package:dumyapp1/view/CustomWidgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class USerProfile extends StatefulWidget {
  const USerProfile({super.key});

  @override
  State<USerProfile> createState() => _USerProfileState();
}

// enum BadgeStatus { hidden, hiring, openToWork }

class _USerProfileState extends State<USerProfile> {
  @override
  Widget build(BuildContext context) {
    final userProfileProvider =
        Provider.of<UserProfileProvider>(context, listen: true);
    return Scaffold(
      appBar: customAppBar("USER PROFILE"),
      body: userProfileProvider.isLoading
          ? const Center(child: CircularProgressIndicator())
          : userProfileProvider.errorMessage != null
              ? Center(child: Text(userProfileProvider.errorMessage!))
              : ListView.builder(
                  itemCount: (userProfileProvider
                              .userProfile?.dynamicFieldList?.length ??
                          0) +
                      1,
                  itemBuilder: (context, index) {
                    if (index ==
                        (userProfileProvider
                                .userProfile?.dynamicFieldList?.length ??
                            0)) {
                      return Padding(
                        padding: const EdgeInsets.fromLTRB(130, 5, 130, 8),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: appBarColor,
                          ),
                          onPressed: () {
                            userProfileProvider
                                .saveUserData(userProfileProvider.userProfile!);
                          },
                          child: const Text("SAVE"),
                        ),
                      );
                    } else {
                      final field = userProfileProvider
                          .userProfile?.dynamicFieldList![index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: buildField(field, userProfileProvider),
                      );
                    }
                  },
                ),
    );
  }

  // BadgeStatus _badgeStatus = BadgeStatus.hidden;

  // void _toggleBadgeStatus() {
  //   setState(() {
  //     switch (_badgeStatus) {
  //       case BadgeStatus.hidden:
  //         _badgeStatus = BadgeStatus.hiring;
  //         break;
  //       case BadgeStatus.hiring:
  //         _badgeStatus = BadgeStatus.openToWork;
  //         break;
  //       case BadgeStatus.openToWork:
  //         _badgeStatus = BadgeStatus.hidden;
  //         break;
  //     }
  //   });
  // }

  Widget buildField(DynamicFieldList? field, UserProfileProvider provider) {
    if (field == null) return const SizedBox();

    switch (field.fieldType) {
      case UserProfileFormUtill.userProfilePicture:
        {
          return Column(
            children: [
              Stack(children: [
                Center(
                  child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            'https://qaiadmin.neelsystems.com/InstituteImages/237/Public/abhijitbehera.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      )),
                ),
                if (provider.badgeStatus == "hiring")
                  Positioned(
                    bottom: MediaQuery.of(context).size.width * 0.026,
                    left: MediaQuery.of(context).size.width * 0.248,
                    child: Container(
                      width: 180,
                      height: 76,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(69, 82, 108, 132)
                                .withOpacity(0.1),
                            const Color.fromARGB(255, 20, 52, 117)
                                .withOpacity(1),
                            const Color.fromARGB(255, 112, 129, 166)
                                .withOpacity(0.2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(80),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '#HIRING',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                if (provider.badgeStatus == "openToWork")
                  Positioned(
                    bottom: MediaQuery.of(context).size.width * 0.026,
                    left: MediaQuery.of(context).size.width * 0.248,
                    child: Container(
                      width: 180,
                      height: 76,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(145, 176, 216, 174).withOpacity(0.1),
                            const Color.fromARGB(255, 97, 210, 101)
                                .withOpacity(0.8),
                            const Color.fromARGB(104, 255, 255, 255)
                                .withOpacity(0.2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: const BorderRadius.vertical(
                          bottom: Radius.circular(80),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          '#OpenToWork',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ),
                // const SizedBox(height: 20),
                // ElevatedButton(
                //   onPressed: _toggleBadgeStatus,
                //   child: Text(
                //     _badgeStatus == BadgeStatus.hidden
                //         ? 'Show #HIRING'
                //         : _badgeStatus == BadgeStatus.hiring
                //             ? 'Show #OpenToWork'
                //             : 'Hide Status',
                //   ),
                // ),
              ]),
              const SizedBox(height: 20),
              // ElevatedButton(
              //   onPressed: _toggleBadgeStatus,
              //   child: Text(
              //     _badgeStatus == BadgeStatus.hidden
              //         ? 'Show #HIRING'
              //         : _badgeStatus == BadgeStatus.hiring
              //             ? 'Show #OpenToWork'
              //             : 'Hide Status',
              //   ),
              // ),
              ElevatedButton(
                onPressed: () {
                  // provider.toggleBadgeStatus();
                  String nextStatus;
                  switch (provider.badgeStatus) {
                    case "hidden":
                      nextStatus = "hiring";
                      break;
                    case "hiring":
                      nextStatus = "openToWork";
                      break;
                    case "openToWork":
                      nextStatus = "hidden";
                      break;
                    default:
                      nextStatus = "hidden";
                  }
                  provider.toggleBadgeStatus(nextStatus);
                },
                child: Text(
                  provider.badgeStatus == "hidden"
                      ? 'Show #HIRING'
                      : provider.badgeStatus == "hiring"
                          ? 'Show #OpenToWork'
                          : 'Hide Status',
                ),
              ),
            ],
          );
        }
      case UserProfileFormUtill.userProfileFormTextBox:
        {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: field.textControllers,
              decoration: InputDecoration(
                labelText: field.fieldTitle,
                suffixIcon: IconButton(
                  onPressed: field.textControllers?.clear,
                  icon: const Icon(Icons.clear),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
          );
        }
      case UserProfileFormUtill.userProfileFormCalender:
        {
          field.textControllers =
              TextEditingController(text: provider.formattedDate);
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              enabled: (field.textControllers?.text != "") ? false : true,
              controller: field.textControllers,
              decoration: InputDecoration(
                labelText: field.fieldTitle,
                border: const OutlineInputBorder(),
              ),
            ),
          );
        }
      case UserProfileFormUtill.userProfileFormDropDown:
        {
          provider.dropdownValues[field.fieldCode ?? ""] = provider
                  .userProfile?.userProfileClass
                  ?.toJson()[field.fieldCode] ??
              "";
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: DropdownButtonFormField(
              value: (field.fieldCode.toString() == "Gender")
                  ? provider.userProfile?.userProfileClass?.gender.toString()
                  : provider.userProfile?.userProfileClass?.citizenShip
                      .toString(),
              onChanged: (newValue) {
                setState(() {
                  provider.dropdownValues[field.fieldCode ?? ""] = newValue!;
                });
              },
              items: (field.fieldCode.toString() == "Gender")
                  ? provider.userProfile?.genderList?.map((gender) {
                      return DropdownMenuItem(
                        value: gender.genderCode,
                        child: Text(gender.gender ?? ""),
                      );
                    }).toList()
                  : provider.userProfile?.citizenShipList?.map((citizen) {
                      return DropdownMenuItem(
                        value: citizen.citizenShip,
                        child: Text(citizen.citizenShipCode ?? ""),
                      );
                    }).toList(),
              decoration: InputDecoration(
                labelText: field.fieldTitle,
                border: const OutlineInputBorder(),
              ),
            ),
          );
        }
      case UserProfileFormUtill.userProfileFormEmail:
        {
          field.textControllers = TextEditingController(
            text: (field.fieldCode == 'SecondaryEmail')
                ? provider.userProfile?.userProfileClass
                        ?.toJson()[field.fieldCode] ??
                    ""
                : provider.userProfile?.userProfileClass
                        ?.toJson()[field.fieldType] ??
                    "",
          );
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              enabled: (field.textControllers?.text != "") ? false : true,
              controller: field.textControllers,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: field.textControllers?.clear,
                  icon: const Icon(Icons.clear),
                ),
                labelText: field.fieldTitle,
              ),
            ),
          );
        }

      case UserProfileFormUtill.userProfileFormRadioButton:
        return Container(
          margin: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            border: Border.all(color: const Color.fromARGB(255, 109, 125, 151)),
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10.0, top: 10.0),
                child: Text(
                  field.fieldTitle.toString(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              ...provider.radioOptionList.map<Widget>((option) {
                return RadioListTile(
                  title: Text(option),
                  value: option,
                  groupValue: (provider
                          .userProfile!.userProfileClass!.isPermanentResident!)
                      ? provider.selectedOption = "Yes"
                      : provider.selectedOption = "No",
                  onChanged: (value) {
                    provider.selectRadioButton();
                    provider.selectedOption = value!;
                  },
                );
              }).toList(),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
