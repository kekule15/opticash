
import 'package:opticash/style/appColors.dart';
import 'package:flutter/material.dart';


class TopRightRPSCustomPainter extends CustomPainter{
  
  TopRightRPSCustomPainter({this.color});
  final Color? color;
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = color ?? AppColors.gray.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.5327333,0);
    path0.lineTo(size.width,0);
    path0.quadraticBezierTo(size.width*1.0472167,size.height*0.1202857,size.width,size.height*0.2087571);
    path0.quadraticBezierTo(size.width*0.8553333,size.height*0.2513714,size.width*0.5327333,0);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}




class RPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = AppColors.gray4
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(size.width*0.6133167,0);
    path0.quadraticBezierTo(size.width*0.9033292,0,size.width,0);
    path0.cubicTo(size.width,size.height*0.0361929,size.width*0.9999938,size.height*0.1103786,size.width*0.9999917,size.height*0.1471714);
    path0.cubicTo(size.width*0.9739083,size.height*0.2185571,size.width*0.8355083,size.height*0.1563143,size.width*0.8010583,size.height*0.0895143);
    path0.quadraticBezierTo(size.width*0.8618167,size.height*0.0458857,size.width*0.9328333,size.height*0.1438429);
    path0.quadraticBezierTo(size.width*0.8723021,size.height*0.1424071,size.width*0.8521250,size.height*0.1419286);
    path0.quadraticBezierTo(size.width*0.8461771,size.height*0.1393036,size.width*0.8283333,size.height*0.1314286);
    path0.lineTo(size.width*0.8466667,size.height*0.1414286);
    path0.lineTo(size.width*0.8466667,size.height*0.1414286);
    path0.lineTo(size.width*0.8699917,size.height*0.1552571);

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}




class BottomLeftRPSCustomPainter extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  Paint paint0 = Paint()
      ..color = AppColors.gray.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = 1;
     
         
    Path path0 = Path();
    path0.moveTo(0,0);
    path0.lineTo(0,size.height);
    path0.quadraticBezierTo(size.width*0.1983375,size.height,size.width*0.2644500,size.height);
    path0.quadraticBezierTo(size.width*0.0927583,size.height*0.8024286,0,0);
    path0.close();

    canvas.drawPath(path0, paint0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

class StripeCustomPainter extends CustomPainter {
  StripeCustomPainter({required this.color});
  final Color color;
  @override
  void paint(Canvas canvas, Size size) {
    Path firstPath = Path();
    firstPath.moveTo(size.width * 0.6132767, 0);
    firstPath.lineTo(size.width * 0.9663616, 0);
    firstPath.lineTo(size.width * 0.8819277, size.height * 0.9999948);
    firstPath.lineTo(size.width * 0.5810409, size.height * 0.9999948);
    firstPath.lineTo(size.width * 0.6132767, 0);
    firstPath.close();

    Paint firstPathFill = Paint()..style = PaintingStyle.fill;
    firstPathFill.color = color;
    canvas.drawPath(firstPath, firstPathFill);

    Path secondPath = Path();
    secondPath.moveTo(size.width * 0.4787201, 0);
    secondPath.lineTo(size.width * 0.8318050, 0);
    secondPath.lineTo(size.width * 0.7473711, size.height * 0.9999948);
    secondPath.lineTo(size.width * 0.4464843, size.height * 0.9999948);
    secondPath.lineTo(size.width * 0.4787201, 0);
    secondPath.close();

    Paint secondPathFill = Paint()..style = PaintingStyle.fill;
    secondPathFill.color = Colors.white.withOpacity(0.3);
    canvas.drawPath(secondPath, secondPathFill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

class RPSCustomPainterNew extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paintFill0 = Paint()
      ..color = AppColors.gray.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*-0.0008333,size.height*0.3600000);
    path_0.lineTo(size.width*-0.0030333,size.height*0.9995000);
    path_0.lineTo(size.width*0.8327417,size.height*1.0014000);
    path_0.lineTo(size.width*0.8334083,size.height*0.7797286);
    path_0.lineTo(size.width*0.3358250,size.height*0.2162571);
    path_0.lineTo(0,size.height*-0.1545000);

    canvas.drawPath(path_0, paintFill0);
  

  // Layer 1
  
  Paint paintStroke0 = Paint()
      ..color = AppColors.gray.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paintStroke0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}


class WalletStripeColor extends CustomPainter{
  
  @override
  void paint(Canvas canvas, Size size) {
    
    

  // Layer 1
  
  Paint paintFill0 = Paint()
      ..color = AppColors.gray4.withOpacity(0.1)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    Path path_0 = Path();
    path_0.moveTo(size.width*0.0114250,size.height*-0.0038143);
    path_0.lineTo(size.width*0.6680583,size.height*1.0019000);
    path_0.lineTo(size.width*1.0008250,size.height*0.9990429);
    path_0.lineTo(size.width*0.7498667,size.height*-0.0028857);

    canvas.drawPath(path_0, paintFill0);
  

  // Layer 1
  
  Paint paintStroke0 = Paint()
      ..color = AppColors.gray4.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width*0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;
     
         
    
    canvas.drawPath(path_0, paintStroke0);
  
    
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
  
}

