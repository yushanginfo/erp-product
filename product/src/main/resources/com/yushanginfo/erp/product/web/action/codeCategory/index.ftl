[@b.head/]
  [@b.toolbar title="代码种类"/]
  <table class="indexpanel">
    <tr>
      <td class="index_view">
        [@b.form title="ui.searchForm" name="searchForm" action="!search" target="codeCategories" theme="search"]
          [@b.textfields names="codeCategory.code;编码,codeCategory.name;名称"/]
        [/@]
      </td>
      <td class="index_content">
        [@b.div id="codeCategories"/]
      </td>
    </tr>
  </table>
  <script>
    $(function() {
      $(document).ready(function() {
        document.title = "代码种类";
        bg.form.submit("searchForm", "${b.url("!search")}", "codeCategories");
      });
    });
  </script>
[@b.foot/]