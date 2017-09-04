function detail(certificateUrl) {
	
	OpenWindow=window.open("", "newwin", "location=no,height=600px,width=900px,top=20px,left=40px,toolbar=no,scrollbars=scroll,menubar=no"); 
	OpenWindow.document.write("<HTML>") 
	OpenWindow.document.write("<TITLE>教师资格证</TITLE>") 
	OpenWindow.document.write("<BODY BGCOLOR=#ffffff>") 
	OpenWindow.document.write("<img style='width:100%;height:100%;' src='" + certificateUrl + "' alt='xxx' >") 
	OpenWindow.document.write("</BODY>") 
	OpenWindow.document.write("</HTML>") 
	OpenWindow.document.close()
	
//	pageii = layer.open( {
//		title : "详情",
//		type : 2,
//		area : [ "50%", "90%" ],
//		maxmin: true,
//		content : [certificateUrl,'yes']
////    iframe: {
////        src : certificateUrl
////    } 
//	})
}
