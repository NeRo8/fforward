import 'package:fforward_adm/models/models.dart';
import 'package:fforward_adm/resources/app_colors.dart';
import 'package:flutter/material.dart';

class MultipleRelativeFormField extends StatefulWidget {
  final String value;
  final List<ListItem> list;
  final Function(String) onTap;
  final String label;
  final String hint;
  final String? Function(String?)? validator;

  final TextEditingController textController = TextEditingController();

  MultipleRelativeFormField({
    super.key,
    this.validator,
    required this.value,
    required this.onTap,
    required this.list,
    required this.label,
    required this.hint,
  }) {
    textController.text = value;
  }

  @override
  State<MultipleRelativeFormField> createState() =>
      _MultipleRelativeFormFieldState();
}

class _MultipleRelativeFormFieldState extends State<MultipleRelativeFormField> {
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const SizedBox(
                height: 16,
              ),
              SizedBox(
                width: 100,
                height: 30,
                child: ElevatedButton(
                  onPressed: () => _setTechListVisible(false),
                  child: const Text('Done'),
                ),
              ),
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
                              widget.onTap(item.id);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: Text(item.title),
                            ),
                          ),
                          if (widget.value.contains(item.title))
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
          ),
      ],
    );
  }
}
