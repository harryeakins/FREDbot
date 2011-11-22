package fred.eyes;

import org.apache.thrift.TException;

import fred.eyes.FredEyes;
import fred.eyes.FredEyesActivity.Panel;

import org.apache.thrift.server.TServer;
import org.apache.thrift.server.TSimpleServer;
import org.apache.thrift.server.TThreadPoolServer.Args;
import org.apache.thrift.transport.TServerSocket;
import org.apache.thrift.transport.TTransportException;

import android.os.AsyncTask;

/**
 * An Android Asynchronous task which runs a thrift server and handles requests
 * @author yz1708
 *
 */
public class FredEyesServer extends AsyncTask<Void, Integer, Integer> implements FredEyes.Iface {
    Panel panel;
    public FredEyesServer(Panel panelIn) {
        super();
        this.panel = panelIn;
    }
    
    @Override
    public void setFocus(Location focus) throws TException {
        publishProgress(focus.x, focus.y, focus.z, -1);
        
    }
    
    @Override
    public void setHappiness(int happyIndex) throws TException {
        publishProgress(-1,-1,-1,happyIndex);
    }
    
    /**
     * onProgressUpdate is run in the UI thread, so can alter the UI
     * It is called every time the background thread (in this case the
     * thrift server) calls publishProgress(Integer)
     */
    @Override
    protected void onProgressUpdate(Integer... values) {
        if(values[0] >= 0 && values[3] < 0) {//setFocus
        	panel.focus= new Coordinate(values[0],values[1],values[2]);
        	panel.invalidate();
        } else if(values[0] < 0 && values[3] >= 0) {
        	panel.happiness=values[3];
        	panel.invalidate();
        } else{
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