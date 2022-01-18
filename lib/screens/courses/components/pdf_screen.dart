import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';

class PDFScreen extends StatefulWidget {
  const PDFScreen({Key? key, required this.url}) : super(key: key);
  final String url;
  @override
  State<PDFScreen> createState() => _PDFScreenState();
}

class _PDFScreenState extends State<PDFScreen> {
  late PDFDocument doc;
  bool _isLoading = true;
  Future initPDF() async {
    setState(() => _isLoading = true);
    doc = await PDFDocument.fromURL(
      widget.url,
    );
    setState(() => _isLoading = false);
  }

  @override
  void initState() {
    super.initState();
    initPDF();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PDF'),
      ),
      body: Center(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : PDFViewer(
                document: doc,
                zoomSteps: 1,
                //uncomment below line to preload all pages
                lazyLoad: false,
                // uncomment below line to scroll vertically
                scrollDirection: Axis.vertical,
              ),
      ),
    );
  }
}
