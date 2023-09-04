import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store/helpers/colors.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MyWallet extends StatelessWidget {
  List<_SalesData> MoneyChart = [
    _SalesData('day1', 0),
    _SalesData('day2', 450),
    _SalesData('day3', 200),
    _SalesData('day4', 1250),
    _SalesData('day5', 500),
    _SalesData('day6', 1225),
    _SalesData('day7', 110),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Padding(
            padding: EdgeInsets.all(7.0.w),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.black,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.deepPurple.shade100,
                      blurRadius: 6.r,
                      spreadRadius: 0.0.r,
                      offset: const Offset(0, 0), // Shadow position
                    ),
                  ],
                  borderRadius: BorderRadius.circular(15.r),
                ),
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              child: Row(
                children: [
                  Text(
                    'Analytics',
                    style: TextStyle(
                        fontSize: 38.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  const Spacer(),
                  Container(
                    height: 50.h,
                    width: 50.w,
                    decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.deepPurple.shade100,
                            blurRadius: 6.r,
                            spreadRadius: 0.0.r,
                            offset: const Offset(0, 0), // Shadow position
                          ),
                        ],
                        borderRadius: BorderRadius.circular(15.r),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                'https://img.freepik.com/premium-photo/attractive-satisfied-lady-with-pleasant-appearance-beautiful-hair_176532-10297.jpg'))),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 50.h,
            ),
            SfCartesianChart(
                primaryYAxis: DateTimeCategoryAxis(),
                primaryXAxis: CategoryAxis(),
                enableSideBySideSeriesPlacement: true,
                legend: const Legend(
                  isVisible: false,
                ),
                tooltipBehavior:
                    TooltipBehavior(enable: true, color: AppColors.Primary),
                series: <ChartSeries<_SalesData, String>>[
                  SplineAreaSeries<_SalesData, String>(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Colors.blue.shade800, Colors.white]),
                      borderColor: Colors.transparent,
                      borderWidth: 3,
                      xAxisName: 'money',
                      dataSource: MoneyChart,
                      xValueMapper: (_SalesData sales, _) => sales.year,
                      yValueMapper: (_SalesData sales, _) => sales.sales,
                      name: 'viewer',
                      dataLabelSettings: const DataLabelSettings(
                          color: Colors.white, isVisible: true))
                ]),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 220.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade100,
                          blurRadius: 6.r,
                          spreadRadius: 0.0.r,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: Image.network(
                              'https://cdn0.iconfinder.com/data/icons/business-analysis-red/64/GROWTH-money-plant-bank-investment-512.png')),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$450.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.sp),
                          ),
                          const Icon(
                            Icons.expand_more_rounded,
                            color: Colors.red,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Total Spending',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Container(
                  height: 220.h,
                  width: 160.w,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.deepPurple.shade100,
                          blurRadius: 6.r,
                          spreadRadius: 0.0.r,
                          offset: const Offset(0, 0), // Shadow position
                        ),
                      ],
                      borderRadius: BorderRadius.circular(15.r),
                      color: Colors.white),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 25.h,
                      ),
                      SizedBox(
                          width: 60.w,
                          height: 60.h,
                          child: Image.network(
                              'https://th.bing.com/th/id/OIP.VpQlFExqJc56mmjsiK97eQHaHa?pid=ImgDet&w=480&h=480&rs=1')),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '\$1255.00',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24.sp),
                          ),
                          const Icon(
                            Icons.expand_less,
                            color: Colors.green,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        'Total Receipts',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.grey),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _SalesData {
  _SalesData(this.year, this.sales);

  final String year;
  final double sales;
}
