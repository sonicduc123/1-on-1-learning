import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PDFView extends StatefulWidget {
  const PDFView({Key? key, required this.url, required this.name})
      : super(key: key);

  final String url;
  final String name;

  @override
  _PDFViewState createState() => _PDFViewState();
}

class _PDFViewState extends State<PDFView> {
  bool _isLoading = true;
  late PDFDocument doc;

  @override
  void initState() {
    // TODO: implement initState
    loadPDF();
    super.initState();
  }

  void loadPDF() async {
    setState(() {
      _isLoading = true;
    });
    doc = await PDFDocument.fromURL(
      widget.url,
      cacheManager: CacheManager(
        Config(
          "customCacheKey",
          stalePeriod: const Duration(days: 2),
          maxNrOfCacheObjects: 10,
        ),
      ),
    );

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.name),
      ),
      body: Center(
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: doc,
                zoomSteps: 1,
                scrollDirection: Axis.vertical,
              ),
      ),
    );
  }
}
