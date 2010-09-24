package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="stocks")]
  [Bindable]
  public class Stock extends RxModel {
    public static const LABEL:String = "stock";

    public var items:int = 0;

    public var createdAt:Date = new Date;
    public var updatedAt:Date = new Date;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var maker:Maker;

    [BelongsTo]
    public var model:Model;
    
    public function Stock() {
      super(LABEL);
    }
  }
}