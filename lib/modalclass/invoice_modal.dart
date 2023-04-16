import 'package:invoice_generator/modalclass/item_modal.dart';

class InvoiceModal {
  String? name, add, email, img, number, invoicetype;
  List<Itemmodal>? item;
  num? subtotal,total,discounttotal;

  InvoiceModal({
    this.name,
    this.invoicetype,
    this.add,
    this.subtotal,
    this.total,
    this.discounttotal,
    this.email,
    this.img,
    this.number,
    this.item
  });
}
