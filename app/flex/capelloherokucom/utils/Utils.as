package capelloherokucom.utils {
  import mx.formatters.CurrencyFormatter;
  import mx.formatters.DateFormatter;
  import mx.controls.Alert;
  import mx.events.CloseEvent;
  import org.restfulx.utils.RxUtils;
  
  public class Utils {

    public static var panelHeight:int = 600;

    public static function logout():void{Alert.show("Uscire dall'applicazione?", "Conferma",  Alert.YES|Alert.NO, null, doLogout, null);} 
    
    public static function doLogout(event:CloseEvent):void{ if (event.detail == Alert.YES) { RxUtils.navToURL("/logout"); } }

    private static var costFormatter:CurrencyFormatter;
    
    public static function getCostFormatter():CurrencyFormatter {
      if (!costFormatter) {
        var costFormatter:CurrencyFormatter = new CurrencyFormatter;
        costFormatter.currencySymbol = " € ";
        costFormatter.precision = 2;
        costFormatter.rounding = "up";
        costFormatter.decimalSeparatorTo = ",";
        costFormatter.thousandsSeparatorTo = "'";
        costFormatter.useThousandsSeparator = true;
        costFormatter.alignSymbol= 'right';
      }
      return costFormatter;
    }
    
  }
}