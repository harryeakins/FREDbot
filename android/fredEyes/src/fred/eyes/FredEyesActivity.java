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
import android.view.WindowManager;

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
		getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
	}
	
	class Panel extends View {
		
		public Panel(Context context) {
			super(context);
		}
		
//		public void centreImageAt(Bitmap image, int x, int y, Canvas canvas){
//			canvas.drawBitmap(image,x-image.getWidth()/2, y-image.getHeight()/2, null);
//		}
		
		public Coordinate focus = new Coordinate(1000,-1000,0);
		public int happiness = -3;
		public int happyOffset=3;
		String text = "default";
		
		public Bitmap[] emotionMask = {
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_13),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_8),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_5),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy_3),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy0),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy8),
                BitmapFactory.decodeResource(this.getResources(), R.drawable.happy10)};
		public MaskEyeSpace[] freePupilSpace = {
				new MaskEyeSpace(70,50,20,20),
				new MaskEyeSpace(70,50,20,40),
				new MaskEyeSpace(50,40,10,70),
				new MaskEyeSpace(40,40,10,50),
				new MaskEyeSpace(100,50,100,60),
				new MaskEyeSpace(100,50,50,20),
				new MaskEyeSpace(100,50,30,20)};

		@Override
		
        public void onDraw(Canvas canvas) {
			
        	try{
        		Paint paint = new Paint();
        		paint.setStyle(Paint.Style.FILL);
        		
        		// make the entire canvas black
        		paint.setColor(Color.WHITE);
        		canvas.drawPaint(paint);
        		
        		int emotionNum=0;
                if (happiness>=-happyOffset && happiness<=happyOffset){
                    emotionNum=happiness+happyOffset;
                }else{
                    emotionNum=happyOffset;
                }
                
        		Coordinate shaderSize = new Coordinate(300,330,100);//width 600, height 660, pupil radius 200
                Coordinate eyeCentreL = new Coordinate((int)(canvas.getWidth()*0.25),(int)(canvas.getHeight()*0.6),0);
        		Coordinate eyeCentreR = new Coordinate((int)(canvas.getWidth()*0.75),(int)(canvas.getHeight()*0.6),0);
        		 
        		Bitmap pupilImage = BitmapFactory.decodeResource(this.getResources(), R.drawable.pupil);
        		int pupilRadius=pupilImage.getWidth()/2;

        		Coordinate[] pupilCentre = freePupilSpace[emotionNum].constrainedShift(eyeCentreL, eyeCentreR, focus);
        		Coordinate pupilCentreL = pupilCentre[0];
        		Coordinate pupilCentreR = pupilCentre[1];
        		
        		RadialGradient eyelShader =new RadialGradient(pupilCentreL.x, pupilCentreL.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
                RadialGradient eyerShader =new RadialGradient(pupilCentreR.x, pupilCentreR.y, 500, Color.WHITE, Color.BLACK,TileMode.CLAMP);
                RectF eyelRec = new RectF(eyeCentreL.x-shaderSize.x, eyeCentreL.y-shaderSize.y,eyeCentreL.x+shaderSize.x, eyeCentreL.y+shaderSize.y);
                RectF eyerRec = new RectF(eyeCentreR.x-shaderSize.x, eyeCentreR.y-shaderSize.y,eyeCentreR.x+shaderSize.x, eyeCentreR.y+shaderSize.y);
                Paint eyewPaint = new Paint();  
                  eyewPaint.setDither(true);  
                  eyewPaint.setColor(Color.WHITE);  
                  eyewPaint.setStyle(Paint.Style.FILL);
                  eyewPaint.setShader(eyelShader);
                canvas.drawOval(eyelRec, eyewPaint);
                  eyewPaint.setShader(eyerShader);
                canvas.drawOval(eyerRec, eyewPaint);
        		canvas.drawBitmap(pupilImage,pupilCentreL.x-pupilRadius, pupilCentreL.y-pupilRadius, null);
        		canvas.drawBitmap(pupilImage,pupilCentreR.x-pupilRadius,pupilCentreR.y-pupilRadius, null);
        		canvas.drawBitmap(emotionMask[emotionNum],0, 0, paint);
  
    		} catch (Exception e){
    			e.printStackTrace();
    		}
    	}

	}
}
