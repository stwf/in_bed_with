module InBedWith
	class Quantcast < Base
    	register :account_name

    	def code
			[
				'<!-- Quantcast Tag -->',
				'<script type="text/javascript">',
				'var _qevents = _qevents || [];',

				'(function() {',
				'var elem = document.createElement("script");',
				'elem.src = (document.location.protocol == "https:" ? "https://secure" : "http://edge") + ".quantserve.com/quant.js";',
				'elem.async = true;',
				'elem.type = "text/javascript";',
				'var scpt = document.getElementsByTagName("script")[0];',
				'scpt.parentNode.insertBefore(elem, scpt);',
				'})();',

				'_qevents.push({',
				'qacct:"#{account_name}"',
				'});',
				'</script>',

				'<noscript>',
				'<div style="display:none;">',
				'<img src="//pixel.quantserve.com/pixel/p-c0-15CjNXRBjM.gif" border="0" height="1" width="1" alt="Quantcast"/>',
				'</div>',
				'</noscript>'].join("")
		end
	end
end