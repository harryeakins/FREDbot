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
		
//		public void centreImageAt(Bitmap image, int x, int y, Canvas canvas){
//			canvas.drawBitmap(image,x-image.getWidth()/2, y-image.getHeight()/2, null);
//		}
		
		public Coordinate focus = new Coordinate(0,0,0);
		public int happiness = 1;
		public int happyOffset=3;
		String text = "defaulty";

		@Override
		
        public void onDraw(Canvas canvas) {
			
        	try{
        		Paint paint = new Paint();
        		paint.setStyle(Paint.Style.FILL);
        		
        		// make the entire canvas black
        		paint.setColor(Color.WHITE);
        		canvas.drawPaint(paint);
        		
        		Coordinate eyewSize = new Coordinate(300,400,100);//width 460, height 600, pupil radius 200
        		Coordinate eyeCentreL = new Coordinate((int)(canvas.getWidth()*0.25),(int)(canvas.getHeight()*0.55),0);
        		Coordinate eyeCentreR = new Coordinate((int)(canvas.getWidth()*0.75),(int)(canvas.getHeight()*0.55),0);
        		Coordinate pupilInset =  new Coordinate((int)(eyewSize.x*0),0,0);
        		//Coordinate eyeL = new Coordinate((int)(getWidth()*0.25),(int)(getHeight()*0.5),eyeSize.z);
        		//Coordinate eyeR = new Coordinate((int)(getWidth()*0.75),(int)(getHeight()*0.5),eyeSize.z);
        		
        		Bitmap pupilImage = BitmapFactory.decodeResource(this.getResources(), R.drawable.pupil);
        		int pupilRadius=pupilImage.getWidth()/2;

        		//Coordinate pupilShiftL = new Coordinate(eyeSize.x/2,eyeL.angleTo(focus));
        		//Coordinate pupilShiftR = new Coordinate(eyeSize.x/2,eyeR.angleTo(focus));
        		Coordinate pupilCentreL = eyeCentreL.add(focus).add(pupilInset);
        		Coordinate pupilCentreR = eyeCentreR.add(focus).subtract(pupilInset);
        		Coordinate pupilImageL = new Coordinate(pupilCentreL.x-pupilRadius,pupilCentreL.y-pupilRadius,0);
        		Coordinate pupilImageR = new Coordinate(pupilCentreR.x-pupilRadius,pupilCentreR.y-pupilRadius,0);
        		
        		RadialGradient eyelShader =new RadialGradient(pupilCentreL.x, pupilCentreL.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
        		RadialGradient eyerShader =new RadialGradient(pupilCentreR.x, pupilCentreR.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
        		RectF eyelRec = new RectF(eyeCentreL.x-eyewSize.x, eyeCentreL.y-eyewSize.y,eyeCentreL.x+eyewSize.x, eyeCentreL.y+eyewSize.y);
        		RectF eyerRec = new RectF(eyeCentreR.x-eyewSize.x, eyeCentreR.y-eyewSize.y,eyeCentreR.x+eyewSize.x, eyeCentreR.y+eyewSize.y);
        		Paint eyewPaint = new Paint();  
        		  eyewPaint.setDither(true);  
        		  eyewPaint.setColor(Color.WHITE);  
        		  eyewPaint.setStyle(Paint.Style.FILL);
        		  eyewPaint.setShader(eyelShader);
        		canvas.drawOval(eyelRec, eyewPaint);
        		  eyewPaint.setShader(eyerShader);
        		canvas.drawOval(eyerRec, eyewPaint);
        	
        		canvas.drawBitmap(pupilImage,pupilImageL.x, pupilImageL.y, null);
        		canvas.drawBitmap(pupilImage,pupilImageR.x, pupilImageR.y, null);

        		Bitmap[] emotionMask = {
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_13),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_8),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_5),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_3),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy0),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy8),
                        BitmapFactory.decodeResource(this.getResources(), R.drawable.happy10)};
                int emotionNum=0;
                if (happiness>=-happyOffset && happiness<=happyOffset){
                    emotionNum=happiness+happyOffset;
                }else{
                    emotionNum=happyOffset;
                }
        		canvas.drawBitmap(emotionMask[emotionNum],0, 0, null);
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
