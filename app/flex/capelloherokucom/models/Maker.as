package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="makers")]
  [Bindable]
  public class Maker extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";
    public var discount:Number = new Number;

    [HasMany]
    public var models:ModelsCollection;
    
    [HasMany]
    public var orders:ModelsCollection;
    
    public function Maker() {
      super(LABEL);
    }
  }
}
