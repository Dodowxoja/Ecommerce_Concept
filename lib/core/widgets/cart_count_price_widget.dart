import 'package:ecommerce/core/components/my_text_style_comp.dart';
import 'package:ecommerce/core/constants/colors_const.dart';
import 'package:ecommerce/mock/cart/cart_product_mock_data.dart';
import 'package:ecommerce/models/cart/cart_model.dart';
import 'package:ecommerce/service/cart/cart_get_data_service.dart';
import 'package:ecommerce/views/cart/cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartCountPriceWidget extends StatelessWidget {
  const CartCountPriceWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 473.h,
          width: MediaQuery.of(context).size.width.w,
          child: FutureBuilder(
            future: CartGetDataService.getData(),
            builder: (context, AsyncSnapshot<CartModel> snap) {
              if (!snap.hasData) {
                return const Center(
                    // child: CircularProgressIndicator.adaptive()
                    );
              } else if (snap.hasError) {
                return const Center(child: Text("Error"));
              } else {
                var data = snap.data!;
                return SizedBox(
                  height: MediaQuery.of(context).size.height.h,
                  width: MediaQuery.of(context).size.width.w,
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: EdgeInsets.fromLTRB(33.r, 34.r, 32.25.r, 0.r),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.only(
                          top: index == 0 ? 35.r : 0.r,
                          bottom: index == data.basket!.length - 1 ? 0 : 35.r,
                        ),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width.w,
                          height: 93.h,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Image
                              SizedBox(
                                height: 88.h,
                                width: 111.w,
                                child: Center(
                                  child: Container(
                                    height: 88.h,
                                    width: 88.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "${data.basket![index].images}",
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              //Product name and price
                              SizedBox(
                                width: 153.w,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Product name
                                    Text(
                                      "${data.basket![index].title}",
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: MyTextStyleComp.textStyle(
                                        color: ColorsConst.colorWhite,
                                        size: 20,
                                        fontW: FontWeight.w500,
                                        h: 1.23,
                                      ),
                                    ),
                                    // Product price
                                    Text(
                                      "\$${data.basket![index].price}",
                                      style: MyTextStyleComp.textStyle(
                                        color: ColorsConst.colorFF6E4E,
                                        fontW: FontWeight.w500,
                                        h: 1.23,
                                        size: 20,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Product count
                              Container(
                                height: 72.h,
                                width: 26.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(26.r),
                                  color: ColorsConst.color282843,
                                ),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //Remove
                                    InkWell(
                                      child: Icon(
                                        Icons.remove,
                                        color: ColorsConst.colorWhite,
                                        size: 16.sp,
                                      ),
                                      onTap: () {
                                        context
                                            .read<CartCubit>()
                                            .productCountRemove(index);
                                      },
                                    ),
                                    //Count
                                    Text(
                                      "${CartProductMockData.count[index]["count"]}",
                                      style: MyTextStyleComp.textStyle(
                                        size: 20,
                                        color: ColorsConst.colorWhite,
                                      ),
                                    ),
                                    //Add
                                    InkWell(
                                      child: Icon(
                                        Icons.add,
                                        color: ColorsConst.colorWhite,
                                        size: 16.sp,
                                      ),
                                      onTap: () {
                                        context
                                            .read<CartCubit>()
                                            .productCountAdd(index);
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 17.w),
                              InkWell(
                                child: Icon(Icons.delete,color: ColorsConst.color36364D,),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: data.basket!.length,
                  ),
                );
              }
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r),
          child: Divider(
            height: 2,
            color: ColorsConst.colorWhite.withOpacity(0.25),
          ),
        ),
        SizedBox(height: 15.h),
        //Price
        Padding(
          padding: EdgeInsets.only(left: 55.r, right: 35.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Total",
                    style: MyTextStyleComp.textStyle(
                      color: ColorsConst.colorWhite,
                    ),
                  ),
                  SizedBox(height: 12.h),
                  Text(
                    "Delivery",
                    style: MyTextStyleComp.textStyle(
                        color: ColorsConst.colorWhite),
                  ),
                ],
              ),
              SizedBox(
                height: 50.h,
                child: FutureBuilder(
                  future: CartGetDataService.getData(),
                  builder: (context, AsyncSnapshot<CartModel> snap) {
                    if (snap.hasData) {
                      var data = snap.data!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "\$${CartProductMockData.price["price"]} us", //data.total
                            style: MyTextStyleComp.textStyle(
                              color: ColorsConst.colorWhite,
                            ),
                          ),
                          SizedBox(height: 12.h),
                          Text(
                            "${data.delivery}",
                            style: MyTextStyleComp.textStyle(
                              color: ColorsConst.colorWhite,
                            ),
                          ),
                        ],
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15.h),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.r),
          child: Divider(color: ColorsConst.colorWhite.withOpacity(0.2)),
        ),
        SizedBox(height: 15.h),
        //Checkout
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 44.r),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: ColorsConst.colorFF6E4E,
                  fixedSize: Size(326.w, 56.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                ),
                onPressed: () {},
                child: Text(
                  "Checkout",
                  style: MyTextStyleComp.textStyle(
                    fontW: FontWeight.w700,
                    size: 20,
                    color: ColorsConst.colorWhite,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
