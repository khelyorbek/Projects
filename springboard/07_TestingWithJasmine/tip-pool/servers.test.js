// original test
describe("Servers test (with setup and tear-down)", function () {
  beforeEach(function () {
    // initialization logic
    serverNameInput.value = 'Alice';
  });


  it('should add a new server to allServers on submitServerInfo()', function () {
    submitServerInfo();

    expect(Object.keys(allServers).length).toBeGreaterThan(0);
    expect(allServers['server' + serverId].serverName).toEqual('Alice');
  });

  // test for function submitServerInfo()
  it('should add Servers name into the Server Table using submitServerInfo()', () => {
    serverNameInput.value = 'Ely';
    submitServerInfo();
    expect(serverTbody.innerHTML).toContain('Ely');
  });


  // test for function updateServerTable()
  it('should not have an empty serverTbody after running updateServerTable()', () => {
    serverNameInput.value = 'Ely';
    updateServerTable();
    expect(serverTbody).not.toEqual('');
  
  });



// cleanup of the dom
  afterEach(function () {
  // teardown logic
    serverTbody.innerHTML = '';
    serverNameInput.value = '';
    paymentTbody.innerHTML = '';
    billAmtInput.value = '';
    tipAmtInput.value = '';
  });

});