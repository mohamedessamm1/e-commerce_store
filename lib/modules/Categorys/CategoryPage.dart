import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:store/modules/Categorys/Cubit.dart';
import 'package:store/modules/Categorys/States.dart';
import 'package:store/share/Cubit/Cubit.dart';
import 'package:store/share/componant/componant.dart';

class CategoryPage extends StatelessWidget {
  CategoryPage({Key? key}) : super(key: key);
  var buttonCarouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CategoryCubit, CategoryState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
              body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                  ),
                  BarName(
                      MyPreIcon: const Icon(Icons.arrow_back_ios_rounded),
                      fun: () {
                        AppCubit.get(context).changebottomnav(0);
                      },
                      title: 'Categorys'),
                  SizedBox(
                    height: 20.h,
                  ),
                  SizedBox(
                    height: 170.h,
                    width: double.infinity,
                    child: CarouselSlider(
                      items: [
                        Image.asset(
                          'assets/images/1.jpg',
                        ),
                        Image.asset('assets/images/2.jpg'),
                        Image.asset('assets/images/3.jpg'),
                      ],
                      carouselController: buttonCarouselController,
                      options: CarouselOptions(
                        autoPlay: true,
                        enlargeCenterPage: true,
                        viewportFraction: 2,
                        aspectRatio: 1,
                        initialPage: 0,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  GridView.count(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      crossAxisSpacing: 15.w,
                      mainAxisSpacing: 20.h,
                      children: [
                        ItemCategory(
                            'https://th.bing.com/th/id/R.d245186066d08c7ae8039dae68eb12f4?rik=SvEjqBFvvwP7SA&riu=http%3a%2f%2fwww.pngall.com%2fwp-content%2fuploads%2f1%2fElectronic-Download-PNG.png&ehk=ZNqyw4YHCnnvBjcuFC4fi6ZE1znIblzXqaIwc7vWvHI%3d&risl=&pid=ImgRaw&r=0',
                            'Electronics'),
                        ItemCategory(
                            'https://th.bing.com/th/id/R.67ae33bc74d82c394c58f5e5f90eca83?rik=OumNmapXhjzfyg&pid=ImgRaw&r=0',
                            'Clothes'),
                        ItemCategory(
                            'https://th.bing.com/th/id/R.2d731fd06e34034284c1389640303c27?rik=p8JSYKqXHWqp3w&pid=ImgRaw&r=0',
                            'Food'),
                        ItemCategory(
                            'https://i2.wp.com/apprendreamangersainement.com/wp-content/uploads/2017/10/banana.png?fit=640%2C537',
                            'Toys'),
                        ItemCategory(
                            'https://th.bing.com/th/id/R.44b46b61e1479f7e643a85fbc070cefc?rik=N6b1LmsDLYr5YQ&pid=ImgRaw&r=0',
                            'Beauty'),
                        ItemCategory(
                            'https://th.bing.com/th/id/R.a961ed692e870fa53331d70ca2427abd?rik=XxmHcGPcbiJqiA&pid=ImgRaw&r=0',
                            'Suits'),
                        ItemCategory(
                            'https://th.bing.com/th/id/R.e7cbc8e7fd5e55bd43292b0c21b4336d?rik=V9qJG54Mzkm5Iw&riu=http%3a%2f%2fmiam-images.m.i.pic.centerblog.net%2fo%2fc95be4ec.png&ehk=0zzL7NCedk30TRgesL3w1C64kZp8OMO2i7a4mFpazjE%3d&risl=&pid=ImgRaw&r=0',
                            'Kitchen'),
                      ]),
                ],
              ),
            ),
          ));
        });
  }
}
