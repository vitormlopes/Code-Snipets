<div class="message-window" style="display:none; padding-top:10px;">

	 <#list nav_items as nav_item>
	 	<a class="menu-item" style="padding-left: 20px;" href="${nav_item.getURL()}" ${nav_item.getTarget()}><img  style="padding-right:10px; height:16px" src="${nav_item.iconURL()}"/>${nav_item.getName()}</a>
	 	<hr style="margin: 10px 20px 10px 20px;">
	 </#list>
		<a class="menu-item" style="padding-left: 20px;" href="/c/portal/logout"><img style="padding-right:10px; height:16px" src="/o/ctlm-hb-theme/images/icons/Sign-Out.png"/>Sair</a>
	 	<hr style="margin: 10px 20px 10px 20px;">

</div>

<div id="navMobile" class="col-xs-12">
	
	
	<#assign colsizeclasslimits="col-xs-6 col-sm-6">
	<#assign colsizeclass="col-xs-6 col-sm-6">
	
	<#assign assetEntryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService") />
	<#assign assetTagLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetTagLocalService") />
	<#assign layoutLocalService = serviceLocator.findService("com.liferay.portal.kernel.service.LayoutLocalService") />

	<#assign tagId = "">
	<#assign tags = assetTagLocalService.getAssetTags(-1, -1)>
	
	<#list tags as tag>
	    <#if tag.getName()=="mobilefooter">
	        <#assign tagId = tag.getTagId()>
	    </#if>
	</#list>

	<#assign assetEntryLocalService = serviceLocator.findService("com.liferay.asset.kernel.service.AssetEntryLocalService") />
	<#assign entries = 	assetEntryLocalService.getAssetTagAssetEntries(tagId?number , -1, -1)>
	<#assign entriesCount = assetEntryLocalService.getAssetTagAssetEntriesCount(tagId?number)>
	
	<#if entriesCount==1>
		<#assign colsizeclasslimits="col-xs-4 col-sm-4">
		<#assign colsizeclass="col-xs-4 col-sm-4">
	<#elseif entriesCount==2>
		<#assign colsizeclasslimits="col-xs-3 col-sm-3">
		<#assign colsizeclass="col-xs-3 col-sm-3">
	<#else >
		<#assign colsizeclasslimits="col-xs-2 col-sm-2">
		<#assign colsizeclass="col-xs-4 col-sm-4">
	</#if>
	
	<a href="${themeDisplay.getURLHome()}" class="${colsizeclasslimits}" style="padding: 9px 0px 0px 0px; text-align:center;">
		<img class="footerMenuIcon" src="/o/ctlm-hb-theme/images/icons/Home-white.png"></img>
		<p class="footerMenuLinks">Inicio</p>
	</a>
	
	<#if entries?has_content>
		<#if entriesCount gt 2>
			<div class="col-xs-8 col-sm-8">
		</#if>
		<#assign counter = 1>
		<#list entries as curEntry>
	        <#assign layout = layoutLocalService.getLayout(curEntry.getClassPK())>
			<#if counter lt 4>
				<a href="${layout.getFriendlyURL(locale)}" class="${colsizeclass}" style="padding: 9px 0px 0px 0px; text-align:center;">
					<img class="footerMenuIcon" src="/image/layout_icon?img_id=${layout.iconImageId}"></img>
					<p class="footerMenuLinks">${layout.getName()}</p>
				</a>
			</#if>
			<#assign counter = counter + 1>
	    </#list>
	    <#if entriesCount gt 2>
			</div>
		</#if>
	</#if>
	
	<div class="menu-nav ${colsizeclasslimits}" style="padding: 9px 0px 0px 0px; text-align:center;">
		<img class="footerMenuIcon" src="/o/ctlm-hb-theme/images/icons/Menu-white.png"></img>
		<p class="footerMenuLinks">Menu</p>
	</div>
	
</div>

<script>
	$('.menu-nav').click(function(){
	    var hidden = $('.message-window');
	    $('html, body').animate({scrollTop: 0}, 800);
	    if (hidden.hasClass('visible')){
	        hidden.animate({"left":"100%"}, "slow").removeClass('visible');
	        hidden.css("display", "none");
	        $('body').css({'overflow':'visible'});
	    } else {
	        hidden.animate({"left":"0"}, "slow").addClass('visible');
	        hidden.css("display", "unset");
	        $('body').css({'overflow':'hidden'});
	    }
    });
    
    $('.menu-item').click(function(){
		$('body').css({'overflow':'visible'});
    });

</script>