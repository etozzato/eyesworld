package capelloherokucom.models {
  
  import org.restfulx.models.RxModel;
  import org.restfulx.collections.ModelsCollection;
  
  [Resource(name="increments")]
  [Bindable]
  public class Increment extends RxModel {
    public static const LABEL:String = "to";

    public var from:int = 0;

    public var to:int = 0;

    public var receivedAt:Date = new Date;
    
    [Ignored]
    public function get amount():int {
      return to - from;
    }

	[Lazy]
    [BelongsTo]
    public var order:Order;
    
    public function Increment() {
      super(LABEL);
    }
  }
}
