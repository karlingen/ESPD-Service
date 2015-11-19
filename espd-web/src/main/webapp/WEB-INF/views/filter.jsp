<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<script>
$(function() { 

    $("*[name='agent']").click(function () {
    	$('#nextBtn').prop('disabled', true);
    	$('#tab-from').removeClass('active')
    	$('#tab-upload').removeClass('active')
    	$('.radioCa').removeAttr('checked');
    	$('[value="empty"]').prop('selected', true);
    	$("input:file").val('');
    });
	$("input:file").change(function (){
		if($(this).val() != '') {
			$('#tab-from').addClass('active');
		}
	});
    $("*[name='country']").change(function() {
    	$('#nextBtn').prop('disabled', $(this).val() === '---');
    });
});
</script>

<form:form id="espdform" role="form" class="form-horizontal" method="post"  commandName="espd" data-toggle="validator" enctype="multipart/form-data">

	<div class="panel-default">

		<ul class="nav nav-pills nav-wizard nav-justified">
			<li class="active"><a href="#"><i class="fa fa-random"></i>&nbsp;<span data-i18n="progress_start"><s:message code='progress_start'/></span></a><div class="nav-arrow"></div></li>
			<li><div class="nav-wedge"></div><a href="#"><i class="fa fa-university"></i>&nbsp;<span data-i18n="progress_procedure"><s:message code='progress_procedure'/></span></a><div class="nav-arrow"></div></li>
			<li><div class="nav-wedge"></div><a href="#"><i class="fa fa-exclamation"></i>&nbsp;<span data-i18n="progress_exclusion"><s:message code='progress_exclusion'/></span></a><div class="nav-arrow"></div></li>
			<li><div class="nav-wedge"></div><a href="#"><i class="fa fa-check-circle"></i>&nbsp;<span data-i18n="progress_selection"><s:message code='progress_selection'/></span></a><div class="nav-arrow"></div></li>
			<li><div class="nav-wedge"></div><a href="#"><i class="fa fa-download"></i>&nbsp;<span data-i18n="progress_finish"><s:message code='progress_finish'/></span></a></li>
		</ul>

		<div class="paragraph">
			<h2 data-i18n="filter_header"><s:message code='filter_header'/></h2>
		</div>

		<div class="alert alert-espd-info">
			<ul class="fa-ul">
			<li>
				<i class="info-label fa fa-info-circle fa-lg fa-li"></i>
				<span data-i18n="filter_alert"><s:message code='filter_alert'/></span>
			</li>
			</ul>
		</div>
		
		<div class="paragraph">

			<h3>
				<span data-i18n="filter_who_are_you"><s:message code='filter_who_are_you'/></span>
				<span data-i18n="tooltip_espd_used_both_ca_eo" data-toggle="tooltip" title="<s:message code='tooltip_espd_used_both_ca_eo'/>"></span>
			</h3>
			
			<div class="radio" >
				<label><input id="whoareyou_ca" name="agent" value="ca" class="radiotab" type="radio" href="#tab_ca"><span data-i18n="filter_i_am_ca"><s:message code='filter_i_am_ca'/></span></label>
				<span data-i18n="tooltip_ca_ref_buyer" data-toggle="tooltip" title="<s:message code='tooltip_ca_ref_buyer'/>"></span>
			</div>
			
			<div class="radio">
				<label><input id="whoareyou_eo" name="agent" value="eo" class="radiotab" type="radio" href="#tab_eo"><span data-i18n="filter_i_am_eop"><s:message code='filter_i_am_eop'/></span></label>
				<span data-i18n="tooltip_eo_ref_suppl" data-toggle="tooltip" title="<s:message code='tooltip_eo_ref_suppl'/>"></span>
			</div>

			<div class="tab-content" >

				<div class="tab-pane" id="tab_ca">

					<h3 data-i18n="filter_what_you_do"><s:message code='filter_what_you_do'/></h3>
		
					<div class="radio">
						<label><input name="action" value="ca_create_espd" class="radiotab radioCa" type="radio" data-target="#tab-from"><span data-i18n="filter_create_espd"><s:message code='filter_create_espd'/></span></label>
						<span data-i18n="tooltip_ca_can_create_espd" data-toggle="tooltip" title="<s:message code='tooltip_ca_can_create_espd'/>"></span>
					</div>
					<div class="radio">
						<label><input disabled name="action" class="radiotab radioCa" type="radio" data-target="#"><span data-i18n="filter_reuse_espd"><s:message code='filter_reuse_espd'/></span></label>
						<span data-i18n="tooltip_ca_can_import_espd" data-toggle="tooltip" title="<s:message code='tooltip_ca_can_import_espd'/>"></span>
					</div>
					<div class="radio">
						<label><input disabled name="action" class="radiotab radioCa" type="radio" data-target="#"><span data-i18n="filter_overview_espds"><s:message code='filter_overview_espds'/></span></label>
						<span data-i18n="tooltip_overview_received_espds" data-toggle="tooltip" title="<s:message code='tooltip_overview_received_espds'/>"></span>
					</div>
					<div class="radio">
						<label><input disabled name="action" class="radiotab radioCa" type="radio" data-target="#"><span data-i18n="filter_review_espd"><s:message code='filter_review_espd'/></span></label>
						<span data-i18n="tooltip_review_espd" data-toggle="tooltip" title="<s:message code='tooltip_review_espd'/>"></span>
					</div>
				</div>

				<div class="tab-pane" id="tab_eo">
				
					<h3 data-i18n="filter_what_you_do"><s:message code='filter_what_you_do'/></h3>
					
					<div class=" radio">
						<span class="k-button fa fa-upload hoverable"></span>
						<label><input name="action" value="eo_import_espd" class="radiotab radioCa" type="radio" data-target="#tab-upload"><span data-i18n="filter_import_espd"><s:message code='filter_import_espd'/></span></label>
						<span data-i18n="tooltip_filter_eo_can_import_espd" data-toggle="tooltip" title="<s:message code='tooltip_filter_eo_can_import_espd'/>"/>
						
					</div>
					<div class="radio">
						<span class="k-button fa fa-upload hoverable"></span>
						<label><input disabled name="action" class="radiotab radioCa" type="radio" data-target="#"><span data-i18n="filter_reuse_espd"><s:message code='filter_reuse_espd'/></span></label>
						<span data-i18n="tooltip_eo_can_reuse_espd" data-toggle="tooltip" title="<s:message code='tooltip_eo_can_reuse_espd'/>"/>
					</div>
					
				</div>
			</div>
			<div class="tab-content" >

				<div class="tab-pane" id="tab-upload">
					<h3 data-i18n="">Upload document</h3>
					<form:input type="file" path="attachment"/>
				</div> 
				
				<div class="tab-pane" id="tab-from">
					<h3 data-i18n="filter_where_are_you_from"><s:message code='filter_where_are_you_from'/></h3>
					<span data-i18n="filter_select_country"><s:message code='filter_select_country'/></span>
                    <tiles:insertDefinition name="countries">
                        <tiles:putAttribute name="countryField" value="authority.country"/>
                        <tiles:putAttribute name="countryHtmlId" value="country"/>
                    </tiles:insertDefinition>
				</div>

			</div>
		</div>
	</div>

    <tiles:insertDefinition name="footerButtons">
    </tiles:insertDefinition>
	
</form:form>
