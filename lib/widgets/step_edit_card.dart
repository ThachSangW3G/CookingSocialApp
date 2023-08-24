import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_svg/svg.dart';

class StepEditCard extends StatelessWidget {
  final String _step;
  // final Function(IngredientItem) onTap;
  // final Function(IngredientItem) onDelete;
  // final Function(IngredientEditCard) onEdit;

  const StepEditCard({
    Key? key,
    required String step,
    // this.onTap,
    // this.onDelete,
    // this.onEdit
  })  : _step = step,
        super(key: key);

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
      child: ListTile(
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
        title: Text(_step),
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
              _buildOptionItem('Set as header'),
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
    IconData icon;
    String text;
    switch (option) {
      case 'Edit':
        icon = Icons.edit;
        text = 'Edit';
        break;
      case 'Add item above':
        icon = Icons.add;
        text = 'Add item above';
        break;
      case 'Add item below':
        icon = Icons.add;
        text = 'Add item below';
        break;
      case 'Set as header':
        icon = Icons.check;
        text = 'Set as header';
        break;
      case 'Delete':
        icon = Icons.delete;
        text = 'Delete';
        break;
      default:
        icon = Icons.error;
        text = 'Lỗi';
    }

    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      onTap: () {
        // Xử lý khi tùy chọn được chọn
        _handleOptionSelection(option) {}
        ;
      },
    );
  }
}
