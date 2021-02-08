import 'package:flutter/material.dart';
import 'package:eninetour/data/tour.dart';

class BottomCard extends StatelessWidget {

  final Tours item;
  final bool isTrending;
  BottomCard(this.item, {this.isTrending = false});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
      child: Center(
        child: Container(
          width: double.infinity,
          height: 0.15 * height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: Theme.of(context).cardColor,
            boxShadow: [
              BoxShadow(
                  color: Colors.black38.withOpacity(0.1),
                  blurRadius: 10.0,
                  offset: Offset(0.0, 5.0),
                  spreadRadius: 2.0)
            ],
          ),
          child: Stack(
            children: <Widget>[
              _buildContents(context, height, width),
              Positioned(
                bottom: 0.03 * height,
                right: 0.03 * width,
                child: isTrending
                    ? Image.asset(
                  "assets/img/trending.png",
                  height: 20,
                  width: 20,
                )
                    : Container(),
              ),
              Positioned.fill(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10.0),
                    onTap: () {

                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

//? Split the build method into smaller components for better reading

  _buildContents(BuildContext context, var height, var width) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(
              top: 8.0, left: 8.0, bottom: 8.0, right: 20.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              height: 0.125 * height,
              width: 0.125 * height,
              child: Image.asset(
                'images/' + item.thumbImage + '.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        _buildTextAndUserWidget(context, width)
      ],
    );
  }

  _buildTextAndUserWidget(BuildContext context, var width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Spacer(),
        Container(
          width: 0.5 * width,
          child: Text(
            item.title,
            style: Theme.of(context).textTheme.headline6,
            overflow: TextOverflow.fade,
          ),
        ),
        Spacer(),
        Row(
          children: <Widget>[
            /* Padding(
              padding: const EdgeInsets.all(5.0),
              child: CircleAvatar(
                //  radius: 10, backgroundImage: NetworkImage(item.authorImage)
              ),
            ),
            Text(
              '저자',
              style: Theme.of(context).textTheme.subtitle1,
            ),*/
            SizedBox(
              width: 10.0,
            ),
          ],
        ),
        Spacer()
      ],
    );
  }
}