import 'package:flutter/material.dart';
import 'package:flutter_date_range_picker/flutter_date_range_picker.dart';

class QuickSelectorWidget extends StatelessWidget {
  const QuickSelectorWidget({
    Key? key,
    required this.selectedDateRange,
    required this.quickDateRanges,
    required this.onDateRangeChanged,
    required this.theme,
  }) : super(key: key);

  final DateRange? selectedDateRange;
  final List<QuickDateRange> quickDateRanges;
  final ValueChanged<DateRange?> onDateRangeChanged;
  final CalendarTheme theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40, // Tentukan tinggi untuk horizontal ListView
      child: ListView.builder(
        scrollDirection: Axis.horizontal, // Atur menjadi horizontal
        itemCount: quickDateRanges.length,
        itemBuilder: (context, index) {
          final quickDateRange = quickDateRanges[index];
          return Row(
            children: [
              Container(
                width: 4,
                height: 20,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.horizontal(
                    right: Radius.circular(2),
                  ),
                  color: quickDateRange.dateRange == selectedDateRange
                      ? theme.selectedQuickDateRangeColor ??
                          Theme.of(context).primaryColor
                      : Colors.transparent,
                ),
              ),
              const SizedBox(width: 8),
              InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () =>
                    onDateRangeChanged(quickDateRange.dateRange),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    quickDateRange.label,
                    style: theme.quickDateRangeTextStyle,
                  ),
                ),
              ),
              const SizedBox(width: 8), // Spasi antara item
            ],
          );
        },
      ),
    );
  }
}
