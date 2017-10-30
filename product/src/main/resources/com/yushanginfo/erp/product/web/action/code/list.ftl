[@b.head/]
  [@b.grid items=codes var="code"]
    [@b.gridbar]
      bar.addItem("${b.text("action.add")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("确认删除？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="代码值" property="code"/]
      [@b.col title="名称" property="name"/]
      [@b.col title="种类" property="category.name"]${code.category.name}(${code.category.code})[/@]
      [@b.col title="更新时间" property="updatedAt"]${code.updatedAt?string("yyyy-MM-dd HH:mm:ss")}[/@]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "代码";
      });
    });
  </script>
[@b.foot/]