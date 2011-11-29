package fred.eyes;

public class Coordinate {

	public Coordinate(int x, int y, int z) {
		super();
		this.x = x;
		this.y = y;
		this.z = z;
	}

	public Coordinate(float radius, float radians) {
		this.z = 0;
		this.x = (int) (radius*Math.cos(radians));
		this.y = (int) (radius*Math.sin(radians));
	}

	public Coordinate subtract(Coordinate c2) {
		Coordinate result = new Coordinate(this.x-c2.x, this.y-c2.y, this.z-c2.z);
		return result; 
	}
	public Coordinate add(Coordinate c2) {
		Coordinate result = new Coordinate(this.x+c2.x, this.y+c2.y, this.z+c2.z);
		return result; 
	}
	public Coordinate multiply(int r) {
		Coordinate result = new Coordinate(this.x*r, this.y*r, this.z*r);
		return result; 
	}
	public float angleTo(Coordinate c2) {
		Coordinate deltaVect = c2.subtract(this);

		float result= (float) Math.atan((float)(deltaVect.y)/(float)(deltaVect.x));
		if (deltaVect.x<0){
			result +=Math.PI;
		}
		return result;
	}
	public int x,y,z;
}