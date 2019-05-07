package cn.edu.nyist.food.exception;
@SuppressWarnings("unused")
public class FoodException extends RuntimeException {
	private static final long serialVersionUID = 1L;
	private String message;
    public FoodException(String message) {
		this.message=message;
	}
}
