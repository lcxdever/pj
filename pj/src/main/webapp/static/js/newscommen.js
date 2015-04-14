function page(pageNum) {
	var action = basePath+"back/news/list?pageSize=10&pageNo=" + pageNum;
	var form = $("<form></form>")
	form.attr('action', action)
	form.attr('method', 'post')
	var input1 = $("<input type='hidden' name='type' />")
	input1.attr('value', newsType)
	form.append(input1)
	form.appendTo("body")
	form.css('display', 'none')
	form.submit()
}
function modify(id, name) {
	var action =  basePath+"back/news/query4modify";
	var form = $("<form></form>")
	form.attr('action', action)
	form.attr('method', 'post')
	var input1 = $("<input type='hidden' name='id' />")
	input1.attr('value', id)
	form.append(input1)
	form.appendTo("body")
	form.css('display', 'none')
	form.submit()
}
function del(id) {
	if (window.confirm("您确认要删除吗")) {
		var action =  basePath+"back/news/delete";
		var form = $("<form></form>")
		form.attr('action', action)
		form.attr('method', 'post')
		var input1 = $("<input type='hidden' name='id' />")
		input1.attr('value', id)
		form.append(input1)
		var input2 = $("<input type='hidden' name='type' />")
		input2.attr('value', newsType)
		form.append(input2)
		form.appendTo("body")
		form.css('display', 'none')
		form.submit()
	}
}