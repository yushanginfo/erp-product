[@b.head/]
  [@b.grid items=schemeElements var="schemeElement"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("当前选择的记录中，可能存在子记录，若“删除”的话，将会一起删除？确认要继续吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="方案" property="scheme.name"/]
      [@b.col title="起始结束" property="startAt"]${schemeElement.startAt}~${schemeElement.endAt}[/@]
      [@b.col title="对应代码种类" property="codeCategory.name"/]
      [@b.col title="固定值" property="literal"/]
      [@b.col title="类型" property="expType.name"/]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "方案组成部分";
      });
    });
  </script>
[@b.foot/]