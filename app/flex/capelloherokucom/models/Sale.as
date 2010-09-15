package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="sales")]
  [Bindable]
  public class Sale extends RxModel {
    public static const LABEL:String = "itemsSold";

    public var itemsSold:int = 0;

    public var saleDate:Date = new Date;
    
    public var createdAt:Date = new Date;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var maker:Maker;

    [BelongsTo]
    public var model:Model;
    
    public function Sale() {
      super(LABEL);
    }
  }
}