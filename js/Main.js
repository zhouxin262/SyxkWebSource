// Code in 2007.1
var
// ��ȡԪ��
$ = function(elementId){
	if(elementId == null) return false;
	return document.getElementById(elementId);
},
// �����ַ�����Сд
LcStr = function(Str) {
	if(Str == null) return false;
	return Str.toLowerCase();
},
// �������(������)
Print = function(Msg) {
	$("message").innerHTML += Msg +"<br />";
},
// �ж������
brower = function() {
	var ua = LcStr(navigator.userAgent);
	var os = new Object();
	os.isFirefox = ua.indexOf ("gecko") != -1;
	os.isOpera = ua.indexOf ("opera") != -1;
	os.isIE = !os.isOpera && ua.indexOf ("msie") != -1;
	return os;
},
// ��ȡҳ���С
getPageSize = function() {
	var xScroll, yScroll; 
	if (window.innerHeight && window.scrollMaxY) { 
		xScroll = document.body.scrollWidth;
		yScroll = window.innerHeight + window.scrollMaxY;
	} else if (document.body.scrollHeight > document.body.offsetHeight){ // all but Explorer Mac
		xScroll = document.body.scrollWidth;
		yScroll = document.body.scrollHeight;
	} else { // Explorer Mac...would also work in Explorer 6 Strict, Mozilla and Safari
		xScroll = document.body.offsetWidth;
		yScroll = document.body.offsetHeight;
	} 
	var windowWidth, windowHeight;
	if (self.innerHeight) { // all except Explorer
		windowWidth = self.innerWidth;
		windowHeight = self.innerHeight;
	} else if (document.documentElement && document.documentElement.clientHeight) { // Explorer 6 Strict Mode
		windowWidth = document.documentElement.clientWidth;
		windowHeight = document.documentElement.clientHeight;
	} else if (document.body) { // other Explorers
		windowWidth = document.body.clientWidth;
		windowHeight = document.body.clientHeight;
	}  
	// for small pages with total height less then height of the viewport
	if(yScroll < windowHeight){
		pageHeight = windowHeight;
	} else { 
		pageHeight = yScroll;
	}
	// for small pages with total width less then width of the viewport
	if(xScroll < windowWidth){ 
		pageWidth = windowWidth;
	} else {
		pageWidth = xScroll;
	}
	arrayPageSize = new Array(pageWidth,pageHeight,windowWidth,windowHeight);
	return arrayPageSize;
},
// ��ȡҳ�����λ��
getPageScroll = function() {
	var XScroll,yScroll;
	if (self.pageXOffset) {
	XScroll = self.pageXOffset;
	} else if (document.documentElement && document.documentElement.scrollLeft){  // Explorer 6 Strict
	XScroll = document.documentElement.scrollLeft;
	} else if (document.body) {// all other Explorers
	XScroll = document.body.scrollLeft;
	}
	if (self.pageYOffset) {
	yScroll = self.pageYOffset;
	} else if (document.documentElement && document.documentElement.scrollTop){  // Explorer 6 Strict
	yScroll = document.documentElement.scrollTop;
	} else if (document.body) {// all other Explorers
	yScroll = document.body.scrollTop;
	}
	arrayPageScroll = new Array(XScroll,yScroll);
	return arrayPageScroll;
},

/*

��̨���Ӧ��

*/
oHome		= "main.aspx",
sName		= "ʵ��ѡ��ϵͳ����ϵͳ",
iFrame		= null,
oFrame		= null,
prevMenu	= null,
prevMMenu	= null,
screenWidth	= window.screen.width,
pageSize	= null,
wResizeEnd	= true,
resizeTime	= null,
Menus		= new Object(),
// ��ʼ��
init = function() {
	if(window != top) {
		top.location.replace(self.location);
		return false;
	}
	// ��ʼ���˵��б�
	Menus = {
		"ϵͳ����" :	{"row" : 1, "show" : true, "menu" : {"ʵ�����ά��" : "sy_lb.aspx", "ʵ������ά��" : "sy_lx.aspx", "ʵ��Ҫ��ά��" : "sy_yq.aspx", "ʵ��������ά��" : "sys_lx.aspx", "ѧ�����ά��" : "xs_lb.aspx", "��ʦ���ά��" : "js_lb.aspx", "����Աά��" : "gly.aspx"}},
		"�γ̹���" :	{"row" : 1, "show" : true, "menu" : {"�༭�γ�" : "main.aspx", "��ӿγ�" : "main.aspx", "��������γ�" : "main.aspx"}},
		"ѧ������" :	{"row" : 1, "show" : true, "menu" : {"�༭ѧ����Ϣ" : "main.aspx", "���ѧ����Ϣ" : "main.aspx", "��������ѧ��" : "main.aspx"}},
		"��ʦ����" :	{"row" : 1, "show" : true, "menu" : {"�༭��ʦ��Ϣ" : "main.aspx", "��ӽ�ʦ��Ϣ" : "main.aspx", "���������ʦ" : "main.aspx"}},
		"ʵ������" :	{"row" : 1, "show" : true, "menu" : {"ʵ������" : "main.aspx","ʵ�����" : "main.aspx", "ʵ������" : "main.aspx", "ʵ��Ҫ��" : "main.aspx", "ʵ�������" : "main.aspx"}}
	};
	// ���ɲ���ʼ���˵�
	menu.create(Menus);
	menu.show("menu_1");
	menu.moduleMenu(null, "btnHome");
	// ��ʾ��ǰ����
	dateTime.showObj = $("showDate");
	dateTime.show(true, true, false);
	// �������ҳָ��
	iFrame = $("main_data");
	oFrame = iFrame.Document ? iFrame.Document : iFrame.contentDocument;
	//oFrame.location.replace(oHome);
	oFrame.location = oHome;
	// ���Opera���������˵��쳣
	if(brower().isOpera) $("center").parentNode.removeChild($("center"));
},
// ҳ��reSize���Ʋ���

reSize = function() {
	window.clearTimeout(resizeTime);
	var oHeight = $("top").clientHeight + $("main_toolbar").clientHeight + 1;
	var footheight = $("footer").clientHeight;
	var menuHeight = $("menuWarp").offsetHeight;
	pageSize = getPageSize();
	var minHeight = pageSize[3] - oHeight;
		minHeight = menuHeight > minHeight-footheight ? menuHeight : minHeight-footheight;
		minHeight = minHeight < 450 ? 450 : minHeight - 20;
	//Print(menuHeight +" : "+ (pageSize[3] - oHeight) +" : "+ (minHeight-footheight));
	
	// ��ȡ�����������ܿ��(Ϊ��ֹ��ܱ���,��СΪ1003)
	screenWidth = window.screen.width;
	if(pageSize[2]<1003 || screenWidth<1024){
		$("wrap").style.width = "1003px";
	}else{
		$("wrap").style.width = "";
	}
	
	iFrame = $("main_data");
	oFrame = iFrame.Document ? iFrame.Document : iFrame.contentDocument;
	// ������վ���⣬������˫����������������
	//oFrame.onkeydown = document.onkeydown = function(e) { keyDown(e);}
	oFrame.ondblclick = function(e) { fDblClick(e);}
	document.title = sName +" ["+ oFrame.title +"]";
	
	// ��ȡ�����ÿ������ҳ�߶�
	var oBodyHeight = iFrame.Document ? oFrame.body.scrollHeight : oFrame.body.offsetHeight;
	iFrame.style.height = oBodyHeight>minHeight ? oBodyHeight +"px" : minHeight +"px";
	wResizeEnd = true;
},
// �˵�
menu = {
	// ���ɲ˵�
	
	create : function(Menus) {
		if(typeof(Menus) != "object") return false;
		var mHtml = "";
		var row = true;
		var show = true;
		var sMenus = new Object();
		var i = 0, j;
		for(var m in Menus){
			row = Menus[m].row;		// ÿ�м���,�������
			show = Menus[m].show;	// �Ƿ���ʾ(��ʱ����)
			sMenus = Menus[m].menu;	// �˵����б�
			if(!show) continue;
			i++;
			j = 0;
			// ��ʼһ���µĲ˵���
			mHtml += "<div class=\"left_menu\" id=\"menu_"+ i +"\" menu=\""+ m +"\">\r\n"+
					 "	<div class=\"title toolbarBg\"><a href=\"javascript:void(0);\" onclick=\"menu.show('menu_"+ i +"');\"><span class=\"btnIco btnClose\"></span><span class=\"btnTxt\">"+ m +"</span></a></div>\r\n"+
					 "	<div class=\"link\" onclick=\"menu.moduleMenu(event, 'menu_"+ i +"');\">\r\n"+
					 "		<table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"3\">\r\n"+
					 "			<tr>\r\n";
			for(var sm in sMenus){
				if(row != 2){		// �Ƿ�������ʾ
					mHtml += "				<td><a href=\""+ sMenus[sm] +"\" target=\"main_data\">"+ sm +"</a></td>\r\n"+
							 "			</tr>\r\n"+
							 "			<tr>\r\n";
				}else if((j%2 == 0) && (row == 2)){
					mHtml += "				<td><a href=\""+ sMenus[sm] +"\" target=\"main_data\">"+ sm +"</a></td>\r\n";
				}else{
					mHtml += "				<td width=\"1\">|</td>\r\n"+
							 "				<td align=\"right\"><a href=\""+ sMenus[sm] +"\" target=\"main_data\">"+ sm +"</a></td>\r\n"+
							 "			</tr>\r\n"+
							 "			<tr>\r\n";
				}
				j++;
			}
			// ����˵����û����
			if((j%2 != 0) && (row == 2)){
				mHtml += "				<td width=\"1\">&nbsp;</td>\r\n"+
						 "				<td align=\"right\">&nbsp;</td>\r\n"+
						 "			</tr>\r\n"+
						 "			<tr>\r\n";
			}else if(j == 0){		// ����˵���Ϊ��
				mHtml += "				<td align=\"center\" height=\"50\">��ûȨ�޹���ð�飡</td>\r\n";
			}
			// �����˵���
			mHtml += "			</tr>\r\n"+
					 "		</table>\r\n"+
					 "	</div>\r\n"+
					 "</div>\r\n";
		}
		// ����˵�
		$("menuWarp").innerHTML = mHtml + $("menuWarp").innerHTML;
	},
	// ��ʾ���ز˵���
	show : function(menu) {
		if(prevMenu != null && prevMenu != menu) $(prevMenu).className = "left_menu";
		//$(menu).className = $(menu).className == "left_menu" ? "left_menu_open" : "left_menu";
		$(menu).className = "left_menu_open";
		prevMenu = menu;
	},
	// ����ģ�����˵�
	moduleMenu : function(e, cMenu) {
		if(e != null){
			e = e.target || e.srcElement;
			if(LcStr(e.tagName) != "a" || prevMMenu == cMenu) return false;
		}
		var mName = $(cMenu).getAttribute("menu");
		var sMenus = new Object();
		var tMenus = new Array();
		var mHtml = "";
		var i = 0;
		for(var m in Menus){
			// ���Ϊ��ǰ����˵���
			if(m == mName){
				sMenus = Menus[m].menu;
				// ����ģ�����
				$("manage_title").innerHTML = m;
				for(var sm in sMenus){
					tMenus[i] = "<a href=\""+ sMenus[sm] +"\" target=\"main_data\">"+ sm.replace(/[ ]/g, "") +"</a>";
					i++;
				}
				mHtml = tMenus.join("&nbsp;--&nbsp;");
				$("manage_menu").innerHTML = mHtml;
				break;
			}
		}
		prevMMenu = menu;
	},
	// ��ʾ����������в˵�
	showLeft : function() {
		if($("left").className == "left_close"){
			$("left").className = "left_border";
			$("main").className = "main_border";
			$("btnShowLeft").className = "sh_left_open";
			$("btnShowLeft").setAttribute("title", "������ർ���˵�");
		}else{
			$("left").className = "left_close";
			$("main").className = "";
			$("btnShowLeft").className = "sh_left";
			$("btnShowLeft").setAttribute("title", "��ʾ��ർ���˵�");
		}
	}
},
// �б�
list = {
	clickList : function(e) {
		e = e.target || e.srcElement;
		if(LcStr(e.tagName) == "input" && LcStr(e.type) == "checkbox" ){
			list.setListBg(e);
			return false;
		}
		
		if(LcStr(e.tagName) != "td") return false;
		
		var E = e.parentNode;
		if(LcStr(E.tagName) != "tr" || E.id == "Title") return false;
	
		var Is = E.getElementsByTagName("input")[0];
		Is.checked = Is.checked ? false : true;
		list.setListBg(Is);
	},
	setListBg : function(e) {
		e.parentNode.parentNode.style.cssText = e.checked ? "background-color: #FFFCD9;" : "";
	},
	selectAll : function(Form, SlName, Sort, SetBg) {
		//var El = Form.getElementsByTagName("input");
		var El = Form.elements;
		//��ѡ
		if(Sort == 3) {
			for (var i=0;i<El.length;i++) {
				var e = El[i];
				if(LcStr(e.tagName) == "input" && LcStr(e.type) == "checkbox" && e.name == SlName){
				//if(LcStr(e.tagName) == "input" && LcStr(e.type) == "checkbox"){
					e.checked = e.checked ? false : true;
					if(e.name == SlName && SetBg) list.setListBg(e);
				}
			}
			return false;
		}
		
		//ȫѡ,��ѡ
		for (var i=0;i<El.length;i++)
		{
			var e = El[i];
			if(LcStr(e.tagName) == "input" && LcStr(e.type) == "checkbox" && e.name == SlName){
			//if(LcStr(e.tagName) == "input" && LcStr(e.type) == "checkbox"){
				e.checked = Sort == 0 ? true : false;
				if(e.name == SlName && SetBg) list.setListBg(e);
			}
		}
	}

},
// �����¼�
dateTime = {
	now		: new Date(),
	showObj	: null,
	timer	: null,
	tInt	: null,
	date : function() {
		var nY = dateTime.now.getFullYear(), nM = dateTime.now.getMonth()+1, nD = dateTime.now.getDate();
		return (nY +"��"+ nM +"��"+ nD +"��");
	},
	week : function() {
		var day = dateTime.now.getDay();
		var wStr = null;
		switch(day){
			case 0 : wStr = "��"; break;
			case 1 : wStr = "һ"; break;
			case 2 : wStr = "��"; break;
			case 3 : wStr = "��"; break;
			case 4 : wStr = "��"; break;
			case 5 : wStr = "��"; break;
			case 6 : wStr = "��"; break;
		}
		wStr = "����"+ wStr;
		return wStr;
	},
	time : function() {
		var now = new Date();
		var nH = now.getHours(), nM = now.getMinutes(), nS = now.getSeconds();
		nH = nH > 10 ? nH : "0"+ nH;
		nM = nM > 10 ? nM : "0"+ nM;
		nS = nS > 10 ? nS : "0"+ nS;
		var tmpStr = null;
		var tInt = null;
		if(dateTime.timer == null){
			clearInterval(dateTime.tInt);
			tmpStr = "<span id=\"timer\">"+
					 nH +":"+ nM +":"+ nS +
					 "</span>";
			dateTime.timer = $("timer");
			dateTime.tInt = setInterval("dateTime.time()", 1000);
			return tmpStr;
		}else{
			tmpStr = nH +":"+ nM +":"+ nS;
			dateTime.timer.innerHTML = tmpStr;
		}
	},
	show : function(d, w, t) {
		if(dateTime.showObj == null){ return false;}
		var tnpStr = null;
		var tmpDate = new Array();
		tmpDate[0] = d ? dateTime.date() : null;
		tmpDate[1] = w ? dateTime.week() : null;
		tmpDate[2] = t ? dateTime.time() : null;
		tnpStr = tmpDate.join("&nbsp;");
		dateTime.showObj.innerHTML = tnpStr;
	}
},
keyDown = function(e) {
	e = e || event || iFrame.contentWindow.event;
	//alert(e.keyCode);
	//e.keyCode = 0;
	//e.returnValue = false;
	//return false;
},
fDblClick = function(e) {
	var E = e || iFrame.contentWindow.event;
	E = E.target || E.srcElement;
	var peTag = LcStr(E.parentNode.tagName);
	var eTag = LcStr(E.tagName);
	if((eTag == "html" || eTag == "body" || eTag == "td" || eTag == "div" || eTag == "span") && (eTag != "a" && peTag != "a")) menu.showLeft();
},
goUrl = function(Url) {
	oFrame.location = Url;
},
exit = function() {
	Print("�˳�ϵͳ...");
},
// ��ť����
goTo = function(e){
	//e = e.target || e.srcElement;
	//e = LcStr(e.tagName) == "a" ? e : e.parentNode;
	var eRel = LcStr(e.getAttribute("rel"));
	var eUrl = e.getAttribute("href");
	switch(eRel){
		case "siteinfo" :
			goUrl("Config_WebSite.asp");
			//menu.moduleMenu(event, menu_1);
			$("manage_title").innerHTML = "��վ����";
			$("manage_menu").innerHTML = "��վ����";
			break;
		case "userpanel" :
			goUrl("");
			break;
		case "message" :
			goUrl("");
			break;
		case "home" :
			goUrl("Admin_Main.asp");
			menu.moduleMenu(null, 'btnHome');
			$("manage_title").innerHTML = "��������Ϣ";
			$("manage_menu").innerHTML="��������Ϣ";
			break;
	    case "default" :
			goUrl("");
			menu.moduleMenu(null, 'btnHome');
			break;
		case "column":
		        goUrl("Config_Column.asp");
				//menu.moduleMenu(event, menu_2);
				$("manage_title").innerHTML = "��Ŀ����";
			    $("manage_menu").innerHTML="��Ŀ����";
			break;
		case "exit" :
			exit();
			break;
		case "showleft" :
			menu.showLeft();
			break;
		default :
			return false;
	}
};
