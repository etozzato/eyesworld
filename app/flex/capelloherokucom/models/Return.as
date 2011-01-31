package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="returns")]
  [Bindable]
  public class Return extends RxModel {
    public static const LABEL:String = "itemsReturned";

    public var total:Number = new Number;

    public var itemsReturned:int = 0;

    public var returnDate:Date = new Date;
    
    public var createdAt:Date = new Date;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var maker:Maker;

    [BelongsTo]
    public var model:Model;
    
    public function Return() {
      super(LABEL);
    }
  }
}