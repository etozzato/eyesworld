package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="orders")]
  [Bindable]
  public class Order extends RxModel {
    public static const LABEL:String = "itemsRequired";

    public var ID:int = 0;

    public var itemsRequired:int = 0;

    public var itemsReceived:int = 0;

    public var confidentialPrice:Number = new Number;

    public var discount:Number = new Number;

    public var price:Number = new Number;

    public var total:Number = new Number;

    public var orderDate:Date = new Date;
    
    public var createdAt:Date = new Date;

    public var lastIncrement:Date = new Date;

    [BelongsTo]
    public var user:User;

    [BelongsTo]
    public var maker:Maker;

    [BelongsTo]
    public var model:Model;
    
    [HasMany]
    public var increments:ModelsCollection;
    
    public function Order() {
      super(LABEL);
    }
  }
}