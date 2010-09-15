package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="models")]
  [Bindable]
  public class Model extends RxModel {
    public static const LABEL:String = "name";

    public var name:String = "";
    public var discount:Number = new Number;

    [BelongsTo]
    public var maker:Maker;

    [HasMany]
    public var orders:ModelsCollection;
    
    public function Model() {
      super(LABEL);
    }
    
    [Ignored]
    public function get parent_discount():Number {
      return maker.discount;
    }
    
    
    
  }
}
