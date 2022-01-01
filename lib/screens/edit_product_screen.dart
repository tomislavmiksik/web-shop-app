import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:web_shop_app/providers/product_item_provider.dart';
import 'package:web_shop_app/providers/product_provider.dart';

class EditProductScreen extends StatefulWidget {
  const EditProductScreen({Key? key}) : super(key: key);

  static const routePath = 'edit-prouduct-screen';

  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imgUrlController = TextEditingController();
  final _form = GlobalKey<FormState>();

  var _editedProduct = ProductProvider(
      description: '',
      id: '',
      imageUrl: '',
      price: 0,
      title: '',
      isFavourite: false);

  void _submitForm() {
    final isValid = _form.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _form.currentState?.save();
    if (Provider.of<ProductItemProvider>(context, listen: false)
        .items
        .contains(_editedProduct)) {
      return;
    }
    Provider.of<ProductItemProvider>(context, listen: false)
        .addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final id = routeArgs['id'];

    ProductProvider product;
    product = Provider.of<ProductItemProvider>(context).findById(id!);

    return Scaffold(
      backgroundColor: const Color(0x111213ff),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              _submitForm();
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      body: Form(
        key: _form,
        child: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          children: [
/*             Padding(
              padding: const EdgeInsets.all(8),
              child: Text(product.id),
            ), */
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: ClipRRect(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(
                  child:
                      _imgUrlController.text.isEmpty && product.imageUrl.isEmpty
                          ? Image.asset("assets/images/placeholder1.png")
                          : _imgUrlController.text.isEmpty &&
                                  product.imageUrl.isNotEmpty
                              ? Image.network(
                                  product.imageUrl,
                                  fit: BoxFit.cover,
                                )
                              : Image.network(
                                  _imgUrlController.text,
                                  fit: BoxFit.cover,
                                ),
                  height: 300,
                  width: double.infinity,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.title,
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  errorStyle:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                  labelText: 'Title',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input missing, please enter a valid value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = ProductProvider(
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price,
                    title: value.toString(),
                    isFavourite: _editedProduct.isFavourite,
                  );
                },
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.price.toStringAsFixed(2),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(
                    RegExp(r'^(\d+)?\.?\d{0,2}'),
                  ),
                ],
                validator: (value) {
                  if (value!.isEmpty || double.parse(value) <= 0) {
                    return 'Input cannot be equal or less than 0';
                  }
                  return null;
                },
                //focusNode: _priceFocusNode,
                autocorrect: true,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Price (USD/\$)',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onSaved: (value) {
                  _editedProduct = ProductProvider(
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    price: double.parse(value.toString()),
                    title: _editedProduct.title,
                    isFavourite: _editedProduct.isFavourite,
                  );
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                autocorrect: true,
                keyboardType: TextInputType.url,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Product image URL',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input missing, please enter a valid value';
                  }
                  if (!value.startsWith('http') && !value.startsWith('https')) {
                    return 'Please enter a valid URL';
                  }
                  return null;
                },
                //onFieldSubmitted: (string) {},
                controller: _imgUrlController,
                onEditingComplete: () {
                  //print(_imgUrlController.text);
                  setState(() {
                    product.imageUrl = _imgUrlController.text;
                  });
                },
                onSaved: (value) {
                  _editedProduct = ProductProvider(
                    description: _editedProduct.description,
                    id: _editedProduct.id,
                    imageUrl: value.toString(),
                    price: _editedProduct.price,
                    title: _editedProduct.title,
                    isFavourite: _editedProduct.isFavourite,
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                initialValue: product.description,
                maxLines: 3,
                autocorrect: true,
                keyboardType: TextInputType.multiline,
                textInputAction: TextInputAction.done,
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white70),
                  ),
                  labelText: 'Description',
                  labelStyle: TextStyle(
                    color: Colors.white70,
                  ),
                ),
                onFieldSubmitted: (_) {
                  _submitForm();
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Input missing, please enter a valid value';
                  }
                  return null;
                },
                onSaved: (value) {
                  _editedProduct = ProductProvider(
                    description: value.toString(),
                    id: _editedProduct.id,
                    imageUrl: _editedProduct.imageUrl,
                    price: _editedProduct.price,
                    title: _editedProduct.title,
                    isFavourite: _editedProduct.isFavourite,
                  );
                },
                //textInputAction: TextInputAction.next,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
