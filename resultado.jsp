<%-- 
    Document   : resultado
    Created on : 2/12/2018, 12:28:44 PM
    Author     : brenda
--%>

<%@page import="java.util.*"%>
<%@page import="modelo.Gramatica"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            //todo esto es el funcionamiento del programa lo que se conoce como scriplet: codigo java en html5)
  
                //rescatando el objeto gramatica
              Gramatica gramatica=(Gramatica)request.getAttribute("gramatica");//se hace un casteo explicito para que reconoczca el objeto gramtica
              String producciones=gramatica.getGramatica();//el metodo get guarda la gramatica, y esta se almacena en un objeto tipo string 
          
             ArrayList no_terminales= new ArrayList();   //lista que contiene los elementos no terminales
             ArrayList terminales = new ArrayList(); //lista que contiene los elementos terminales
           //HashSet es un tipo de Array que no admite elementos repetidos
            // Set<String> hs1 = new HashSet<>();
               
          for(int a=0; a<producciones.length();a++){
              
           if(producciones.charAt(a)>=65 && producciones.charAt(a)<=90){//va comparando el ASCII de los caracteres 
               no_terminales.add(producciones.charAt(a));//agrega los elementos a la lista de terminales en caso de ser letras minusculas 
           }   
           if(producciones.charAt(a)>=97 && producciones.charAt(a)<=122){//va com parando el ASCII de los caracteres 
              terminales.add(producciones.charAt(a));
               
           }
           if (producciones.charAt(a)==64){//toma el caracter ASCII 64 
               terminales.add(producciones.charAt(a));//agrega el caracter @ que es simbolo vacio a terminales
           
           }
          
         Set<String> hs = new HashSet<String>(); 
         hs.addAll(no_terminales);//elimina los  no terminales que esten repetidos
         no_terminales.clear();
        no_terminales.addAll(hs);
        
         Set<String> hs1 = new HashSet<String>(); 
        hs1.addAll(terminales);//elimina los terminales que esten repetidos
        terminales.clear();
        terminales.addAll(hs1);

              
        } 
          
           out.println("<h1>ESTAS SON LAS PRODUCCIONES INICIALES</h1><br>"+producciones);
           out.println("<h1>no terminales</h1><br>"+no_terminales.toString());
           out.println("<h1>terminales</h1><br>"+terminales.toString());
           
           



            %>
    </body>
</html>
