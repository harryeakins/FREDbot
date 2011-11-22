package fred.eyes;

import org.apache.thrift.TException;

import android.app.Activity;
import android.os.Bundle;
import android.view.Window;
import android.widget.TextView;

/**
 * This class provides a basic demonstration of how to write an Android
 * activity. Inside of its window, it places a single view: an EditText that
 * displays and edits some internal text.
 */
public class FredEyesActivity extends Activity {
	/** Called when the activity is first created. */
	private TextView tv;
	@Override
	public void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		requestWindowFeature(Window.FEATURE_NO_TITLE);//remove title
		tv = new TextView(this);
		tv.setText("Hello, Androidy");
		setContentView(tv);
		FredEyesServer tempServer = new FredEyesServer(tv);
		tempServer.execute();
	}
}