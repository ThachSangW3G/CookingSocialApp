import 'package:cooking_social_app/screens/recipe/add_grocery_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class IngredientEditCard extends StatefulWidget {
  final String _ingredient;
  // final Function(IngredientItem) onTap;
  // final Function(IngredientItem) onDelete;
  // final Function(IngredientEditCard) onEdit;

  const IngredientEditCard({
    Key? key,
    required String ingredient,
    // this.onTap,
    // this.onDelete,
    // this.onEdit
  })  : _ingredient = ingredient,
        super(key: key);

  @override
  State<IngredientEditCard> createState() => _IngredientEditCardState();
}

class _IngredientEditCardState extends State<IngredientEditCard>{
  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (context) {
              // Hiển thị thông tin chi tiết của nguyên liệu
              _showDetailDialog(context);
            },
            label: 'Thông tin',
            icon: Icons.info,
            backgroundColor: Colors.blue,
          ),
          SlidableAction(
            onPressed: (context) {
              // Hiển thị menu tùy chọn
              _showOptionMenu(context);
            },
            label: 'Tùy chọn',
            icon: Icons.more,
            backgroundColor: Colors.green,
          ),
        ],
      ),
      child: ExpansionTile(
        leading: GestureDetector(
          onTap: () {
            // Hiển thị thông tin chi tiết của nguyên liệu
            _showDetailDialog(context);
          },
          child: SvgPicture.asset(
            'assets/icon_svg/menu.svg',
            height: 20,
            width: 20,
          ),
        ),
        title: Text(widget._ingredient),
        trailing: GestureDetector(
          onTap: () {
            // Hiển thị menu tùy chọn
            _showOptionMenu(context);
          },
          child: SvgPicture.asset(
            'assets/icon_svg/options.svg',
            height: 20,
            width: 20,
          ),
        ),
      ),
    );
  }

  void _showDetailDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Thông tin chi tiết'),
          content: const Text('Thông tin chi tiết của nguyên liệu'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  void _showOptionMenu(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Option'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildOptionItem('Edit'),
              _buildOptionItem('Add item above'),
              _buildOptionItem('Add item below'),
              _buildOptionItem('Set as item'),
              _buildOptionItem('Add item to Grocery'),
              _buildOptionItem('Delete'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Đóng'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildOptionItem(String option) {
    Widget icon;
    String text;
    VoidCallback actions = () {};
    switch (option) {
      case 'Edit':
        icon = SvgPicture.asset('assets/icon_svg/pencil.svg', height: 20, width: 20,);
        text = 'Edit';
        actions =() {
          
        }; 
        break;
      case 'Add item above':
        icon = SvgPicture.asset('assets/icon_svg/chevron-circle-up.svg', height: 20, width: 20,);
        text = 'Add item above';
        actions =() {
          
        }; 
        break;
      case 'Add item below':
        icon = SvgPicture.asset('assets/icon_svg/chevron-circle-down.svg', height: 20, width: 20,);
        text = 'Add item below';
        actions =() {
          
        }; 
        break;
      case 'Set as item':
        icon = SvgPicture.asset('assets/icon_svg/flag-alt.svg', height: 20, width: 20,);
        text = 'Set as header';
        actions =() {
          
        }; 
        break;
      case 'Add item to Grocery':
        icon = SvgPicture.asset('assets/icon_svg/cart.svg', height: 20, width: 20,);
        text = 'Add item to Grocery';
         actions = () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddGroceryScreen(key: null,)),
        );
      };
        break;
      case 'Delete':
        icon = SvgPicture.asset('assets/icon_svg/trash.svg', height: 20, width: 20,);
        text = 'Delete';
        actions =() {
          
        }; 
        break;
      default:
        icon = SvgPicture.asset('assets/icon_svg/pencil.svg', height: 20, width: 20,);
        text = 'Lỗi';
    }

    return ListTile(
      leading: icon,
      title: Text(text),
      onTap: actions
    );
  }
}
