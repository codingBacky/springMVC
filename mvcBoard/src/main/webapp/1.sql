
브라우저에서 요청 (get 방식)  http://localhost:8081/
->web.xml     <welcome-file>index.jsp</welcome-file>	http://localhost:8081/index.jsp 페이지를 응답

응답 페이지에서  <a href="./BoardList.bo">게시판</a> 을 클릭해서 게시판 보기 http://localhost:8081/BoardList.bo   를 요청(get 방식)
->web.xml -> url mapping 을 통해서 <servlet-class>net.board.controller.BoardFrontController</servlet-class>  프로그램을 실행(doGet 메서드)
	->doProcess(request, response) 를 호출
		- uri ("/BoardList.bo"를 의미) 를 구하고 context.path(""을 의미)를 구한다.
		- uri에서 command 를 얻어낸다. uri.substring(context.path.length()===>0) -> uri.substring(0) == uri에 있던 값과 동일
		- command 같은 문자열을 if구문을 이용해서 찾는다.
			Action action = null;
			if (command.equals("/BoardList.bo")) { //언젠가 맞는 조건이 나오면
				action = new BoardListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
			}