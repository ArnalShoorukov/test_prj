import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Screen1 extends StatelessWidget {
  const Screen1({Key key}) : super(key: key);

  static const routeName = '/screen_1';
  static const textValue =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis convallis justo non nisi placerat maximus. Praesent tincidunt ut dui fermentum aliquam. Donec nec sodales mi. Proin ultrices dignissim ullamcorper. Nam eu consectetur nunc. Vivamus facilisis fermentum varius. Integer rutrum, ligula ac tempus maximus, erat justo molestie mauris, tempor porta tellus elit egestas ante. Proin ac leo quis felis posuere dapibus id et felis. Aenean id mattis nulla. Sed at nibh et tortor tempor malesuada. Quisque egestas urna tellus, in tristique risus ultricies laoreet. Donec fringilla, est non dapibus tempor, nulla metus lacinia arcu, at mattis ex dui nec massa. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Cras consequat id purus consectetur malesuada \n\n Vestibulum eu varius orci. Nunc ornare neque sit amet volutpat tempus. Aenean et magna nisl. Integer ornare nulla eget odio rutrum tincidunt. Proin imperdiet in sapien id euismod. Sed interdum enim non euismod pulvinar. Quisque imperdiet eros lectus, vel tempus nibh tristique eu. Pellentesque nisi ex, fringilla varius nibh et, porta mollis sapien. Donec quis pulvinar nulla. In tempor a massa et venenatis. Pellentesque scelerisque tempus tellus at venenatis. Aliquam sed nunc vel purus ultrices porttitor pharetra fringilla arcu \n\nVestibulum ut dui id quam feugiat viverra at ut dui. Ut placerat consequat iaculis. Fusce at urna quis libero vulputate sollicitudin et maximus est. Pellentesque in massa id enim laoreet vehicula nec eu velit. Aliquam vestibulum dolor eu felis feugiat bibendum. Praesent maximus rhoncus elit in finibus. Interdum et malesuada fames ac ante ipsum primis in faucibus.';


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Colors.grey,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(100),
            child: AppBar(
              backgroundColor: Colors.white,
              flexibleSpace: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    children: const [
                      SizedBox(height: 4),
                      Text(
                        'Title',
                        style: TextStyle(
                            fontSize: 28, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 4),
                      Text(
                        'Lorem ipsum dolor sit amet, '
                        'consectetur adipiscing elit. '
                        '\n Duis convallis justo non nisi placerat maximus.',
                        style: TextStyle(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
              actions:  [
                IconButton(
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    }
                ),
              ],
            ),
          ),
          body: CupertinoScrollbar(
              child: ListView.builder(
            itemCount: 50,
            itemBuilder: (context, index) => const ListTile(
              title: Text(
                textValue,
                style: TextStyle(fontSize: 28),
              ),
            ),
          )),
          bottomNavigationBar: Container(
            height: 100,
            decoration: const BoxDecoration(color: Colors.white),
            child: Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  primary: Colors.purple,
                  onSurface: Colors.grey,
                  side: const BorderSide(color: Colors.black, width: 1),
                  elevation: 20,
                  minimumSize: const Size(150, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: () {},
                child: const Text('TEST BUTTON'),
              ),
            ),
          ),
        ));
  }
}

class SliverMultilineAppBar extends StatelessWidget {
   SliverMultilineAppBar({this.title, this.leading, this.actions});

  final String title;
  final Widget leading;
  final List<Widget> actions;


  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);

    var availableWidth = mediaQuery.size.width - 160;
    if (actions != null) {
      availableWidth -= 32 * actions.length;
    }
    if (leading != null) {
      availableWidth -= 32;
    }
    return SliverAppBar(
      expandedHeight: 120.0,
      forceElevated: true,
      leading: leading,
      centerTitle: true,
      backgroundColor: Colors.white,
      actions: actions,
      flexibleSpace: FlexibleSpaceBar(
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: availableWidth,
          ),
          child: Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Center(
              child: Text(
                title,
                style: const TextStyle(
                    color: Colors.black, fontWeight: FontWeight.bold),
                textScaleFactor: .8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
