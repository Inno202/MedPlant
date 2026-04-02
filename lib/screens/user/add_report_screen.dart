import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medplant/constants/app_colors.dart';
import 'package:medplant/widgets/results_display_plant_identification.dart';
import 'package:medplant/widgets/image_picker.dart';
import 'package:medplant/widgets/report_form_fields.dart';
import 'package:medplant/widgets/location_info.dart';


class AddReportScreen extends StatefulWidget {
  const AddReportScreen({super.key});

  @override
  State<AddReportScreen> createState() => _AddReportScreenState();
}

class _AddReportScreenState extends State<AddReportScreen> {
  String? imagePath;
  String? plantName;
  String locationStatus = "Detecting your location...";
  ResultState resultState = ResultState.hidden;
double? confidence;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7FAF8),
      // appBar: AppBar(
      //   title: const Text("Add Report", style: TextStyle( color: AppColors.white),),
      //   backgroundColor: AppColors.primaryDark,
      //   elevation: 0,
      // ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 900),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: AppColors.primarySoft.withOpacity(0.4),
                ),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 20,
                    offset: Offset(0, 10),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // 🔝 HEADER (WEB STYLE)
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 28),
                    decoration: BoxDecoration(
                      color: AppColors.primarySoft.withOpacity(0.25),
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      children:  [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 18,
                              backgroundColor: AppColors.primarySoft,
                              child: Icon(Icons.add, color: Colors.white),
                            ),
                            SizedBox(height: 10),
                            Text(
                              "Add Report",
                              style: GoogleFonts.montserrat(
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: AppColors.primaryDark,
                            ),
                            ),
                          ],
                        ),
                        SizedBox(height: 4),
                        Text(
                          "Share your observations with the community",
                          style: GoogleFonts.dancingScript(
                              color: AppColors.primary,
                              fontSize: 18,
                            ),
                        ),
                      ],
                    ),
                  ),

                  // 🔽 BODY
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        // UPLOAD
                        UploadSection(
                          onImageSelected: (path) {
                            setState(() => imagePath = path);
                          },
                        ),

                        const SizedBox(height: 16),

                        // RESULT
                ResultDisplay(
  state: resultState,
  plantName: plantName,
  confidence: confidence,
),

                        const SizedBox(height: 12),

                        // LOCATION
                        LocationInfo(status: locationStatus),

                        const SizedBox(height: 24),

                        // FORM
                        ReportFormFields(),

                        const SizedBox(height: 28),

                        // BUTTONS
                        Wrap(
                          spacing: 12,
                          runSpacing: 10,
                          alignment: WrapAlignment.center,
                          children: [
                            ElevatedButton.icon(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.primaryDark,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 16,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                elevation: 4,
                              ),
                              onPressed: () {
                                // TODO: Submit logic
                              },
                              icon: const Icon(Icons.send, color: AppColors.white,),
                              label: Text(
                                "Submit Report",
                                  style: GoogleFonts.lato(color: AppColors.white),
                              ),
                            ),

                            OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 28,
                                  vertical: 16,
                                ),
                                side: const BorderSide(
                                  color: AppColors.primaryDark,
                                  width: 2,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.close, color: AppColors.primaryDark,),
                              label:  Text("Cancel",   style: GoogleFonts.lato(color: AppColors.primaryDark),),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}