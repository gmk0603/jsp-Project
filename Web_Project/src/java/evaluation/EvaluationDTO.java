package evaluation;

public class EvaluationDTO {
	
	int evaluationID;
	String userID;
	String gameName;
	String gameManufacturers;
	int evalYear;
	String evalQuarter;
	String gameGenre;
	int playTimeHour;
	int playTimeMin;
	int playTimeSec;
	String evaluationTitle;
	String evaluationContent;
	String totalScore;
	String graphicScore;
	String storyScore;
	String controlScore;
	int likeCount;
	
	public int getEvaluationID() {
		return evaluationID;
	}
	public void setEvaluationID(int evaluationID) {
		this.evaluationID = evaluationID;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getGameName() {
		return gameName;
	}
	public void setGameName(String gameName) {
		this.gameName = gameName;
	}
	public String getGameManufacturers() {
		return gameManufacturers;
	}
	public void setGameManufacturers(String gameManufacturers) {
		this.gameManufacturers = gameManufacturers;
	}
	public int getEvalYear() {
		return evalYear;
	}
	public void setEvalYear(int evalYear) {
		this.evalYear = evalYear;
	}
	public String getEvalQuarter() {
		return evalQuarter;
	}
	public void setEvalQuarter(String evalQuarter) {
		this.evalQuarter = evalQuarter;
	}
	public String getGameGenre() {
		return gameGenre;
	}
	public void setGameGenre(String gameGenre) {
		this.gameGenre = gameGenre;
	}
	public int getPlayTimeHour() {
		return playTimeHour;
	}
	public void setPlayTimeHour(int playTimeHour) {
		this.playTimeHour = playTimeHour;
	}
	public int getPlayTimeMin() {
		return playTimeMin;
	}
	public void setPlayTimeMin(int playTimeMin) {
		this.playTimeMin = playTimeMin;
	}
	public int getPlayTimeSec() {
		return playTimeSec;
	}
	public void setPlayTimeSec(int playTimeSec) {
		this.playTimeSec = playTimeSec;
	}
	public String getEvaluationTitle() {
		return evaluationTitle;
	}
	public void setEvaluationTitle(String evaluationTitle) {
		this.evaluationTitle = evaluationTitle;
	}
	public String getEvaluationContent() {
		return evaluationContent;
	}
	public void setEvaluationContent(String evaluationContent) {
		this.evaluationContent = evaluationContent;
	}
	public String getTotalScore() {
		return totalScore;
	}
	public void setTotalScore(String totalScore) {
		this.totalScore = totalScore;
	}
	public String getGraphicScore() {
		return graphicScore;
	}
	public void setGraphicScore(String graphicScore) {
		this.graphicScore = graphicScore;
	}
	public String getStoryScore() {
		return storyScore;
	}
	public void setStoryScore(String storyScore) {
		this.storyScore = storyScore;
	}
	public String getControlScore() {
		return controlScore;
	}
	public void setControlScore(String controlScore) {
		this.controlScore = controlScore;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	
	public EvaluationDTO() {
		
	}
	
	public EvaluationDTO(int evaluationID, String userID, String gameName, String gameManufacturers, int evalYear,
			String evalQuarter, String gameGenre, int playTimeHour, int playTimeMin, int playTimeSec,
			String evaluationTitle, String evaluationContent, String totalScore, String graphicScore, String storyScore,
			String controlScore, int likeCount) {
		super();
		this.evaluationID = evaluationID;
		this.userID = userID;
		this.gameName = gameName;
		this.gameManufacturers = gameManufacturers;
		this.evalYear = evalYear;
		this.evalQuarter = evalQuarter;
		this.gameGenre = gameGenre;
		this.playTimeHour = playTimeHour;
		this.playTimeMin = playTimeMin;
		this.playTimeSec = playTimeSec;
		this.evaluationTitle = evaluationTitle;
		this.evaluationContent = evaluationContent;
		this.totalScore = totalScore;
		this.graphicScore = graphicScore;
		this.storyScore = storyScore;
		this.controlScore = controlScore;
		this.likeCount = likeCount;
	}
}
