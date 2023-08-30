package net.board.action;

public class ActionForward {
	//false 이면 forwarding , true 이면 sendRedirect를 하는 값을 가진다	
	private boolean isRedirect=false;
	
	//경로(연결될 페이지)
	private String path=null;
	
	public boolean isRedirect(){
		return isRedirect;
	}
	
	public String getPath(){
		return path;
	}
	
	public void setRedirect(boolean b){
		isRedirect=b;
	}
	
	public void setPath(String string){
		path=string;
	}
}