<script>
    function go(dest) {
      if (dest == "") {
        return false;
      } else if (dest[0] == "#") {
        window.location.hash=dest;
      } else if (dest[0] == "?") {
	if (confirm("Are you sure?")){
          window.location = dest.substring(1);
        } else {
          return false
        }
      } else {
        window.location=dest;
      }
    }
</script>
