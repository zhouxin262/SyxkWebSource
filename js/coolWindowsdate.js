
var bMoveable=true; 
var _VersionInfo="�޸���:���˲���;MAIL: xhunanpp@hotmail.com" ;
//==================================================== WEB ҳ����ʾ���� ===================================================== 
var strFrame;        //����������HTML���� 
document.writeln('<iframe id=meizzDateLayer Author=wayx frameborder=0 style="position: absolute; width: 144; height: 28; z-index: 9998; display: none"></iframe>'); 
strFrame='<style>'; 
strFrame+='INPUT.button{BORDER-RIGHT: #ff9900 1px solid;BORDER-TOP: #ff9900 1px solid;BORDER-LEFT: #ff9900 1px solid;'; 
strFrame+='BORDER-BOTTOM: #ff9900 1px solid;BACKGROUND-COLOR: #fff8ec;font-family:����;}'; 
strFrame+='TD{FONT-SIZE: 9pt;font-family:����;}'; 
strFrame+='</style>'; 
strFrame+='<scr' + 'ipt>'; 
strFrame+='var datelayerx,datelayery;    /*��������ؼ������λ��*/'; 
strFrame+='var bDrag;    /*����Ƿ�ʼ�϶�*/'; 
strFrame+='function document.onmousemove()    /*������ƶ��¼��У������ʼ�϶����������ƶ�����*/'; 
strFrame+='{if(bDrag && window.event.button==1)'; 
strFrame+='    {var DateLayer=parent.document.all.meizzDateLayer.style;'; 
strFrame+='        DateLayer.posLeft += window.event.clientX-datelayerx;/*����ÿ���ƶ��Ժ����λ�ö��ָ�Ϊ��ʼ��λ�ã����д����div�в�ͬ*/'; 
strFrame+='        DateLayer.posTop += window.event.clientY-datelayery;}}'; 
strFrame+='function DragStart()        /*��ʼ�����϶�*/'; 
strFrame+='{var DateLayer=parent.document.all.meizzDateLayer.style;'; 
strFrame+='    datelayerx=window.event.clientX;'; 
strFrame+='    datelayery=window.event.clientY;'; 
strFrame+='    bDrag=true;}'; 
strFrame+='function DragEnd(){        /*���������϶�*/'; 
strFrame+='    bDrag=false;}'; 
strFrame+='</scr' + 'ipt>'; 
strFrame+='<div style="z-index:9999;position: absolute; left:0; top:0;" onselectstart="return false"><span id=tmpSelectYearLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 19;display: none"></span>'; 
strFrame+='<span id=tmpSelectMonthLayer Author=wayx style="z-index: 9999;position: absolute;top: 3; left: 78;display: none"></span>'; 
strFrame+='<table border=1 cellspacing=0 cellpadding=0 width=142 height=15 bordercolor=#ff9900 bgcolor=#ff9900 Author="wayx">'; 
strFrame+=' <tr Author="wayx"><td width=142 height=23 Author="wayx" bgcolor=#FFFFFF><table border=0 cellspacing=1 cellpadding=0 width=140 Author="wayx" height=23>'; 
strFrame+=' <tr align=center Author="wayx"><td width=16 align=center bgcolor=#ff9900 style="font-size:12px;cursor: hand;color: #ffffff" '; 
strFrame+=' onclick="parent.meizzPrevM()" title="��ǰ�� 1 ��" Author=meizz><b Author=meizz>&lt;</b>'; 
strFrame+=' </td><td width=60 align=center style="font-size:12px;cursor:default" Author=meizz '; 
strFrame+='onmouseover="style.backgroundColor=\'#FFD700\'" onmouseout="style.backgroundColor=\'white\'" '; 
strFrame+='onclick="parent.tmpSelectYearInnerHTML(this.innerText.substring(0,4))" title="�������ѡ�����"><span Author=meizz id=meizzYearHead></span></td>'; 
strFrame+='<td width=48 align=center style="font-size:12px;cursor:default" Author=meizz onmouseover="style.backgroundColor=\'#FFD700\'" '; 
strFrame+=' onmouseout="style.backgroundColor=\'white\'" onclick="parent.tmpSelectMonthInnerHTML(this.innerText.length==3?this.innerText.substring(0,1):this.innerText.substring(0,2))"'; 
strFrame+=' title="�������ѡ���·�"><span id=meizzMonthHead Author=meizz></span></td>'; 
strFrame+=' <td width=16 bgcolor=#ff9900 align=center style="font-size:12px;cursor: hand;color: #ffffff" '; 
strFrame+=' onclick="parent.meizzNextM()" title="��� 1 ��" Author=meizz><b Author=meizz>&gt;</td></tr>'; 
strFrame+=' </table>'; 

window.frames.meizzDateLayer.document.writeln(strFrame); 
window.frames.meizzDateLayer.document.close();        //���ie������������������ 
var meizzTheYear=new Date().getFullYear(); //������ı����ĳ�ʼֵ 
var meizzTheMonth=new Date().getMonth()+1; //�����µı����ĳ�ʼֵ 
var meizzWDay=new Array(39); //����д���ڵ����� 

function meizzWriteHead(yy,mm) //�� head ��д�뵱ǰ�������� 
{ 
    odatelayer.meizzYearHead.innerText = yy + " ��"; 
odatelayer.meizzMonthHead.innerText = mm + " ��"; 
} 
var outObject; 
var outButton;        //����İ�ť 
var outDate="";        //��Ŷ�������� 
var odatelayer=window.frames.meizzDateLayer.document.all;        //����������� 

function setday(tt,obj) //�������� 
{ 

      var dads = document.all.meizzDateLayer.style; 
    var th = tt; 
    var ttop = tt.offsetTop; //TT�ؼ��Ķ�λ��� 
    var thei = tt.clientHeight; //TT�ؼ�����ĸ� 
    var tleft = tt.offsetLeft; //TT�ؼ��Ķ�λ��� 
    var ttyp = tt.type; //TT�ؼ������� 
    while (tt = tt.offsetParent){ttop+=tt.offsetTop; tleft+=tt.offsetLeft;} 
    dads.top = (ttyp=="image")? ttop+thei : ttop+thei+6; 
    dads.left = tleft; 
    outObject = (arguments.length == 1) ? th : obj; 
    outButton = (arguments.length == 1) ? null : th;    //�趨�ⲿ����İ�ť 
     //���ݵ�ǰ������������ʾ���������� 
    var reg = /^(\d+)-(\d{1,2})-(\d{1,2})$/; 
    var r = outObject.value.match(reg); 
    if(r!=null){ 
        r[2]=r[2]-1; 
        var d= new Date(r[1], r[2],r[3]); 
        if(d.getFullYear()==r[1] && d.getMonth()==r[2] && d.getDate()==r[3]){ 
            outDate=d;        //�����ⲿ��������� 
        } 
        else outDate=""; 
            meizzSetDay(r[1],r[2]+1); 
    } 
    else{ 
        outDate=""; 
        meizzSetDay(new Date().getFullYear(), new Date().getMonth() + 1); 
    } 

dads.display = ''; 
   


}
function meizzPrevY() //��ǰ�� Year 
{ 
if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear--;} 
else{alert("��ݳ�����Χ��1000-9999����");} 
meizzSetDay(meizzTheYear,meizzTheMonth); 
} 
function meizzNextY() //���� Year 
{ 
if(meizzTheYear > 999 && meizzTheYear <10000){meizzTheYear++;} 
else{alert("��ݳ�����Χ��1000-9999����");} 
meizzSetDay(meizzTheYear,meizzTheMonth); 
} 
function meizzPrevM() //��ǰ���·� 
{ 
if(meizzTheMonth>1){meizzTheMonth--}else{meizzTheYear--;meizzTheMonth=12;} 
meizzSetDay(meizzTheYear,meizzTheMonth); 
} 
function meizzNextM() //�����·� 
{ 
if(meizzTheMonth==12){meizzTheYear++;meizzTheMonth=1}else{meizzTheMonth++} 
meizzSetDay(meizzTheYear,meizzTheMonth); 
} 

function tmpSelectYearInnerHTML(strYear) //��ݵ������� 
{ 
if (strYear.match(/\D/)!=null){alert("�����������������֣�");return;} 
var m = (strYear) ? strYear : new Date().getFullYear(); 
if (m < 1000 || m > 9999) {alert("���ֵ���� 1000 �� 9999 ֮�䣡");return;} 
var n = m - 10; 
if (n < 1000) n = 1000; 
if (n + 26 > 9999) n = 9974; 
var s = "<select Author=meizz name=tmpSelectYear style='font-size: 12px' " 
s += "onblur='document.all.tmpSelectYearLayer.style.display=\"none\"' " 
s += "onchange='document.all.tmpSelectYearLayer.style.display=\"none\";" 
s += "parent.meizzTheYear = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n"; 
var selectInnerHTML = s; 
for (var i = n; i < n + 26; i++) 
{ 
if (i == m) 
{selectInnerHTML += "<option Author=wayx value='" + i + "' selected>" + i + "��" + "</option>\r\n";} 
else {selectInnerHTML += "<option Author=wayx value='" + i + "'>" + i + "��" + "</option>\r\n";} 
} 
selectInnerHTML += "</select>"; 
odatelayer.tmpSelectYearLayer.style.display=""; 
odatelayer.tmpSelectYearLayer.innerHTML = selectInnerHTML; 
odatelayer.tmpSelectYear.focus(); 
} 

function tmpSelectMonthInnerHTML(strMonth) //�·ݵ������� 
{ 
if (strMonth.match(/\D/)!=null){alert("�·���������������֣�");return;} 
var m = (strMonth) ? strMonth : new Date().getMonth() + 1; 
var s = "<select Author=meizz name=tmpSelectMonth style='font-size: 12px' " 
s += "onblur='document.all.tmpSelectMonthLayer.style.display=\"none\"' " 
s += "onchange='document.all.tmpSelectMonthLayer.style.display=\"none\";" 
s += "parent.meizzTheMonth = this.value; parent.meizzSetDay(parent.meizzTheYear,parent.meizzTheMonth)'>\r\n"; 
var selectInnerHTML = s; 
for (var i = 1; i < 13; i++) 
{ 
if (i == m) 
{selectInnerHTML += "<option Author=wayx value='"+i+"' selected>"+i+"��"+"</option>\r\n";} 
else {selectInnerHTML += "<option Author=wayx value='"+i+"'>"+i+"��"+"</option>\r\n";} 
} 
selectInnerHTML += "</select>"; 
odatelayer.tmpSelectMonthLayer.style.display=""; 
odatelayer.tmpSelectMonthLayer.innerHTML = selectInnerHTML; 
odatelayer.tmpSelectMonth.focus(); 
} 

function closeLayer() //�����Ĺر� 
{ 
document.all.meizzDateLayer.style.display="none"; 
} 



function meizzSetDay(yy,mm) //��Ҫ��д����********** 
{ 
meizzWriteHead(yy,mm); 
//���õ�ǰ���µĹ�������Ϊ����ֵ 
meizzTheYear=yy; 
meizzTheMonth=mm; 
 outObject.value=yy + "-" + mm;
  } 


function meizzToday() //Today Button 
{ 
    var today; 
meizzTheYear = new Date().getFullYear(); 
meizzTheMonth = new Date().getMonth()+1; 
today=new Date().getDate(); 
//meizzSetDay(meizzTheYear,meizzTheMonth); 
if(outObject){ 
        outObject.value=meizzTheYear + "-" + meizzTheMonth; 
} 
closeLayer(); 
} 
function document.onclick() //������ʱ�رոÿؼ�    //ie6�����������������л����㴦����� 
{ 
with(window.event) 
{ if (srcElement.getAttribute("Author")==null && srcElement != outObject && srcElement != outButton) 
closeLayer(); 
} 
} 
