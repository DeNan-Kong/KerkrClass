function detail(id) {
	pageii = layer.open( {
		title : "详情",
		type : 2,
		area : [ "60%", "85%" ],
		content : 'detailAnswer.jspx?groupId='+id
	})
}
