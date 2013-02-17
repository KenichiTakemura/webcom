module Webcom
  module ViewHelpers
    module MobilesHelper
      def _mobile_link_to_with_icon (t,h,r,c,s,i,d,options="")
        html = %Q|<a href="#{h}" data-role="#{r}" class="#{c}" style="#{s}" id="#{d}" #{options}><i class="#{i}"></i>&nbsp;#{t}</a>|
        html.html_safe
      end
      
      def show_mobile_notice(message=nil)
        html = ""
        msg = message.presence || notice.presence || nil
        if msg
          html = %Q|<div data-role="popup" id="popup-notice" data-position-to="window"><div class="" data-role="header"><h3>#{t("form.error")}</h3></div>
          <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a><div class="" data-role="content">#{msg}</div></div>|
        end
        html.html_safe
      end

      def _mobile_tap(element_id,func)
        _script(%Q|$('\##{element_id}').live('tap',function(event) {
          var lastclickpoint = $(this).attr('data-clickpoint');
          var curclickpoint = event.clientX+'x'+event.clientY
          if (lastclickpoint == curclickpoint) return false;
          $(this).attr('data-clickpoint',curclickpoint);
            #{func}
           });|)
      end
      
      def _mobile_loading(text,theme,html)
        html = %Q|$.mobile.loading('show',{text: '#{text}',textVisible:true,theme:'#{theme}',html: "#{html}"});|
        html.html_safe
      end

      def _document_pageinit(script)
        html = %Q|<script type="text/javascript" charset="utf-8">$(document).bind('pageinit', function() {#{script}});</script>|
        html.html_safe
      end
      
    end
  end
end
