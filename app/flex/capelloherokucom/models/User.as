package capelloherokucom.models {
  import org.restfulx.collections.ModelsCollection;

  import org.restfulx.models.RxModel;

  [Resource(name="users")]
  [Bindable]
  public class User extends RxModel {
    public static const LABEL:String = "username";

    public var email:String = "";

    public var username:String = "";

    public var password:String = "";

    public var note:String = "";

    public var sessionKey:String = "";

    public var currentBudget:Number = new Number;

    [DateTime]
    public var sessionKeyExpiresOn:Date = new Date;

    public var active:Boolean = false;

    public var admin:Boolean = false;

    [HasMany]
    public var orders:ModelsCollection;

    [HasMany]
    public var returns:ModelsCollection;

    [BelongsTo]
    public var budget:Budget;

//    [HasOne]
//    public var budget:Budget;


    public function User() {
      super(LABEL);
    }

    [Ignored]
    public function get required():Number {
      return itemsRequired();
    }

    [Ignored]
    public function get received():Number {
      return itemsReceived();
    }

    [Ignored]
    public function get ordered():Number {
      return computedTotalOrders();
    }

    [Ignored]
    public function get returned():Number {
      return computedTotalReturns();
    }

    [Ignored]
    public function get lastOrderDate():Date {
      return computedlastOrderDate();
    }

    [Ignored]
    public function get lastOrderMaker():Maker {
      return computedLastOrderMaker();
    }

    [Ignored]
    public function get lastOrderModel():Model {
      return computedLastOrderModel();
    }

    private function itemsRequired():Number {
      var total:Number = new Number(0);
      for each (var order:Order in orders) {
        total += order['itemsRequired'];
      }
      return total;
    }

    private function itemsReceived():Number {
      var total:Number = new Number(0);
      for each (var order:Order in orders) {
        total += order['itemsReceived'];
      }
      return total;
    }

    private function computedTotalOrders():Number {
      var total:Number = new Number(0);
      for each (var order:Order in orders) {
        total += order['total'];
      }
      return total;
    }

    private function computedTotalReturns():Number {
      var total:Number = new Number(0);
      for each (var ret:Return in returns) {
        total += ret['total'];
      }
      return total;
    }

    private function computedlastOrderDate():Date {
      var last_order:Object = orders.getItemAt(0);
      return last_order['orderDate'];
    }

    private function computedLastOrderMaker():Maker {
      var last_order:Object = orders.getItemAt(0);
      return last_order.maker;
    }

    private function computedLastOrderModel():Model {
      var last_order:Object = orders.getItemAt(0);
      return last_order.model;
    }

  }
}
