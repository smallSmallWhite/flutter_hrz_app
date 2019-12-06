import 'package:flutter/material.dart';
import 'package:flutter_app_hrzapp/MyColors.dart';

class Home extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() {
    return new _searchState();
  }


}

class _searchState extends State<Home>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: TextFileWidget(),
        actions: <Widget>[
          new Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Cancel",
              ),
            ),
          )
        ],
      ),
    );
  }

}

///搜索控件widget
class TextFileWidget extends StatelessWidget {
  Widget buildTextField() {
    //theme设置局部主题
    return TextField(
      cursorColor: MyColors.color_search_textColor, //设置光标
      decoration: InputDecoration(
        //输入框decoration属性
//            contentPadding: const EdgeInsets.symmetric(vertical: 1.0,horizontal: 1.0),
          contentPadding: new EdgeInsets.only(left: 0.0),
//            fillColor: Colors.white,
          border: InputBorder.none,
//            icon: Icon(Icons.search),
//            icon: ImageIcon(AssetImage("image/search_meeting_icon.png",),),
          icon: ImageIcon(
            AssetImage(
              "images/navigation_search_xi.png",
            ),
          ),
          hintText: "粘贴商品标题，领隐藏优惠券拿返利",

          hintStyle: new TextStyle(fontSize: 14, color: MyColors.color_search_textColor)),
      style: new TextStyle(fontSize: 14, color: MyColors.color_search_textColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget editView() {
      return Container(
        //修饰黑色背景与圆角
        decoration: new BoxDecoration(
          color: MyColors.color_search_background,
          borderRadius: new BorderRadius.all(new Radius.circular(15.0)),
        ),
        alignment: Alignment.center,
        height: 36,
        padding: EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
        child: buildTextField(),
      );
    }

    var cancleView = new Text("cancle");

    return editView();

  }
}

