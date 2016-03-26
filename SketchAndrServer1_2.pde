import java.net.HttpURLConnection;
import java.io.*;
import java.net.*;

String data;
String[] list={""};
String str="";
int MX=0, MY=0;
void setup(){

}
void draw(){
    if(mousePressed){
     //noStroke();
     fill(255,0,0);
     line(mouseX,mouseY,pmouseX,pmouseY);
     noFill();
     str = str(mouseX)+" "+str(mouseY)+" "+str(pmouseX)+" "+str(pmouseY);
     //list=append(list,str);
     list[0]=str;
     saveStrings("Data.txt", list); 
     write_file();
  }
}

void write_file(){
  try{
        URL oracle = new URL("http://192.168.0.114/index.php?x="+mouseX+"&y="+mouseY+"&px="+pmouseX+"&py="+pmouseY);
        BufferedReader in = new BufferedReader(
        new InputStreamReader(oracle.openStream()));
        in.close();
  } catch (Exception e){
    println(e);
      text("Error",300,300);
  }
}