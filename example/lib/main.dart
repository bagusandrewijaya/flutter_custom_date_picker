import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date range picker example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Date range picker example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  DateRange? selectedDateRange;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: DefaultTabController(
          length: 3,
          child: TabBarView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 100),
                  const Text("The simple field example:"),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 250,
                    child: DateRangeField(
                      decoration: const InputDecoration(
                        label: Text("Date range picker"),
                        hintText: 'Please select a date range',
                      ),
                      onDateRangeSelected: (DateRange? value) {
                        setState(() {
                          selectedDateRange = value;
                        });
                      },
                      selectedDateRange: selectedDateRange,
                      pickerBuilder: datePickerBuilder,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  const SizedBox(height: 100),
                  const Text("The simple form field example:"),
                  Container(
                    padding: const EdgeInsets.all(8),
                    width: 250,
                    child: DateRangeFormField(
                      decoration: const InputDecoration(
                        label: Text("Date range picker"),
                        hintText: 'Please select a date range',
                      ),
                      pickerBuilder: (x, y) => datePickerBuilder(x, y, false),
                    ),
                  )
                ],
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    const Text("The decomposed widgets example :"),
                    const SizedBox(height: 20),
                    const Text("The date range picker widget:"),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 560,
                      child: DateRangePickerWidget(
                        maximumDateRangeLength: 10,
                        minimumDateRangeLength: 3,
                        disabledDates: [DateTime(2023, 11, 20)],
                        initialDisplayedDate: DateTime(2023, 11, 20),
                        onDateRangeChanged: print,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("The month selector:"),
                    SizedBox(
                      width: 450,
                      child: MonthSelectorAndDoubleIndicator(
                        currentMonth: DateTime(2023, 11, 20),
                        onNext: () => debugPrint("Next"),
                        onPrevious: () => debugPrint("Previous"),
                        nextMonth: DateTime(2023, 12, 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text("A button to open the picker:"),
                    TextButton(
                      onPressed: () => showDateRangePickerDialog(
                          context: context, builder: datePickerBuilder),
                      child: const Text("Open the picker"),
                    ),
                    const SizedBox(height: 20),
                    const Text("The quick dateRanges:"),
                    SizedBox(
                      width: 250,
                      height: 100,
                      child: QuickSelectorWidget(
                          selectedDateRange: selectedDateRange,
                          quickDateRanges: [
                            QuickDateRange(
                              label: '3 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '7 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 7)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '30 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '90 Hari Hari ',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 90)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '180 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 180)),
                                DateTime.now(),
                              ),
                            ),
                          ],
                          onDateRangeChanged: print,
                          theme: kTheme),
                    )
                  ],
                ),
              )
            ],
          ),
        )
    );
  }

  Widget datePickerBuilder(
          BuildContext context, dynamic Function(DateRange?) onDateRangeChanged,
          [bool doubleMonth = true]) =>
      DateRangePickerWidget(
        
        doubleMonth: doubleMonth,
        maximumDateRangeLength: 30,
         quickDateRanges: [
                            QuickDateRange(
                              label: '3 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 3)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '7 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 7)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '30 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 30)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '90 Hari Hari ',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 90)),
                                DateTime.now(),
                              ),
                            ),
                            QuickDateRange(
                              label: '180 Hari Kebelakang',
                              dateRange: DateRange(
                                DateTime.now()
                                    .subtract(const Duration(days: 180)),
                                DateTime.now(),
                              ),
                            ),
                          ],
        minimumDateRangeLength: 3,
        initialDateRange: selectedDateRange,
        disabledDates: [DateTime(2023, 11, 20)],
        initialDisplayedDate:
            selectedDateRange?.start ?? DateTime(2023, 11, 20),
        onDateRangeChanged: onDateRangeChanged,
      );
}
