require "js_info/version"

module JsInfo

	protected

	def js_alert(message, url = request.referer)
		if message.blank?
			raise "Unable to find any message for js_info!"
		end

		script = %Q{alert("#{message}");document.location.href="#{url}";}
		html = html(script)
		render text: html
		return
	end

	def js_confirm(message, url, false_url = nil)
		if message.blank? || url.blank?
			raise "wrong parameter values for js_info!"
		end

		false_action = false_url.blank? ? "document.location.href=\"#{request.referer}\"" : "document.location.href=\"#{false_url}\""

		script = %Q{
			var r = confirm("#{message}");
			if (r == true) {
				document.location.href="#{url}";
			}
			else {
				#{false_action}
			}
		}
		html = html(script)
		render text: html
		return
	end	

	def js_prompt(message, url, params_name = "prompt_name", params_value = nil)
		
		if message.blank? || url.blank?
			raise "wrong parameter values for js_info!"
		end

		script = %Q{
			var url = "#{url}";
			var params_name = "#{params_name}";
			var params_value = prompt("#{message}", "#{params_value}");
			var target_url = url + "?" + params_name + "=" + params_value;
			//check is params_value is existed
			if (params_value !== null) {
			  document.location.href=target_url;	
			}			
			else {
				document.location.href="#{request.referer}";
			}
		}
		html = html(script)
		render text: html
		return
	end		

	private

	def html(script)
		%Q{
			<!DOCTYPE html>
			<head></head>
			<body>
			<script type="text/javascript">
			<!--
			#{script}
			//-->
			</script>
			</body>
			</html>
		}		
	end

end

class ActionController::Base
	include JsInfo
end
