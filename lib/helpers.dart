List<String> departments = ['CT', 'CE', 'AR'];
List<String> sem = ['S1', 'S2', 'S3', 'S4', 'S5', 'S6'];
List<String> grades = ['S', 'A', 'B', 'C', 'D', 'E'];

double getResult(List? selectedValues, List? creditsDetails) {
  List<int> gradePoint = [];
  for (var element in selectedValues!) {
    switch (element) {
      case "S":
        gradePoint.add(10);
        break;
      case 'A':
        gradePoint.add(9);
        break;
      case "B":
        gradePoint.add(8);
        break;
      case 'C':
        gradePoint.add(7);
        break;
      case 'D':
        gradePoint.add(6);
        break;
      case "E":
        gradePoint.add(5);
        break;
    }
  }
  double a = 0;
  double total = 0;
  for (var i = 0; i < gradePoint.length; i++) {
    a += gradePoint[i] * creditsDetails![i];
  }
  for (var i in creditsDetails!) {
    total += i;
  }
  return a / total;
}

List<String> setSelectedValues(int length) {
  List<String> selectedValues = [];
  for (int i = 0; i < length; i++) {
    selectedValues.add('S');
  }
  return selectedValues;
}

List getPtsCodeDetails(String? dp, String? sem) {
  var ptscode = [];
  ptscode.add(data[dp]![sem]!.values.toList());
  ptscode.add(data[dp]![sem]!.keys.toList());
  return ptscode;
}

var data = {
  'CT': {
    // CHECKED
    'S1': {
      '1001': 3,
      '1002': 6,
      '1003': 3,
      '1004': 3,
      '1008': 4,
      '1009': 2,
    },
    'S2': {
      '2001': 3,
      '2002': 6,
      '2003': 3,
      '2004': 4,
      '2005': 5,
      '2007': 3,
      '2008': 3,
      '2009': 2,
      '2131': 4,
      '2139': 2,
    },
    'S3': {
      '3001': 3,
      '3131': 4,
      '3132': 4,
      '3133': 4,
      '3134': 5,
      '3137': 3,
      '3138': 3,
      '3139': 2,
    },
    'S4': {
      '4131': 4,
      '4132': 4,
      '4133': 5,
      '4134': 4,
      '4136': 5,
      '4137': 3,
      '4138': 3,
      '4139': 3,
    },
    'S5': {
      '5009': 2,
      '5131': 4,
      '5132': 4,
      '5133': 4,
      '5137': 5,
      '5138': 2,
      '5139': 2,
      'CTS5': 4,
    },
    'S6': {
      '6009': 10,
      '6131': 5,
      '6132': 5,
      '6133': 4,
      '6138': 5,
      '6139': 3,
      'CTS6': 5,
    }
  },
  'CE': {
    'S1': {
      '1001': 3,
      '1002': 6,
      '1003': 3,
      '1004': 3,
      '1008': 4,
      '1009': 2,
    },
  },
  'AR': {
    'S1': {
      '1001': 3,
      '1002': 6,
      '1003': 3,
      '1004': 3,
      '1008': 4,
      '1009': 2,
    },
  },
  'EE': {
    'S1': {
      '1001': 3,
      '1002': 6,
      '1003': 3,
      '1004': 3,
      '1008': 4,
      '1009': 2,
    },
  }
};
