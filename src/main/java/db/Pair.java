package db;

public class Pair<T>{
	public T value;
	public String type;
	
	public Pair(T value) {
		this.value =value;
		this.type= value.getClass().getSimpleName();
	}
	
	public T getValue(){
		return this.value;
	}
	
	public String getType() {
		return this.type;
	}
}