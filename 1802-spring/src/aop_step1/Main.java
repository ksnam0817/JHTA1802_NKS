package aop_step1;

public class Main {
	Dao boardDao;
	Dao memberDao;
	
	public Main() {}

	public Dao getBoardDao() {
		return boardDao;
	}

	public void setBoardDao(Dao boardDao) {
		this.boardDao = boardDao;
	}

	public Dao getMemberDao() {
		return memberDao;
	}

	public void setMemberDao(Dao memberDao) {
		this.memberDao = memberDao;
	}
	
	
}
