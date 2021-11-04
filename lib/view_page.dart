// import 'package:cgpa/helpers.dart';
import 'package:flutter/material.dart';
import 'helpers.dart';

class ViewScreen extends StatefulWidget {
  final String? sem, dep;
  const ViewScreen({Key? key, required this.dep, required this.sem})
      : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  List<String> selectedValues = [];
  List? creditsDetails = [];
  List? codeDetais = [];
  double? result = 0;
  bool _hasElective = false;
  bool _resultVisibilty = false;
  String _error = '';

  @override
  void initState() {
    super.initState();
    try {
      creditsDetails = getPtsCodeDetails(widget.dep, widget.sem)[0];
      codeDetais = getPtsCodeDetails(widget.dep, widget.sem)[1];
      selectedValues = setSelectedValues(creditsDetails!.length);
      _hasElective = widget.sem == 'S5' || widget.sem == 'S6';
    } catch (e) {
      setState(() {
        _error = e.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuerysize = MediaQuery.of(context).size;
    return _error.isNotEmpty
        ? Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(_error),
                  const Text('Please Go back'),
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('Back'))
                ],
              ),
            ),
          )
        : Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: _resultVisibilty,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Your SGPA is : ',
                        style: TextStyle(
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        ' ${result!.toStringAsPrecision(3)}',
                        style: const TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: mediaQuerysize.height / 30,
                ),
                SizedBox(
                  child: Padding(
                    padding: const EdgeInsets.all(26.0),
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: creditsDetails!.length,
                      itemBuilder: (context, index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              codeDetais![index].toString(),
                              textAlign: TextAlign.right,
                            ),
                            Text(creditsDetails![index].toString()),
                            DropdownButton<String>(
                              value: selectedValues[index],
                              onChanged: (String? value) {
                                setState(() {
                                  selectedValues[index] = value!;
                                });
                              },
                              items: grades.map((String value) {
                                return DropdownMenuItem<String>(
                                  alignment: Alignment.center,
                                  value: value,
                                  child: Text(
                                    value,
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      result = getResult(selectedValues, creditsDetails);
                      _resultVisibilty = true;
                    });
                  },
                  child: const Text('Calculate'),
                ),
                SizedBox(
                  height: mediaQuerysize.height / 30,
                ),
                Visibility(
                  visible: _hasElective,
                  child: Text(
                    '* ${widget.dep}${widget.sem} is Elective Subject',
                    style: TextStyle(
                      color: Colors.grey[700],
                    ),
                  ),
                )
              ],
            ),
          );
  }
}
