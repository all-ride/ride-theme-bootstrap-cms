function joppaContentInitializeDetailProperties(fieldsAction) {
	$("#form-content-properties-model").change(function() {
		joppaContentUpdateFields(fieldsAction);
	});
	joppaContentUpdateFields(fieldsAction);
}	

function joppaContentInitializeOverviewProperties(fieldsAction, orderFieldsAction) {
	$("#form-content-properties-model").change(function() {
		joppaContentUpdateFields(fieldsAction);
		joppaContentUpdateOrderFields(orderFieldsAction);
		$("#form-content-properties-condition-expression").val('');
		$("#form-content-properties-order-expression").val('');
	});
	joppaContentUpdateFields(fieldsAction);
	joppaContentUpdateOrderFields(orderFieldsAction);
	
	$("#form-content-properties-recursive-depth").change(function() {
		joppaContentUpdateOrderFields(orderFieldsAction);
	});
	
	$("#form-content-properties-order-add").click(function() {
		var orderField = $("#form-content-properties-order-field").val();
		if (!orderField) {
			return false;
		}
		
		orderField = '{' + orderField + '} ' + $("#form-content-properties-order-direction").val();
		
		var orderExpression = $("#form-content-properties-order").val();
		if (orderExpression) {
			orderExpression += ', ';
		}
		
		orderExpression += orderField;
		
		$("#form-content-properties-order").val(orderExpression);
		$("#form-content-properties-order-field").val('');
		
		return false;
	});
	
	$("#form-content-properties-pagination-enable").change(function() {
		var usePagination = $("#form-content-properties-pagination-enable").is(':checked'); 
		
		var suffix = usePagination ? ':hidden' : ':visible';
		$("#form-content-properties #tabQuery .pagination-attribute" + suffix).each(function() {			
			$(this).slideToggle('fast');
		});
		
		$("#form-content-properties #tabView .pagination-attribute").each(function() {
			var displayAttribute = $(this).css('display');
			if (usePagination && displayAttribute == 'none') {
				$(this).show();
			} else if (!usePagination || displayAttribute != 'none') {
				$(this).hide();
			}
		});
		
		if ($('#form-content-properties-pagination-show').is(':checked')) {
			if (usePagination) {
				$("#form-content-properties .pagination-ajax").first().show();
			} else {
				$("#form-content-properties .pagination-ajax").first().hide();
			}
		} else {
			$("#form-content-properties .pagination-ajax").first().hide();
		}

		if ($('#form-content-properties-more-show').is(':checked')) {
			$("#form-content-properties .more-attribute").each(function() {
				if (usePagination) {
					$(this).show();
				} else {
					$(this).hide();
				}
			});
		} else {
			$("#form-content-properties .more-attribute").each(function() {
				$(this).hide();
			});
		}
	});
	
	$("#form-content-properties-pagination-show").change(function() {
		var suffix = $("#form-content-properties-pagination-show").attr('checked') ? ':hidden' : ':visible';
		$("#form-content-properties .pagination-ajax" + suffix).first().slideToggle('fast');
	});	
	
	$("#form-content-properties-more-show").change(function() {
		var moreShow = $("#form-content-properties-more-show").is(':checked'); 
		var suffix = moreShow ? ':hidden' : ':visible';
		$("#form-content-properties #tabView .more-attribute" + suffix).each(function() {			
			$(this).slideToggle('fast');
		});
	});
	
	if (!$("#form-content-properties-pagination-enable").is(':checked')) {
		$("#form-content-properties .pagination-attribute").each(function() {
			$(this).hide();
		});
	}	

	if (!$("#form-content-properties-more-show").is(':checked')) {
		$("#form-content-properties .more-attribute").each(function() {
			$(this).hide();
		});
	}	

	if (!$("#form-content-properties-pagination-show").is(':checked')) {
		$("#form-content-properties .pagination-ajax").first().hide();
	}
}

function joppaContentUpdateFields(fieldsAction) {
	var model = $("#form-content-properties-model").val();
	
	$.getJSON(fieldsAction.replace('%25model%25', model), function(data) {
		var select = $("#form-content-properties-fields");
		select.empty();
		for (var key in data.fields) {
			if (data.fields.hasOwnProperty(key)) {
				select.append('<option value="' + key + '">' + data.fields[key] + '</option>');
			}
		}
		select.val('');
	});	
}

function joppaContentUpdateOrderFields(orderFieldsAction) {
	var model = $("#form-content-properties-model").val();
	var recursiveDepth = $("#form-content-properties-recursive-depth").val();
	
	$.getJSON(orderFieldsAction.replace('%25model%25', model).replace('%25recursiveDepth%25', recursiveDepth), function(data) {
		var select = $("#form-content-properties-order-field");
		select.empty();
		select.append('<option value="">---</option>');
		for (var key in data.fields) {
			if (data.fields.hasOwnProperty(key)) {
				select.append('<option value="' + key + '">' + data.fields[key] + '</option>');
			}
		}
		select.val('');
		$("#form-content-properties .order-direction:visible").first().slideToggle('fast');
	});	
}