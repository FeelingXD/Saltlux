package db;

public class Pair<T>{
	private T value;
	private String type;
	
	public Pair<T>(T value1) {
		this.value=value1;
		this.type = value1.getClass().getSimpleName();
	}
	
	public T getValue(){
		return this.value;
	}
	
	public String getType() {
		return this.type;
	}
}