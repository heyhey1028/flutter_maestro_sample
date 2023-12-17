import 'package:flutter/material.dart';
import 'package:flutter_maestro_sample/global/app_route_data.dart';
import 'package:flutter_maestro_sample/providers/cart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:swipeable_button_view/swipeable_button_view.dart';

class PaymentScreen extends ConsumerStatefulWidget {
  const PaymentScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends ConsumerState<PaymentScreen> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // total price of the cart
                OverviewSection()
                // payment method
                // shipping address
                // shipping method
                // payment button
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Semantics(
                  label: 'swipe to pay',
                  child: SwipeableButtonView(
                    isFinished: isFinished,
                    onFinish: () {
                      setState(() {
                        isFinished = false;
                      });
                      ref.invalidate(cartProvider);
                      context.pop();
                      StatefulNavigationShell.of(context).goBranch(0);
                    },
                    onWaitingProcess: () {
                      Future.delayed(const Duration(seconds: 2), () {
                        setState(() {
                          isFinished = true;
                        });
                      });
                    },
                    activeColor: Colors.lightBlue.shade200,
                    buttonWidget: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Colors.grey,
                    ),
                    buttonText: 'Swipe to Pay',
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OverviewSection extends ConsumerWidget {
  const OverviewSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final totalPrice = ref.watch(cartProvider.notifier).totalPrice;

    return SizedBox(
      height: 100,
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
              ),
              const Gap(10),
              const Text(
                '\$',
                style: TextStyle(fontSize: 20),
              ),
              const Gap(4),
              Text(
                totalPrice.toString(),
                style: const TextStyle(fontSize: 20),
              ),
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Shipping:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gap(10),
              Text('\$', style: TextStyle(fontSize: 16)),
              Gap(4),
              Text('100', style: TextStyle(fontSize: 16)),
            ],
          ),
        ],
      ),
    );
  }
}
