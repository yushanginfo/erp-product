[@b.head title="产品种类"/]
  [@b.toolbar title="产品种类"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="producateCategories" theme="search"]
          [@b.textfields names="productCategory.code;编码,productCategory.name;名称,productCategory.parent.code;上级编码,productCategory.parent.name;上级名称"/]
        [/@]
      </td>
      <td class="index_content">
        [@b.div id="producateCategories"/]
      </td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "产品种类";
        bg.form.submit(document.searchForm, "${b.url("!search")}", "producateCategories");
      });
    });
  </script>
[@b.foot/]