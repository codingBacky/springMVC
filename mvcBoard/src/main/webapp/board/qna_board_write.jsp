<%@ page language="java" contentType="text/html; charset=EUC-KR"%>

<html>
<head>
	<title>MVC �Խ���</title>
	<script language="javascript">
	function addboard(){
		//��Ȯ�ϰ� ���� �ڷᰡ �ԷµǾ� �ִ��� üũ�ϴ� ������ ����.
		boardform.submit();//������ ���ٸ� ���� 
	}
	</script>
</head>
<body>
<!-- �Խ��� ��� -->
<h1>�Խñ� ����</h1>
<form action="./BoardAddAction.bo" method="post" enctype="multipart/form-data" name="boardform">
	<!-- �Խñ��� ������ �Ҷ� enctype �ݵ�� ����������� -->
	<label for="">�ۼ���</label>
	<input type="text" name="BOARD_NAME" id="BOARD_NAME" /><br />
	
	<label for="">��й�ȣ</label>
	<input type="password" name="BOARD_PASS" id="BOARD_PASS" /><br />
	
	<label for="BOARD_SUBJECT">����</label>
	<input type="text" name="BOARD_SUBJECT" id="BOARD_SUBJECT"  size="50" maxlength="100"/><br />
	
	<label for="BOARD_CONTENT">����</label>
	<textarea name="BOARD_CONTENT" id="BOARD_CONTENT" cols="60" rows="15"></textarea><br />
	
	<label for="BOARD_FILE">����÷��</label>
	<input type="file" name="BOARD_FILE" id="BOARD_FILE"/> <span>���� �ִ�ũ�� : 5MB</span> <br />


			<a href="javascript:addboard()">[���]</a>&nbsp;&nbsp;
			<a href="javascript:history.go(-1)">[�ڷ�]</a>

</form>
<!-- �Խ��� ��� -->
</body>
</html>