describe('Helpers tests', () => {
    it('should return the correct sum of selected type using sumPaymentTotal()', () => {
        
        allPayments = 
        {
            "payment1": {
                "billAmt": 500,
                "tipAmt": "350",
                "tipPercent": 10
            },
            "payment2": {
                "billAmt": 250,
                "tipAmt": "50",
                "tipPercent": 10
            }
        };
        
        let total = sumPaymentTotal('billAmt');
        expect(total).toEqual(750);

    });

    it('should calculate the right tip amount using calculateTipPercent()', () => {
        let tstBillAmt = 5000;
        let tstTipAmt = 500;
        
        let tstTipPer = calculateTipPercent(tstBillAmt,tstTipAmt);

        expect(tstTipPer).toEqual(10);
    });

});

describe('Helpers own code tests', () => {
    it('ServerTable - should add X when a new item is added to the table', () => {
        serverNameInput.value = 'MyOwnCode';

        submitServerInfo();

        expect(serverTbody.innerHTML).toContain('MyOwnCode');
        expect(serverTbody.innerHTML).toContain('X');

    });

    it('ServerTable - should remove the parent item when X is pressed', () => {
        serverNameInput.value = 'MyOwnCode';

        submitServerInfo();
        // finding the first row in the #serverTable and finding the last td (which is the X)
        // then triggering a click Even on top of it
        // I had to add a .5 sec delay because the previous test function was not drawing the item quickly enough
        document.querySelector('#serverTable tbody tr').lastElementChild.dispatchEvent(new Event('click'));
        
        expect(serverTbody.innerHTML).toEqual = '';

    });

    it('PaymentTable - should add X when a new item is added to the table', () => {
        billAmtInput.value = 1500;
        tipAmtInput.value = 150;

        submitPaymentInfo();

        expect(paymentTbody.innerHTML).toContain('$1500');
        expect(paymentTbody.innerHTML).toContain('X');

    });

    it('PaymentTable - should remove the parent item when X is pressed', () => {
        billAmtInput.value = 1500;
        tipAmtInput.value = 150;

        submitPaymentInfo();
        // finding the first row in the #serverTable and finding the last td (which is the X)
        // then triggering a click Even on top of it
        // I had to add a .5 sec delay because the previous test function was not drawing the item quickly enough
        document.querySelector('#paymentTable tbody tr').lastElementChild.dispatchEvent(new Event('click'));
        
        expect(paymentTbody.innerHTML).toEqual = '';

    });
});

// cleanup of the dom
afterEach(function () {
    //   // teardown logic;
        serverNameInput.value = '';
        paymentTbody.innerHTML = '';
        billAmtInput.value = '';
        tipAmtInput.value = '';
        document.querySelector('#summaryTable tbody').innerHTML = '';
        allPayments = {};
      });