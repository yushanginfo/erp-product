[@b.head/]
  [@b.grid items=schemes var="scheme"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("当前选择的记录中，可能存在子记录，若“删除”的话，将会一起删除？确认要继续吗？"));
    [/@]
    [@b.row]
      [@b.boxcol/]
      [@b.col title="名称" property="name"/]
      [@b.col title="产品种类" property="productCategory.name"]${scheme.productCategory.fullName}[/@]
      [@b.col title="使用时间段" property="beginOn"]${scheme.beginOn?string("yyyy-MM-dd")}至[#if scheme.endOn?exists]${scheme.endOn?string("yyyy-MM-dd")}[#else]今[/#if][/@]
      [@b.col title="更新时间" property="updatedAt"]${scheme.updatedAt?string("yyyy-MM-dd HH:mm:ss")}[/@]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "方案";
      });
    });
  </script>
[@b.foot/]