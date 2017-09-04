function detail(photoId) {
	
	
//	OpenWindow=window.open("", "newwin", "location=no,height=600px,width=900px,top=20px,left=40px,toolbar=no,scrollbars=scroll,menubar=no"); 
//	OpenWindow.document.write("<HTML>") 
//	OpenWindow.document.write("<TITLE>教师资格证</TITLE>") 
//	OpenWindow.document.write("<BODY BGCOLOR=#ffffff>") 
//	OpenWindow.document.write("<img style='width:100%;height:100%;' src='" + certificateUrl + "' alt='xxx' >") 
//	OpenWindow.document.write("</BODY>") 
//	OpenWindow.document.write("</HTML>") 
//	OpenWindow.document.close()

	OpenWindow=window.open("toPhotoManage.jspx?photoId=" + photoId, "newwin", "location=no,height=640px,width=430px,top=20px,left=40px,toolbar=no,scrollbars=scroll,menubar=no"); 
	OpenWindow.document.close()


//	pageii = layer.open( {
//		title : "详情",
//		type : 2,
//		area : [ "60%", "85%" ],
//		content : 'toPhotoManage.jspx?photoId='+photoId
//	})
}
