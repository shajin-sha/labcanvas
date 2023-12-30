import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
// import 'package:file_saver/file_saver_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:graphical_abstract/helper/api_helper.dart';
import 'package:graphical_abstract/helper/message_helper.dart';
import 'package:graphical_abstract/library/src/html_to_widgets_codec.dart';
import 'package:graphical_abstract/view/elements/button.dart';
import 'package:file_saver/src/models/file.model.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:markdown/markdown.dart' as md;
import 'package:html/parser.dart' show parse;

import '../library/htmltopdfwidgets.dart' as HTMLToPdf;

class GraphicalAbstractViewModel with ChangeNotifier {
  FilePickerResult? graphicalAbstractFile;
  bool isLoading = false;
  bool isError = false;
  String? errorMessage;
  String writtenAbstract = "";
  String? result;
  int overallScore = 0;
  ScrollController scrollController = ScrollController();

  void pickGraphicalAbstractFile() async {
    var picked = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ["jpg", "jpeg", "png"]);

    if (picked != null) {
      graphicalAbstractFile = picked;
      notifyListeners();
    } else {
      log("No file selected");
    }
  }

  double calculateTotalPrice({required double inputTokenPricePer1k, required double outputTokenPricePer1k, required int numberOfInputTokens, required int numberOfOutputTokens}) {
    // Assuming you have the number of input tokens as an example (e.g., 5000 tokens)
    //* Return amount will be in USD

    double totalPrice = (numberOfInputTokens / 1000) * inputTokenPricePer1k + (numberOfOutputTokens / 1000) * outputTokenPricePer1k;

    print("Total COST : $totalPrice");
    print("Total COST IN INR : ${totalPrice * 82.18}");

    return totalPrice;
  }

  void onWrittenAbstractChanged(String value) {
    writtenAbstract = value;
    notifyListeners();
  }

  Future<String> getImageAsBase64() async {
    // Get the file path
    String? filePath;
    Uint8List? fileBytes;
    String? imageFormat;
    if (kIsWeb) {
      // Get file type from bytes
      // Note* file.path doesn't work on web
      imageFormat = graphicalAbstractFile!.files[0].name.split(".").last;
    } else {
      filePath = graphicalAbstractFile!.files[0].path!;
      fileBytes = File(filePath).readAsBytesSync();
      imageFormat = filePath.split(".").last;
    }

    // Read the file bytes

    // Get base64 string from the file bytes

    var base64Image = base64Encode(kIsWeb ? graphicalAbstractFile!.files[0].bytes! : fileBytes!);

    // Build the data URI with the detected image format
    var dataUri = "data:image/$imageFormat;base64,$base64Image";

    return dataUri;
  }

  Future<void> copyResultToClipboard(BuildContext context) async {
    if (result != null) {
      await Clipboard.setData(ClipboardData(text: result!)).then((value) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Copied to clipboard"), backgroundColor: Colors.green));
      });
      // Show a snackbar
    }
  }

  Future<void> createPDFFromResult() async {
    final pdf = pw.Document();

    final nodes = md.markdownToHtml(result!, extensionSet: md.ExtensionSet.gitHubFlavored);
    var document = parse(nodes);
    print(document.outerHtml);
    // print full html document
    List<pw.Widget> widgets = await HTMLToPdf.HTMLToPdf().convert(document.outerHtml);
    List<pw.Widget> addOnWidgets = [
      // Heading
      pw.Header(
        level: 2,
        textStyle: pw.TextStyle(fontSize: 15, fontWeight: pw.FontWeight.bold),
        child: pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          crossAxisAlignment: pw.CrossAxisAlignment.center,
          children: [
            pw.Text("Graphical Abstract Review Report", textAlign: pw.TextAlign.center, style: const pw.TextStyle(fontSize: 15).copyWith(fontWeight: pw.FontWeight.bold, fontBold: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), font: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), fontBoldItalic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), fontItalic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")))),
            pw.Text("labcanvas.io | ${DateTime.now().toIso8601String().split("T")[0]}", textAlign: pw.TextAlign.center, style: const pw.TextStyle(fontSize: 10).copyWith(fontWeight: pw.FontWeight.bold, fontBold: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), font: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), fontBoldItalic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")), fontItalic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")))),
          ],
        ),
      ),
      //* Gap
      pw.SizedBox(height: 25),
      // Add image
      pw.Image(
        height: 300,
        width: 300,
        pw.MemoryImage(kIsWeb ? graphicalAbstractFile!.files[0].bytes! : File(graphicalAbstractFile!.files[0].path!).readAsBytesSync()),
      ),
      pw.SizedBox(height: 25),
    ];

    pdf.addPage(
      pw.MultiPage(
        maxPages: 20,
        theme: pw.ThemeData.withFont(
          base: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")),
          bold: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")),
          italic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")),
          boldItalic: pw.Font.ttf(await rootBundle.load("assets/arial.ttf")),
        ),
        build: (pw.Context context) {
          return [...addOnWidgets, ...widgets];
        },
        footer: (pw.Context context) {
          return pw.Container(
            height: 20,
            width: double.infinity,
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(top: 1.0 * HTMLToPdf.PdfPageFormat.cm),
            // Link to our website
            child: pw.UrlLink(
              destination: "https://labcanvas.io",
              child: pw.Text(
                "Generated by labcanvas.io - BETA",
                style: const pw.TextStyle(fontSize: 10).copyWith(fontWeight: pw.FontWeight.bold, color: HTMLToPdf.PdfColors.blue),
              ),
            ),
          );
        },
        header: (pw.Context context) {
          return pw.Container(
            height: 20,
            width: double.infinity,
            alignment: pw.Alignment.centerRight,
            margin: const pw.EdgeInsets.only(bottom: 1.0 * HTMLToPdf.PdfPageFormat.cm),
            color: HTMLToPdf.PdfColors.blue100,
            // Link to our website
            child: pw.UrlLink(
              destination: "https://labcanvas.io",
              child: pw.Text(
                "labcanvas.io | ${DateTime.now().toIso8601String().split("T")[0]}",
                style: const pw.TextStyle(fontSize: 10).copyWith(fontWeight: pw.FontWeight.bold, color: HTMLToPdf.PdfColors.blue),
              ),
            ),
          );
        },
      ),
    );

    // Save
    final bytes = await pdf.save();

    if (kIsWeb == false) {
      FileSaver.instance
          .saveFile(
            name: 'graphical-abstract-review-report',
            ext: 'pdf',
            customMimeType: "application/pdf",
            mimeType: MimeType.custom,
            bytes: bytes,
          )
          .then(
            (value) => log(value),
          );
    } else {
      // FileSaverWeb.downloadFile(
      //   FileModel(
      //     name: 'graphical-abstract-review-report',
      //     bytes: bytes,
      //     ext: 'pdf',
      //     mimeType: "application/pdf",
      //   ),
      // );
    }
  }

  void analyzeGraphicalAbstract(BuildContext context) async {
    notifyListeners();
    if (graphicalAbstractFile == null || graphicalAbstractFile!.files.isEmpty || writtenAbstract.isEmpty || writtenAbstract == "") {
      AlertBox.showAlert(
        context,
        title: graphicalAbstractFile == null || graphicalAbstractFile!.files.isEmpty ? "No graphical abstract" : "No written abstract",
        message: graphicalAbstractFile == null || graphicalAbstractFile!.files.isEmpty ? "Please select a graphical abstract to analyze it." : "Please add your written abstract to analyze it",
        fistButtonTitle: "OK",
        onFirstButtonPressed: () => Navigator.pop(context),
      );
    } else {
      try {
        isLoading = true;
        Object response = await API.post(
          "https://api.openai.com/v1/chat/completions",
          body: {
            "model": "gpt-4-vision-preview",
            "messages": [
              {
                "role": "system",
                "content": [
                  {
                    "type": "text",
                    "text": """You are a highly knowledgeable scientific image analysis expert with deep knowledge in graphic design and scientific illustration. Your task is to examine the following image in detail. The image is a graphical abstract of a research paper. Analyze user prompt. It gives the context and details about the research paper. You need to make sure that the message in user prompt is effectively communicated with clarity in graphical abstract. Give suggestions to improve the typography, colors, composition, layout, information density, readability and clarity. We want to optimize this for effectiveness of communication. & user may provide written abstract for the paper.

                    lus at end give overall score for the graphical abstract given by user (not linked with your suggestions) out of 5. 5 being the best. (Eg: Overall Score: 3/5) follow this same format.

                    IMPORTANT:
                    Your output should be in valid markdown format.
                    """,
                  },
                ]
              },
              {
                "role": "system",
                "content": [
                  {"type": "text", "text": writtenAbstract},
                  {
                    "type": "image_url",
                    "image_url": {
                      "url": await getImageAsBase64(),
                      "detail": "high",
                    }
                  }
                ]
              },
            ],
            "max_tokens": 4096,
          },
        );

        if (response is Success) {
          result = response.data["choices"][0]["message"]["content"];
          calculateTotalPrice(inputTokenPricePer1k: 0.01, outputTokenPricePer1k: 0.03, numberOfInputTokens: response.data["usage"]['prompt_tokens'], numberOfOutputTokens: response.data["usage"]['completion_tokens']);
          try {
            RegExp regex = RegExp(r'Overall\s*Score\s*:\s*([0-9]+/[0-9]+)', caseSensitive: false);

            Match? match = regex.firstMatch(result!);
            overallScore = int.parse(match!.group(1)!.split("/")[0]);
          } on Exception catch (e) {
            log(e.toString());
          }
        } else {
          errorMessage = "Something went wrong!";
          isError = true;
        }

        isLoading = false;
        notifyListeners();
        if (result != null) {
          // Scroll little bit down
          scrollController.animateTo(570, duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);
        }
      } catch (e) {
        log(e.toString());
        errorMessage = e.toString();
        isError = true;
        isLoading = false;
        notifyListeners();
      }
    }
  }

  void reset(BuildContext context) {
    AlertBox.showAlert(context,
        title: "Stat over?",
        message: "Are you sure you want to that over again?",
        fistButtonTitle: "Reset",
        firstButtonType: ButtonType.primary,
        onFirstButtonPressed: () {
          graphicalAbstractFile = null;
          isLoading = false;
          isError = false;
          errorMessage = null;
          writtenAbstract = "";
          result = null;
          scrollController = ScrollController();
          notifyListeners();

          Navigator.pop(context);
        },
        secondButtonTitle: "Cancel",
        onSecondButtonPressed: () => Navigator.pop(context));
  }
}
