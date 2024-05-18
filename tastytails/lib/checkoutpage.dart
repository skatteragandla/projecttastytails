import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tastytails/confirmationpage.dart';
import 'package:tastytails/confirmationpage.dart';

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  void _navigateToConfirmationPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ConfirmationPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PaymentButton(
              icon: Icons.credit_card,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'Debit Card',
              color: Colors.blue,
            ),
            const SizedBox(height: 16),
            PaymentButton(
              icon: Icons.credit_card_outlined,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'Credit Card',
              color: Colors.green,
            ),
            const SizedBox(height: 16),
            PaymentButton(
              icon: FontAwesomeIcons.paypal,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'PayPal',
              color: Colors.blueAccent,
            ),
            const SizedBox(height: 16),
            PaymentButton(
              icon: FontAwesomeIcons.applePay,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'Apple Pay',
              color: Colors.black,
            ),
            const SizedBox(height: 16),
            PaymentButton(
              icon: FontAwesomeIcons.googlePay,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'Google Pay',
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            PaymentButton(
              icon: Icons.money,
              onPressed: () => _navigateToConfirmationPage(context),
              label: 'Cash on Delivery',
              color: Colors.orange,
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String label;
  final Color color;

  const PaymentButton({
    required this.icon,
    required this.onPressed,
    required this.label,
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: FaIcon(icon, size: 24, color: Colors.white), 
      label: Text(label, style: const TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(double.infinity, 48), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), 
        ),
      ),
    );
  }
}
