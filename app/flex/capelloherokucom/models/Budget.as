package capelloherokucom.models {
  
  import org.restfulx.models.RxModel;
  
  [Resource(name="budgets")]
  [Bindable]
  public class Budget extends RxModel {
    public static const LABEL:String = "year";

    public var year:int = 0;

    public var value:Number = new Number;

    [HasOne]
    public var user:User;

    public function Budget() {
      super(LABEL);
    }
  }
}
