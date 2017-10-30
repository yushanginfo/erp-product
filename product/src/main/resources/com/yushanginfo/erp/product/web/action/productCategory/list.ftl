[@b.head/]
  [@b.grid items=productCategories var="productCategory"]
    [@b.gridbar]
      bar.addItem("${b.text("action.new")}", action.add());
      bar.addItem("${b.text("action.modify")}", action.edit());
      bar.addItem("${b.text("action.delete")}", action.remove("当前选择的记录中，可能存在子记录，若“删除”的话，将会一起删除？确认要继续吗？"));
    [/@]
    [@b.row]
      [@b.boxcol name="productCategory.id"/]
      [@b.col title="编码" property="code"/]
      [@b.col title="名称" property="name"/]
      [@b.col title="上级" property="parent.code" sortable="false"][#if productCategory.parent?exists]${productCategory.parent.name}(${productCategory.parent.code})[/#if][/@]
      [@b.col title="更新时间" property="updatedAt"]${productCategory.updatedAt?string("yyyy-MM-dd HH:mm:ss")}[/@]
    [/@]
  [/@]
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "产品种类";
      });
    });
  </script>
[@b.foot/]