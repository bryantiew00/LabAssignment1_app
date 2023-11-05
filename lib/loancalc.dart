import 'package:flutter/material.dart';

class LoanCalcPage extends StatefulWidget {
  const LoanCalcPage({Key? key}) : super(key: key);

  @override
  _LoanCalcPageState createState() => _LoanCalcPageState();
}

class _LoanCalcPageState extends State<LoanCalcPage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : AppBar(
        title: const Text('Boit Loan Calculator'),
      ),
      body: Center(
          child: Column(
        children: [
          Flexible(
              flex: 5,
              child: Image.asset('assets/images/Financial.png', scale: 3.85)),
          const Flexible(flex: 7, child: LoanCalcMtd())
        ],
      )),
    );
  }
}
 

class LoanCalcMtd extends StatefulWidget {
  const LoanCalcMtd({Key? key}) : super(key: key);

  @override
  _LoanCalcMtdState createState() => _LoanCalcMtdState();
}

class _LoanCalcMtdState extends State<LoanCalcMtd> {

  TextEditingController loanAmountEditingController = TextEditingController();
  TextEditingController termEditingController = TextEditingController();
  TextEditingController interestRateEditingController = TextEditingController();

  int loanAmount = 0, term = 0;
  double interestRate = 0.0, totalAmount = 0.0, totalPayment = 0.0, totalInterest = 0.0;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 0),
        child: Column(
          children: [
            const Text(
              "Monthly Payment Loan Calculator",
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: loanAmountEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Loan Amount",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0))),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: termEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Years",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0))),
        ),
        const SizedBox(height: 10, width: 12),
        TextField(
          controller: interestRateEditingController,
          keyboardType: const TextInputType.numberWithOptions(),
          decoration: InputDecoration(
            hintText: "Interest Rate %",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(28.0))),
        ),
        const SizedBox(height: 15, width: 12),
            ElevatedButton(
                onPressed: _calBoit, child: const Text("Calculate")),
            ElevatedButton(
                onPressed: _clear, child: const Text("Clear")),
        const SizedBox(height: 10),
            Text(
              "Monthly Payment: RM ${totalAmount.toStringAsPrecision(6)}\nYou will need to pay RM ${totalAmount.toStringAsPrecision(6)} every month for $term years to payoff the debt.\nTotal of ${term * 12} Payments =>  ${totalPayment.toStringAsPrecision(6)} \nTotal Interest   =>  ${totalInterest.toStringAsPrecision(6)}",   
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
       ),
    );
  }

  void _calBoit(){
    loanAmount = int.parse(loanAmountEditingController.text);
    term = int.parse(termEditingController.text);
    interestRate = double.parse(interestRateEditingController.text);
    setState(() {
      totalAmount = ((loanAmount * (interestRate/100)) /(1-(1/(1+(((interestRate/100)/12)*(term*12)))*1/12)));
      totalPayment = totalAmount * term *12;
      totalInterest = totalPayment - loanAmount;
    });
  }

  void _clear() {
    setState(() {
    loanAmountEditingController.clear();
    termEditingController.clear();
    interestRateEditingController.clear();
    totalAmount = 0; term = 0; totalPayment = 0; totalInterest = 0;

    });
  }

}