import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:untitled1/app/constant/app_images.dart';
import 'package:untitled1/app/constant/style.dart';
import 'package:untitled1/app/modules/Home_Screen/Home_Screen_controller.dart';
import 'package:untitled1/app/routers/app_router.dart';
import 'package:untitled1/app/widget/app_images.dart';
class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 248, 253, 230), // Light blue
              Color.fromARGB(255, 233, 184, 207), // Light purple
              Color.fromARGB(255, 188, 193, 255), // Light pink
            ],
            stops: [0.0, 0.5, 1.0],
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [               
            _HeaderWidget(context),
             _buildBody(context),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: _contentLeftCell(context),
                ),
                Expanded( flex: 2,              
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(child: GestureDetector(
                            onTap: (){
                              final user = controller.user.value!;
                             Get.toNamed(
                                Routes.WashScreen,
                                arguments: {'userId': user.userId},
                              );
                            },
                            child: _contentRightCellWash(context, 'Phòng giặt', Icons.abc))),
                          
                          Expanded(child: GestureDetector(
                            onTap: (){
                               final user = controller.user.value!;
                              Get.toNamed(Routes.TestScreen,arguments: user,);
                            },
                            child: _contentRightCellChemical(context, 'Phòng Hóa', Icons.abc))),
                          Expanded(child: _contentRightCellPhysic(context, 'Phòng lý', Icons.abc)),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(child: _contentRightCellWareHouse(context, 'Kho hóa chất', Icons.abc)),
                          Expanded(child: _contentRightCellCount(context, 'Lượng hóa chất', Icons.abc)),
                          Expanded(child: _contentRightCellSettings(context, 'Cài đặt thông tin', Icons.abc)),
                        ],
                      ),
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

  // ignore: non_constant_identifier_names
  Widget _HeaderWidget(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              AppImage(
                height: 60,
                width: 60,
                imagePath: AppImages.company_logo,
              ),
              Gap(5),
              Text(
                "Hệ thống R",
                style: AppTextStyles.header(context).copyWith(fontSize: 18),
              ),
            ],
          ),
          Row(
            children: [
              Icon(FontAwesomeIcons.bell, size: 24, color: Colors.black),
              Gap(10),
              GestureDetector(
                onTap: (){
                   Get.offAllNamed(Routes.HOME);
                },
                child: Row(children: [
                Icon(FontAwesomeIcons.arrowRightFromBracket,
                  size: 24, color: Colors.black),
                   Gap(10),
                  Text('Đăng xuất',style: AppTextStyles.header(context).copyWith(fontSize: 16),)
              ],),)           
              
            ],
          )
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20,),
      child: Obx(() {
        if (controller.user.value == null) {
          return const Center(child: CircularProgressIndicator());
        }

        final date = controller.date.value;
        final user = controller.user.value!;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hôm nay: ${date.year} Tháng ${date.month} Ngày ${date.day}',
              style: AppTextStyles.body(context).copyWith(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text("Xin chào, ${user.username}",
                style: AppTextStyles.header(context).copyWith(fontSize: 18)),
          ],
        );
      }),
    );
  }

  Widget _contentLeftCell(BuildContext context) {
    return  
        Container(
          height: Get.height*0.70+2,
          margin: EdgeInsets.all(12),
             padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  blurRadius: 12,
                  spreadRadius: 1,
                  offset: const Offset(0, 6),
                  // ignore: deprecated_member_use
                  color: Colors.black.withOpacity(0.15),
                ),
              ],
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
            ),
            child: Padding(
                padding: const EdgeInsets.all(50),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Obx(() {
                      if (controller.user.value == null) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      final user = controller.user.value!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Thông tin nhân viên',
                            style: AppTextStyles.header(context).copyWith(fontSize: 16),
                          ),
                          const Gap(15),
                          AppImage(
                            height: 60,
                            width: 60,
                            imagePath: AppImages.company_logo,
                            borderRadius: BorderRadius.circular(100),
                            fit: BoxFit.fill,
                          ),
                          const Gap(15),
                          Align(
                            alignment: Alignment.center,
                            child: Text('Tên: ${user.username}')),
                          Text('Mã NV: ${user.username}'),
                          Text('Phòng ban: ${user.username}',style: TextStyle(color: Colors.pink),),
                          Gap(10),
                          Divider(),
                          Gap(10),
                          Text('Danh sách chức năng',style: AppTextStyles.header(context).copyWith(fontSize: 16),),
                          Gap(10),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Icon(Icons.calculate,color: Colors.pink,),
                                    Gap(10),
                                    Text('Tính toán')
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(Icons.calendar_month,color: Colors.pink,),
                                    Gap(10),
                                    Text('Lịch')
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(Icons.email_outlined,color: Colors.pink,),
                                    Gap(10),
                                    Text('outLook')
                                  ],
                                ),
                                Gap(10),
                                Row(
                                  children: [
                                    Icon(Icons.edit_square,color: Colors.pink,),
                                    Gap(10),
                                    Text('Việc cần làm')
                                  ],
                                ),
                                Gap(10),
                              ],
                            )
                            ),               
                        ],
                      );
                    })
                  ],          
              ),
            ),
          
        );
  }

  Widget _contentRightCellWash(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
        margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('Máy giặt',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                    Text('Máy Sấy',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                  ],),
                  Gap(10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('ON',style: AppTextStyles.header(context).copyWith(fontSize: 14),), Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green),),
                    Text('ON',style: AppTextStyles.header(context).copyWith(fontSize: 14),), Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green),),
                  ],),
                  Gap(10),   
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Text('OFF',style: AppTextStyles.header(context).copyWith(fontSize: 14),),Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.red),),
                    Text('OFF',style: AppTextStyles.header(context).copyWith(fontSize: 14),),Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.red),), 
                  ],)     
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
Widget _contentRightCellChemical(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
         margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(            
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Gap(50), 
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Đang thực hiện',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.pink),)),
                     Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: LinearProgressIndicator(
                            value: 0.8,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),),
                          ),
                          Gap(10),
                          Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.pink) ,),
                        ],
                      ),
                    
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text('Đã thực hiện',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green),)),
                   Row(
                        children: [
                          SizedBox(
                            height: 30,
                            width: 150,
                            child: LinearProgressIndicator(
                            value: 0.6,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),),
                          ),
                          Gap(10),
                          Text('12',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green) ,),
                        ],
                      ),
                    
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
  Widget _contentRightCellPhysic(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
         margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Gap(50), 
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Đã thành công',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green),)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('100',style: AppTextStyles.header(context).copyWith(fontSize: 30,color: Colors.green),),
                      Text('100',style: AppTextStyles.header(context).copyWith(fontSize: 30,color: Colors.pink),),                  
                    ],
                  ),
                    Align(
                  alignment: Alignment.centerRight,
                  child: Text('Chưa thành công',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.pink),)),
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
   Widget _contentRightCellWareHouse(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
         margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Gap(50), 
                 Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: Get.height * 0.15,
                        width: Get.height * 0.15,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            CircularProgressIndicator(
                              value: 0.7, // 70%
                              strokeWidth: 30,
                              backgroundColor: Colors.pink.shade300,
                              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                            ),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${(0.7 * 100).toInt()}/", 
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green,
                                    ),
                                  ),
                                   Text(
                                    "${(100-0.7 * 100).toInt()}", 
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.pink,
                                    ),
                                  ),
                                ],
                              ),
                            ),                    
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text('Hóa chất',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.black),),
                          Text('2000g',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.green),),
                          Text('Bột kiểm',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.black),),
                          Text('200g',style: AppTextStyles.header(context).copyWith(fontSize: 14,color: Colors.pink),),
                        ],
                      )
                    ],
                  ),
                ),
               
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
  Widget _contentRightCellCount(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
         margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(50),
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),                   
                  Expanded(
                    child: SfCartesianChart(
                      primaryXAxis: CategoryAxis(),
                      legend: const Legend(isVisible: false), // ẩn chú thích
                      series: <CartesianSeries<_ChartData, String>>[
                        LineSeries<_ChartData, String>(
                          dataSource: <_ChartData>[
                            _ChartData('T1', 12),
                            _ChartData('T2', 24),
                            _ChartData('T3', 18),
                            _ChartData('T4', 30),
                            _ChartData('T5', 22),
                          ],
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          markerSettings: const MarkerSettings(isVisible: true),
                          color: Colors.pink,
                          width: 2,
                        ),
                        LineSeries<_ChartData, String>(
                          dataSource: <_ChartData>[
                            _ChartData('T1', 15),
                            _ChartData('T2', 20),
                            _ChartData('T3', 25),
                            _ChartData('T4', 28),
                            _ChartData('T5', 35),
                          ],
                          xValueMapper: (_ChartData data, _) => data.x,
                          yValueMapper: (_ChartData data, _) => data.y,
                          markerSettings: const MarkerSettings(isVisible: true),
                          color: Colors.green,
                          width: 2,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Sử dụng',style: AppTextStyles.header(context).copyWith(fontSize: 12),),
                      Text('Tồn',style: AppTextStyles.header(context).copyWith(fontSize: 12),),                
                    ],
                  ),
                  Gap(10),
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
    Widget _contentRightCellSettings(BuildContext context, String title,IconData icon) {
    return AspectRatio(
      aspectRatio: 1,
      child: Container(
         margin: EdgeInsets.all(10),
        child: Stack(
          children: [        
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 12,
                    spreadRadius: 1,
                    offset: const Offset(0, 6),
                    // ignore: deprecated_member_use
                    color: Colors.black.withOpacity(0.15),
                  ),
                ],
                borderRadius: BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(12),bottomLeft: Radius.circular(12),bottomRight: Radius.circular(12)),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text(
                    title,
                    style: AppTextStyles.header(context).copyWith(fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                  Gap(30),                
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('+ Tiêu chuẩn khách hàng',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                          Text('+ Phương thức giặt',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                          Text('+ Tiêu chuẩn khách hàng',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                          Text('+ Tiêu chuẩn khách hàng',style: AppTextStyles.header(context).copyWith(fontSize: 14),),
                        ],
                      )              
                    ],
                  ),
                  Gap(10),
              ],)
            ),
            Container(
                height:  Get.width*.05,
                width: Get.width*.05,
                decoration: BoxDecoration(
                  color: Colors.pink.shade200,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: Center(
                  child: Icon(icon,color: Colors.white, size: 30,),
                ), 
              ),
          ],
        ),
      ),
    );
  }
}
class _ChartData {
  _ChartData(this.x, this.y);
  final String x;
  final double y;
}