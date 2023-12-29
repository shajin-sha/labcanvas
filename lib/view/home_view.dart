import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:graphical_abstract/helper/message_helper.dart';
import 'package:graphical_abstract/theme/color.dart';
import 'package:graphical_abstract/view/elements/button.dart';
import 'package:graphical_abstract/view/elements/overall_score.dart';
import 'package:graphical_abstract/view/elements/text_input.dart';
import 'package:graphical_abstract/viewmodel/graphical_abstract_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:seo/io/seo_widget.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(ResponsiveHelpers.isMobile(context) ? 10 : 0),
        child: ListView(
          controller: context.read<GraphicalAbstractViewModel>().scrollController,
          physics: const ClampingScrollPhysics(),
          shrinkWrap: true,
          children: [
            //* APP BAR
            Container(
              width: double.infinity,
              decoration: const BoxDecoration(borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20), bottomRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Seo.text(text: "labcanvas", child: Text("labcanvas", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold))),
                        const SizedBox(width: 5),
                        Chip(label: Text('BETA', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10, color: Colors.white)), backgroundColor: Theme.of(context).colorScheme.secondary, labelPadding: EdgeInsets.zero, padding: const EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2), visualDensity: VisualDensity.compact),
                      ],
                    ),
                    Text(
                      'Graphical Abstract Ai',
                      style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 8),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(height: 0),
            Center(
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  Text("Get smart design feedback and enhance your research graphics", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 7 : 15, color: UiColor.extraDarkGreyColor)),
                  const SizedBox(height: 20),
                  //* Image upload (Graphical abstract)
                  DottedBorder(
                    color: Theme.of(context).colorScheme.primary,
                    radius: const Radius.circular(10),
                    borderType: BorderType.RRect,
                    child: InkWell(
                      onTap: () => context.read<GraphicalAbstractViewModel>().pickGraphicalAbstractFile(),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        width: 630,
                        height: 210.0 + (context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile == null ? 0.0 : 190.0),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                        child: Column(
                          children: [
                            const SizedBox(height: 20),
                            context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile == null ? Text('Upload Graphical Abstract Here', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center) : Text("File chosen: ${context.read<GraphicalAbstractViewModel>().graphicalAbstractFile?.files.single.name}", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 18, color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                            const SizedBox(height: 20),
                            context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile == null
                                ? Icon(CupertinoIcons.cloud_upload, size: 50, color: UiColor.primaryColor)
                                : Container(
                                    width: 630,
                                    height: 210 - 90 + 190.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: Theme.of(context).colorScheme.primary, style: BorderStyle.solid, width: 1),
                                      image: DecorationImage(
                                        image: kIsWeb
                                            ? MemoryImage(
                                                context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile!.files.single.bytes!,
                                              ) as ImageProvider<Object>
                                            : FileImage(
                                                File(context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile!.files.single.path!),
                                              ),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),

                            // Max 25 MB
                            if (context.watch<GraphicalAbstractViewModel>().graphicalAbstractFile == null)
                              Column(
                                children: [
                                  Text('Max 15 MB', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12, color: UiColor.darkGreyColor), textAlign: TextAlign.center),
                                  const SizedBox(height: 10),
                                  // High resolution images are recommended for better results
                                  Text('High resolution images are recommended for better results\nSupported formats: JPEG, PNG', style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10, color: UiColor.darkGreyColor), textAlign: TextAlign.center),
                                ],
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // * Text abstract
                  SizedBox(
                    width: 630,
                    child: TextInput(maxLines: 4, hintText: "Paste Written abstract..", helperText: "Your written abstract for the paper", onChanged: (value) => context.read<GraphicalAbstractViewModel>().onWrittenAbstractChanged(value)),
                  ),

                  const SizedBox(height: 20),

                  // * Done button
                  Button(
                    width: 630,
                    title: "Analyze the image",
                    onPressed: () => context.read<GraphicalAbstractViewModel>().analyzeGraphicalAbstract(context),
                    icon: Icons.try_sms_star,
                    isDisabled: context.watch<GraphicalAbstractViewModel>().isLoading,
                    isLoading: context.watch<GraphicalAbstractViewModel>().isLoading,
                  ),
                  if (context.watch<GraphicalAbstractViewModel>().isLoading == false) const SizedBox(height: 20),
                  if (context.watch<GraphicalAbstractViewModel>().isLoading == false) Text("By clicking on the button, you agree to our Terms of Service and Privacy Policy", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 10, color: UiColor.darkGreyColor), textAlign: TextAlign.center),
                  if (context.watch<GraphicalAbstractViewModel>().isLoading == false) const SizedBox(height: 10),

                  // Please be patient while we analyze your graphical abstract
                  if (context.watch<GraphicalAbstractViewModel>().isLoading) Text("\nPlease be patient while we analyze your graphical abstract\nThis may take 10-20 seconds only.", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: 12, color: UiColor.darkGreyColor), textAlign: TextAlign.center),
                  if (context.watch<GraphicalAbstractViewModel>().result != null)
                    SizedBox(
                      width: ResponsiveHelpers.isDesktop(context)
                          ? MediaQuery.of(context).size.width > 2000
                              ? MediaQuery.of(context).size.width / 2.5
                              : MediaQuery.of(context).size.width / 1.25
                          : ResponsiveHelpers.isTablet(context)
                              ? MediaQuery.of(context).size.width / 1
                              : MediaQuery.of(context).size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50),
                          Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: ResponsiveHelpers.isMobile(context)
                                  ? 10
                                  : ResponsiveHelpers.isTablet(context)
                                      ? 20
                                      : 50,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                //* title
                                Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text("Result", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 20 : 25, color: Colors.black, fontWeight: FontWeight.bold)),
                                        //* subtitle
                                        Text("Here is the result of the analysis", style: Theme.of(context).textTheme.labelMedium?.copyWith(fontSize: ResponsiveHelpers.isMobile(context) ? 7 : 15, color: UiColor.darkGreyColor)),
                                      ],
                                    ),
                                    const Spacer(),
                                    // reset button.

                                    if (ResponsiveHelpers.isMobile(context) == false)
                                      Row(
                                        children: [
                                          Button(buttonType: ButtonType.secondary, width: 60, onPressed: () => context.read<GraphicalAbstractViewModel>().reset(context), icon: FeatherIcons.refreshCw, isLoading: context.watch<GraphicalAbstractViewModel>().isLoading, isDisabled: context.watch<GraphicalAbstractViewModel>().isLoading, title: ""),
                                          const SizedBox(width: 10),
                                          SizedBox(height: 50, width: 1, child: VerticalDivider(thickness: 1, color: UiColor.greyColor)),
                                          const SizedBox(width: 10),
                                          // Copy to clipboard
                                          Button(buttonType: ButtonType.secondary, width: 60, onPressed: () => context.read<GraphicalAbstractViewModel>().copyResultToClipboard(context), icon: FeatherIcons.copy, isLoading: context.watch<GraphicalAbstractViewModel>().isLoading, isDisabled: context.watch<GraphicalAbstractViewModel>().isLoading, title: ""),
                                          const SizedBox(width: 5),
                                          Button(buttonType: ButtonType.secondary, width: ResponsiveHelpers.isMobile(context) ? 60 : 200, title: ResponsiveHelpers.isMobile(context) ? "" : "Download PDF", icon: FeatherIcons.download, onPressed: () => context.read<GraphicalAbstractViewModel>().createPDFFromResult()),
                                          const SizedBox(width: 10),
                                        ],
                                      )
                                  ],
                                ),

                                const SizedBox(height: 20),

                                if (ResponsiveHelpers.isMobile(context))
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Button(buttonType: ButtonType.secondary, width: 60, onPressed: () => context.read<GraphicalAbstractViewModel>().reset(context), icon: FeatherIcons.refreshCw, isLoading: context.watch<GraphicalAbstractViewModel>().isLoading, isDisabled: context.watch<GraphicalAbstractViewModel>().isLoading, title: ""),
                                      const SizedBox(width: 5),
                                      SizedBox(height: 50, width: 1, child: VerticalDivider(thickness: 1, color: UiColor.greyColor)),
                                      const SizedBox(width: 5),
                                      // Copy to clipboard
                                      Button(buttonType: ButtonType.secondary, width: 60, onPressed: () => context.read<GraphicalAbstractViewModel>().copyResultToClipboard(context), icon: FeatherIcons.copy, isLoading: context.watch<GraphicalAbstractViewModel>().isLoading, isDisabled: context.watch<GraphicalAbstractViewModel>().isLoading, title: ""),
                                      const SizedBox(width: 5),
                                      Button(buttonType: ButtonType.secondary, width: 200, title: "Download PDF", icon: FeatherIcons.download, onPressed: () => context.read<GraphicalAbstractViewModel>().createPDFFromResult()),
                                    ],
                                  ),

                                Divider(height: 20, thickness: 1, color: UiColor.darkGreyColor),

                                // Over all score
                                const OverallScore(),

                                SizedBox(
                                  child: Markdown(
                                    selectable: true,
                                    shrinkWrap: true,
                                    physics: const ClampingScrollPhysics(),
                                    // Make font size bigger
                                    styleSheet: MarkdownStyleSheet.fromTheme(Theme.of(context)).copyWith(textScaleFactor: ResponsiveHelpers.isMobile(context) ? 0.8 : 1.5),
                                    data: """${context.watch<GraphicalAbstractViewModel>().result}""",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
