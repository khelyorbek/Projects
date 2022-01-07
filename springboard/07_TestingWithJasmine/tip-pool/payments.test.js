describe('Payments tests', () => {
    // test for function createCurPayment()
    it('should calculate the tipPercentage correctly using createCurPayment()', () => {
        billAmtInput.value = 1000;
        tipAmtInput.value = 100;
        let curPay = createCurPayment();

        expect(Number(curPay.billAmt)).toEqual(1000);
        expect(Number(curPay.tipAmt)).toEqual(100);
        expect(Number(curPay.tipPercent)).toEqual(10);

    }
    );

    // test for function appendPaymentTable()
    it('should calculate append to the table properly using appendPaymentTable()', () => { 
        billAmtInput.value = 2500;
        tipAmtInput.value = 100;

        appendPaymentTable(createCurPayment());

        expect(paymentTbody.innerHTML).toContain('$2500');
        expect(paymentTbody.innerHTML).toContain('$100');
        expect(paymentTbody.innerHTML).toContain('4%');
        
    });

    // test for function submitPaymentInfo()
    it('should run all functions at the same time correctly using submitPaymentInfo()', () => { 
        billAmtInput.value = 3500;
        tipAmtInput.value = 350;

        submitPaymentInfo();

        expect(paymentTbody.innerHTML).toContain('$3500');
        expect(paymentTbody.innerHTML).toContain('$350');
        expect(paymentTbody.innerHTML).toContain('10%');

    });

    // test for function updateSummary() functions
    it('should add the data into the table using updateSummary()', () => { 
        let newBill = 500;
        let newTip = 50;
        
        billAmtInput.value = newBill;
        tipAmtInput.value = newTip;

        let prevBill = Number(summaryTds[0].innerHTML.substring(1));
        let prevTip = Number(summaryTds[1].innerHTML.substring(1));

        submitPaymentInfo();

        let curBill = Number(summaryTds[0].innerHTML.substring(1));
        let curTip = Number(summaryTds[1].innerHTML.substring(1));

        expect(curBill-prevBill).toEqual(newBill);
        expect(curTip-prevTip).toEqual(newTip);

    });

});


// cleanup of the dom
  afterEach(function () {
//   // teardown logic
    serverTbody.innerHTML = '';
    serverNameInput.value = '';
    paymentTbody.innerHTML = '';
    billAmtInput.value = '';
    tipAmtInput.value = '';
    document.querySelector('#summaryTable tbody').innerHTML = '';
  });