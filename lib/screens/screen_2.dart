import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:test_prj/providers/base_items_provider.dart';
import '../providers/horizontal_items.dart';
import '../providers/vertical_items.dart';

class Screen2 extends StatelessWidget {
   const Screen2({Key key}) : super(key: key);

  static const routeName = '/screen_2';
  static const textStyle1 = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 20,
  );
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          actions:  [
            IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ],
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
          const Padding(
             padding:  EdgeInsets.all(8.0),
             child: Text(
                'Section 1 (2)',
                style: textStyle1,
              ),
           ),
            const SizedBox(height: 10),

            _horizontal(context),
            const Padding(
              padding:  EdgeInsets.all(8.0),
              child: Text(
                'Section 2 (4)',
                style: textStyle1,
              ),
            ),
            _vertical(context),
          ],
        )),
      ),
    );
  }

  Widget _vertical(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        itemCount: Provider.of<HorizontalItemsProvider>(context).itemsCount,
        itemBuilder: (context, index) {
          var counter = Provider.of<VerticalItemsProvider>(
            context,
          ).generateItemAt(index);
          return _item(counter);
        });
  }

  Widget _item(String counter) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0),
      child: Card(
          elevation: 6,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Container(
              width: 150,
              height: 100,
              child: Center(
                child: Text('$counter', style: textStyle1,),
              ))),
    );
  }

  Widget _horizontal(BuildContext context) {
    return SizedBox(
      height: 100.0,
      width: double.infinity,
      child: Center(
        child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            itemCount: Provider.of<HorizontalItemsProvider>(context).itemsCount,
            itemBuilder: (context, index) {
              var counter = Provider.of<HorizontalItemsProvider>(
                context,
              ).generateItemAt(index);
              return _item(counter);
            }),
      ),
    );
  }
}
