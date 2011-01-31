package capelloherokucom.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="warehouses")]
  [Bindable]
  public class Warehouse extends RxModel {
    public static const LABEL:String = "model";

    public var items:int = 0;

    [BelongsTo]
    public var maker:Maker;

    [BelongsTo]
    public var model:Model;
    
    public function Warehouse() {
      super(LABEL);
    }
  }
}