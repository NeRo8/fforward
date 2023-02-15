import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class RelativeFormField<T extends ListItem> extends StatefulWidget {
  final T? value;
  final List<T> list;
  final void Function(T) onTap;
  final String label;
  final String hint;
  final String? Function(String?)? validator;

  final TextEditingController textController = TextEditingController();

  RelativeFormField({
    super.key,
    this.validator,
    required this.value,
    required this.onTap,
    required this.list,
    required this.label,
    required this.hint,
  }) {
    textController.text = value?.title ?? '';
  }

  @override
  State<RelativeFormField<T>> createState() => _RelativeFormFieldState<T>();
}

class _RelativeFormFieldState<T extends ListItem>
    extends State<RelativeFormField<T>> {
  bool _isTechListVisible = false;

  @override
  void dispose() {
    widget.textController.dispose();
    super.dispose();
  }

  void _setTechListVisible(bool visible) => setState(() {
        _isTechListVisible = visible;
      });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () => _setTechListVisible(true),
          child: TextFormField(
            enabled: false,
            controller: widget.textController,
            validator: widget.validator,
            decoration: InputDecoration(
              labelText: widget.label,
              hintText: widget.hint,
            ),
          ),
        ),
        if (_isTechListVisible)
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.borderColor),
            ),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 300),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: widget.list.length,
                itemBuilder: (ctx, index) {
                  final item = widget.list[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      InkWell(
                        onTap: () {
                          _setTechListVisible(false);
                          widget.onTap(item);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: Text(item.title),
                        ),
                      ),
                      if (item.title == widget.value?.title)
                        const Divider(
                          thickness: 2,
                          color: AppColors.primaryColor,
                        ),
                      const SizedBox(
                        height: 8,
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
      ],
    );
  }
}
