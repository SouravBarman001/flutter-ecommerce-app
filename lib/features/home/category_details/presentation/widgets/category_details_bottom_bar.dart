part of '../pages/category_details.dart';
class _CategoryDetailsBottomBar extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      height: 100,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              CategoryDetailsDialogHelper.showDialogBox(context);
              //  _saveForm(context, _textEditingControllerOne.text);
              HapticFeedback.mediumImpact();
            },
            child: Container(
              alignment: Alignment.center,
              height: 50,
              width: 300.w,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff0C1A30),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'Filter & Sorting',
                style: AppTextStyle.textStyleOne(
                  const Color(0xff0C1A30),
                  14,
                  FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
