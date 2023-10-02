//
// part of '../pages/verification_page.dart';
//
// class _OTPField extends ConsumerStatefulWidget {
//   const _OTPField({super.key});
//
//   @override
//   ConsumerState<_OTPField> createState() => _OTPFieldState();
// }
//
// class _OTPFieldState extends ConsumerState<_OTPField> {
//
//
//   @override
//   Widget build(BuildContext context) {
//     final notifier = ref.read(signInVerificationProvider.notifier);
//
//     return  SizedBox(
//       child: Pinput(
//         controller: notifier.pinController,
//         focusNode: notifier.focusNode,
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         defaultPinTheme: PinTheme(
//           width: 74,
//           height: 55,
//           textStyle:  TextStyle(
//             fontSize: 18.sp,
//             color: const Color.fromRGBO(30, 60, 87, 1),
//             fontWeight: FontWeight.w600,
//           ),
//           decoration: BoxDecoration(
//             border: Border.all(color: const Color(0xffededed)),
//             borderRadius: BorderRadius.circular(10),
//             color: const Color(0xffFAFAFA),
//           ),
//         ),
//         validator: Validators.inValidOTP,
//       ),
//     );
//   }
// }
