package fred.eyes;

import android.app.Activity;
import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.graphics.RadialGradient;
import android.graphics.RectF;
import android.graphics.Shader.TileMode;
import android.os.Bundle;
import android.view.View;
import android.view.Window;

/**
 * This class provides a basic demonstration of how to write an Android
 * activity. Inside of its window, it places a single view: an EditText that
 * displays and edits some internal text.
 */
public class FredEyesActivity extends Activity {
	/** Called when the activity is first created. */
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);//remove title
		Panel panel = new Panel(this);
		setContentView(panel);
		panel.invalidate();
		FredEyesServer tempServer = new FredEyesServer(panel);
		tempServer.execute();
	}
	
	class Panel extends View {
		
		public Panel(Context context) {
			super(context);
		}
		
		private Paint eyewPaint; 
		public Coordinate focus = new Coordinate(50,50,5);
		public int happiness = 5;
		String text = "default";

		@Override
        public void onDraw(Canvas canvas) {
        	try{
        		Paint paint = new Paint();
        		paint.setStyle(Paint.Style.FILL);
        		
        		// make the entire canvas black
        		paint.setColor(Color.BLACK);
        		canvas.drawPaint(paint);
        		
        		Coordinate eyeSize = new Coordinate(230,300,100);
        		
        		Coordinate eyeL = new Coordinate((int)(getWidth()*0.25),(int)(getHeight()*0.5),eyeSize.z);
        		Coordinate eyeR = new Coordinate((int)(getWidth()*0.75),(int)(getHeight()*0.5),eyeSize.z);
        		
        		Bitmap pupilImage = BitmapFactory.decodeResource(this.getResources(), R.drawable.pupil);
        		int pupilRadius=pupilImage.getWidth()/2;

        		Coordinate pupilShiftL = new Coordinate(eyeSize.x/2,eyeL.angleTo(focus));
        		Coordinate pupilShiftR = new Coordinate(eyeSize.x/2,eyeR.angleTo(focus));
        		Coordinate pupilL = eyeL.add(pupilShiftL);
        		Coordinate pupilR = eyeR.add(pupilShiftR);
        		
        		RadialGradient eyelShader =new RadialGradient(pupilL.x, pupilL.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
        		RadialGradient eyerShader =new RadialGradient(pupilR.x, pupilR.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
        		RectF eyelRec = new RectF(eyeL.x-eyeSize.x, eyeL.y-eyeSize.y,eyeL.x+eyeSize.x, eyeL.y+eyeSize.y);
        		RectF eyerRec = new RectF(eyeR.x-eyeSize.x, eyeR.y-eyeSize.y,eyeR.x+eyeSize.x, eyeR.y+eyeSize.y);
        		eyewPaint = new Paint();  
        		  eyewPaint.setDither(true);  
        		  eyewPaint.setColor(Color.WHITE);  
        		  eyewPaint.setStyle(Paint.Style.FILL);
        		  eyewPaint.setShader(eyelShader);
        		canvas.drawOval(eyelRec, eyewPaint);
        		  eyewPaint.setShader(eyerShader);
        		canvas.drawOval(eyerRec, eyewPaint);
        	
        		canvas.drawBitmap(pupilImage,pupilR.x-pupilRadius, pupilR.y-pupilRadius, paint);
        		canvas.drawBitmap(pupilImage,pupilL.x-pupilRadius, pupilL.y-pupilRadius, paint);
        		
//        		RectF eyeBrowL = eyelRec;
//        		eyeBrowL.offsetTo(0, 100);
//        		eyeBrowL.inset(0, 150);
//        		RectF eyeBrowR = eyerRec;
//        		eyeBrowR.offsetTo(0, 100);
//        		eyeBrowR.inset(0, 150);
//        		canvas.drawArc(eyeBrowL, startAngle, sweepAngle, useCenter, paint);
//        		canvas.drawArc(eyeBrowL, startAngle, sweepAngle, useCenter, paint);
  
    		} catch (Exception e){
    			e.printStackTrace();
    		}
    	}

	}
}
