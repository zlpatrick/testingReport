﻿t<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="testcu.aspx.cs" Inherits="TestingReport.testcu" %>

<!DOCTYPE html>

<html>  
    <head>  
        <meta name="layout" content="main">  
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />    
        <script type="text/javascript" src="Scripts/jquery.1.11.js"></script>  
        <script type="text/javascript" src="http://html2canvas.hertzen.com/build/html2canvas.js"></script>  
           
        <script  type="text/javascript" >  
        $(document).ready( function(){  
                $(".example1").on("click", function(event) {  
                        event.preventDefault();  
                        html2canvas(document.body, {  
                        allowTaint: true,  
                        taintTest: false,  
                        onrendered: function(canvas) {  
                            canvas.id = "mycanvas";  
                            //document.body.appendChild(canvas);  
                            //生成base64图片数据  
                            var dataUrl = canvas.toDataURL();  
                            var newImg = document.createElement("img");  
                            newImg.src =  dataUrl;  
                            document.body.appendChild(newImg);  
                        }  
                    });  
                });   
               
        });  
           
        </script>  
    </head>  
    <body>  
           
        Hello!  
        <div class="" style="background-color: #abc;">  
            计算机天堂测试html5页面截图  
            <br>jsjtt.com  
        </div>  
           
        <textArea id="textArea" col="20" rows="10" ></textArea>  
        <input class="example1" type="button" value="生成截图">  
        生成界面如下：  
    </body>  
</html>  