package fred.eyes;

import org.apache.thrift.TException;

import fred.eyes.FredEyes;
import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.server.TThreadPoolServer.Args;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TTransportException;

import android.os.AsyncTask;
import android.widget.TextView;

/**
 * An Android Asynchronous task which runs a thrift server and handles requests
 * @author yz1708
 *
 */
public class FredEyesServer extends AsyncTask<Void, Integer, Integer> implements FredEyes.Iface {
	TextView tv;	

	public FredEyesServer(TextView tvin) {
		super();
		this.tv = tvin;
	}

	@Override
	public void setFocus(location focus) throws TException {
		publishProgress(2);

	}

	@Override
	public void setHappiness(int happyIndex) throws TException {
		publishProgress(happyIndex);
	}

	/**
	 * onProgressUpdate is run in the UI thread, so can alter the UI
	 * It is called every time the background thread (in this case the 
	 * thrift server) calls publishProgress(Integer)
	 */
	@Override
	protected void onProgressUpdate(Integer... values) {
		if(values[0] == 1) {
			tv.setText("happy 1");
		} else if(values[0] == 2) {
			tv.setText("happy 2");
		} else {
			tv.setText("more happy");
		}
		super.onProgressUpdate(values);
	}

	/**
	 * This is the main function for the background thread
	 * It simply starts the thrift server and handles requests
	 */
	@Override
	protected Integer doInBackground(Void... params) {
		try {
			FredEyesServer handler = this;
			FredEyes.Processor processor = new FredEyes.Processor(handler);
			TServerSocket serverTransport = new TServerSocket(9090);
			TServer server = new TSimpleServer(new Args(serverTransport).processor(processor));
			server.serve();
		} catch (TTransportException e) {
			e.printStackTrace();
		}
		return null;
	}
}
