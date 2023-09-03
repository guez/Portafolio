import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:peliculas/src/models/pelicula_model.dart';


class CardSwiper extends StatelessWidget {
  //const CardSwiper({Key key}) : super(key: key);

  final List<Pelicula> peliculas;

  CardSwiper({@required this.peliculas});


  @override
  Widget build(BuildContext context) {

    final _screenSize = MediaQuery.of(context).size;


    return Container(
       width: double.infinity,
       height: 300.0,
       //padding: EdgeInsets.only(top: 10.0),
       child: new Swiper(         
         //Obtiene todo el alto hasta un 70%
         itemHeight: _screenSize.height * 0.5,
         //Obtiene todo el ancho hasta un 60%
         itemWidth: _screenSize.width * 0.5,
         layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context,int index){
            return ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage(peliculas[index].getPosterImg()),
                fit: BoxFit.cover,
                placeholder: AssetImage('assets/img/no-image.jpg'),
              ),
              
            );
          },
          itemCount: peliculas.length,
          //pagination: new SwiperPagination(),
          control: new SwiperControl(),
        ),
     );
  }
}