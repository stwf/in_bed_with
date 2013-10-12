module InBedWith
	class Quantcast < Base
    	register :p_code
    	register :load_in_development, optional: true

    def code
      if do_not_display?
        answer = ""
      else
        answer = real_code
      end
      answer
    end

   	def real_code
%(<!-- Quantcast Tag -->
<script type="text/javascript">
var _qevents = _qevents || [];

(function() {
var elem = document.createElement('script');
elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";
elem.async = true;
elem.type = "text/javascript";
var scpt = document.getElementsByTagName('script')[0];
scpt.parentNode.insertBefore(elem, scpt);
})();

_qevents.push({
qacct:"#{p_code}"
});
</script>

<noscript>
<div style="display:none;">
<img src="//pixel.quantserve.com/pixel/#{p_code}.gif" border="0" height="1" width="1" alt="Quantcast"/>
</div>
</noscript>
<!-- End Quantcast tag -->
)
		end
	end
end