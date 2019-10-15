import 'package:async_loader/async_loader.dart';
import 'package:flutter/material.dart';
import 'package:ux_navigation/page/info/page_info_course.dart';
import 'package:ux_navigation/page/page_stack.dart';

class PageLoader extends StatelessWidget {
  final data;

  PageLoader({this.data});

  @override
  Widget build(BuildContext context) {
    const TIMEOUT = const Duration(seconds: 1);

    getMessage(data) async {
      // return await PageInfoCourse(data: data);

      print('AAAAASSSSSSSSSSSSSSSSS');

      if (PageStack.exist(data.id)) {
        print('AAAAAAAAAAAAAAA');
        return await PageStack.page(data.id);
      } else {
        print('BBBBBBBBBBBBBBBBBBBBBBB');
        return Future.delayed(TIMEOUT, () {
          PageInfoCourse pageInfoCourse = PageInfoCourse(data: data);
          PageStack.registrer(data.id, pageInfoCourse);
          return pageInfoCourse;
        });
      }
      //return pageComponent;
      //return new Future.delayed(TIMEOUT, () => PageInfoCourse(data: data));
    }

// Asynchronous
    Future<Widget> createOrderMessage(data) async {
      return await getMessage(data);
    }

    return Container(
      color: Colors.black,
      child: Center(
        child: AsyncLoader(
          initState: () async => await createOrderMessage(this.data),
          renderLoad: () => CircularProgressIndicator(),
          renderError: ([error]) => Text('Sorry, there was an error loading your joke'),
          renderSuccess: ({data}) {
            return data;
          },
        ),
      ),
    );
  }
}
