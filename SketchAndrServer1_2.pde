import java.net.HttpURLConnection;
import java.io.*;
import java.net.*;

String data;
String lines[];
String co_ord[];
String[] list={""};
String str="";
int MX=0, MY=0;
int stroke1 = 3;
int x=0, y=0, p=0, q=0, r=0, g=0, b=0, stroke=1;

void setup(){

}

  
void settings(){
  orientation(LANDSCAPE);
}
void draw(){
    if(mousePressed){
     //noStroke();
     strokeWeight(stroke);
     fill(255,0,0);
     line(mouseX,mouseY,pmouseX,pmouseY);
     //str = str(mouseX)+" "+str(mouseY)+" "+str(pmouseX)+" "+str(pmouseY);
     //list=append(list,str);
     //list[0]=str;
     //saveStrings("Data.txt", list); 
     write_file();
  }try{
  read_file();
  }catch(Exception e){
  }
}

void write_file(){
  try{
       // URL oracle = new URL("http://192.168.0.114/index.php?x="+mouseX+"&y="+mouseY+"&px="+pmouseX+"&py="+pmouseY+"&st="+stroke);
        URL oracle = new URL("http://"+Server.ip()+"/index.php?x="+mouseX+"&y="+mouseY+"&px="+pmouseX+"&py="+pmouseY+"&st="+stroke);

        BufferedReader in = new BufferedReader(
        new InputStreamReader(oracle.openStream()));
        in.close();
  } catch (Exception e){
    println(e);
      text("Error",300,300);
  }
}

void read_file(){
//  lines = loadStrings("http://192.168.0.114/Cata.txt");
    lines = loadStrings("http://"+Server.ip()+"/Cata.txt");

  //  lines = loadStrings("C:\\Users\\UCSC_UAV\\Documents\\Processing\\workspace\\SketchPadServer\\Data.txt");
  if(lines.length >= 1){
    for(int inc=0; inc < lines.length; inc++){
    co_ord = split(lines[inc],' ');
    if(co_ord.length == 8){
        stroke(255,0,255);
        x = int(co_ord[0]);
        y = int(co_ord[1]);
        p = int(co_ord[2]);
        q = int(co_ord[3]);
        r = int(co_ord[4]);
        g = int(co_ord[5]);
        b = int(co_ord[6]);
        stroke1 = int(co_ord[7]);
        strokeWeight(stroke1);
        stroke(r,g,b);
        line(x,y,p,q);
        println(stroke1);
    }
    }
  }
  
}