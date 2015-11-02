{{ form('loan/upload','method':'post','enctype':'multipart/form-data') }}
<ul class="pager">
    <li class="previous pull-left">
        {{ link_to("loan/detail/" ~ loan.id, "&larr; 返回") }}
    </li>
    <li class="pull-right">
        {{ submit_button("保存", "class": "btn btn-success") }}	
    </li>		
</ul>
<div class="center scaffold">
	<h3>抵押物文件上传</h3>
	<hr />	
	<div style="text-align:left;">	
		
    <label class="control-label">点击选择文件</label>
    <!-- <input id="input-6" type="file" multiple=true class="file-loading"> -->
	<input type="hidden" name="fid" value="{{ loan.id }}" />
	<input type="hidden" name="fileName" value="{{ loan.number }}" />
	文件标题：<input type="text" name="title" value="" />
	<br />
	<input type="file" name="file" class="fileInput" />
	</div>
</form>		
</div>

