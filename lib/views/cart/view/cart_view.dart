import 'package:ecommerce/core/components/my_text_style_comp.dart';
import 'package:ecommerce/core/constants/colors_const.dart';
import 'package:ecommerce/core/widgets/cart_count_price_widget.dart';
import '../cubit/cart_cubit.dart' show CartCubit, CartState;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCartView extends StatelessWidget {
  const MyCartView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit(),
      child: Scaffold(
        body: BlocConsumer<CartCubit, CartState>(
          listener: (context, state) {},
          builder: (context, state) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 79.h),
                //App Bar
                Padding(
                  padding: EdgeInsets.only(left: 42.r, right: 46.r),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Back Button
                      InkWell(
                        borderRadius: BorderRadius.circular(10.r),
                        onTap: () => Navigator.pop(context),
                        child: Container(
                          height: 37.h,
                          width: 37.w,
                          decoration: BoxDecoration(
                            color: ColorsConst.color010035,
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.arrow_back_ios_rounded,
                            color: ColorsConst.colorWhite,
                          ),
                        ),
                      ),
                      //Auto Location
                      Row(
                        children: [
                          //Address
                          Text(
                            "Add address",
                            style: MyTextStyleComp.textStyle(
                              size: 15,
                              fontW: FontWeight.w500,
                            ),
                          ),
                          SizedBox(width: 9.w),
                          //Location
                          InkWell(
                            borderRadius: BorderRadius.circular(10.r),
                            onTap: () {},
                            child: Container(
                              height: 37.h,
                              width: 37.w,
                              decoration: BoxDecoration(
                                color: ColorsConst.colorFF6E4E,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              alignment: Alignment.center,
                              child: Icon(
                                Icons.location_on_outlined,
                                color: ColorsConst.colorWhite,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                //Text: My Cart
                Padding(
                  padding: EdgeInsets.only(top: 50.r, left: 42.r, bottom: 49.r),
                  child: Text(
                    "My Cart",
                    style: MyTextStyleComp.textStyle(
                      size: 35,
                      fontW: FontWeight.w700,
                    ),
                  ),
                ),
                // Product
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: ColorsConst.color010035,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.r),
                        topRight: Radius.circular(30.r),
                      ),
                    ),
                    child: const CartCountPriceWidget(),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
