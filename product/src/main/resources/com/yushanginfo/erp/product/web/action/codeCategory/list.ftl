[@b.head/]
  [@b.grid items=codeCategories var="codeCategory"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("当前选择的记录中，可能存在子记录，若“删除”的话，将会一起删除？确认要继续吗？"));
    [/@]
    [@b.row]
      [@b.boxcol id="codeCategory.id"/]
      [@b.col title="编码" property="code"/]
      [@b.col title="名称" property="name"/]
      [@b.col title="更新时间" property="updatedAt"]${codeCategory.updatedAt?string("yyyy-MM-dd HH:mm:ss")}[/@]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "代码种类";
      });
    });
  </script>
[@b.foot/]