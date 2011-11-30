package fred.eyes;

public class MaskEyeSpace {
	public int outside, inside, up, down;
    //constructor
  public MaskEyeSpace(int outside, int inside, int up, int down) {
		super();
		this.outside = outside;
		this.inside = inside;
		this.up = up;
		this.down = down;
  }
	public Coordinate[] constrainedShift(Coordinate leftEye, Coordinate rightEye, Coordinate shiftVector) {
		Coordinate newLeftEye = new Coordinate(0,0,0);
		Coordinate newRightEye = new Coordinate(0,0,0);
		if (shiftVector.x>100){shiftVector.x=100;}
		if (shiftVector.x<-100){shiftVector.x=-100;}
		if (shiftVector.y>100){shiftVector.y=100;}
		if (shiftVector.y<-100){shiftVector.y=-100;}
		if (shiftVector.x > 0){
			newLeftEye.x=leftEye.x+shiftVector.x*this.inside/100;
			newRightEye.x=rightEye.x+shiftVector.x*this.outside/100;
		}else{
			newLeftEye.x=leftEye.x+shiftVector.x*this.outside/100;
			newRightEye.x=rightEye.x+shiftVector.x*this.inside/100;
		}
		if(shiftVector.y > 0){
			newLeftEye.y=leftEye.y-shiftVector.y*this.up/100;
			newRightEye.y=newLeftEye.y;
		}else{
			newLeftEye.y=leftEye.y-shiftVector.y*this.down/100;
			newRightEye.y=newLeftEye.y;
		}
		Coordinate[] result = {newLeftEye,newRightEye};
		return result ; 
	}
}
