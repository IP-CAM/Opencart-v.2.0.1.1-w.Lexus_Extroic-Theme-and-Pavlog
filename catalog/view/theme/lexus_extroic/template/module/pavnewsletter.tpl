<div class="box<?php echo $prefix; ?> pav-newsletter" id="newsletter_<?php echo $position.$module;?>">
		<form id="formNewLestter" method="post" action="<?php echo $action; ?>" class="formNewLestter">
            <div class="box-heading"><span><?php echo $objlang->get("entry_newsletter");?></span></div>
            <div class="box-content">
                <div class="description"><p><?php echo html_entity_decode( $description );?></p></div>
                <div class="clearfix">
                        <div class="input-group">
                            <input type="text" class="form-control email" <?php if(!isset($customer_email)): ?> <?php endif; ?> size="18" name="email">
                            <span class="input-group-btn">
                                <button type="submit" name="submitNewsletter" class="btn btn-info"><i class="fa fa-envelope icon-email"></i></button>
                            </span>
                        </div>
                     
                        <input type="hidden" value="1" name="action">
                        <div class="valid"></div>
                </div>
                <?php if (!empty($social)): ?>
                        <?php  echo html_entity_decode( $social );?>
                <?php endif ?>
            </div>	
		</form>
</div>

<script type="text/javascript"><!--

$( document ).ready(function() {

	$('#formNewLestter').on('submit', function() {
		var email = $('.email').val();
		$(".success_inline, .warning_inline, .error").remove();
		if(!isValidEmailAddress(email)) {				
			$('.valid').html("<div class=\"error alert alert-danger\"><?php echo $objlang->get('valid_email'); ?><button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div></div>");
			$('.email').focus();
			return false;
		}
	
		var url = "<?php echo $action; ?>";
		$.ajax({
			type: "post",
			url: url,
			data: $("#formNewLestter").serialize(),
			dataType: 'json',
			success: function(json)
			{
				$(".success_inline, .warning_inline, .error").remove();
				if (json['error']) {
					$('.valid').html("<div class=\"warning_inline alert alert-danger\">"+json['error']+"<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
				}
				if (json['success']) {
					$('.valid').html("<div class=\"success_inline alert alert-success\">"+json['success']+"<button type=\"button\" class=\"close\" data-dismiss=\"alert\">×</button></div>");
				}
			}
		}); return false;
	
	}); //end submmit
}); //end document

function isValidEmailAddress(emailAddress) {
	var pattern = new RegExp(/^(("[\w-\s]+")|([\w-]+(?:\.[\w-]+)*)|("[\w-\s]+")([\w-]+(?:\.[\w-]+)*))(@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$)|(@\[?((25[0-5]\.|2[0-4][0-9]\.|1[0-9]{2}\.|[0-9]{1,2}\.))((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\.){2}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[0-9]{1,2})\]?$)/i);
	return pattern.test(emailAddress);
}
--></script>