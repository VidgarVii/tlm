document.addEventListener('turbolinks:load', () => {

  let result      = document.getElementById('js-search-result'),
      bikInput    = document.getElementById('bank_account_bank_id'),
      btnFormP    = document.getElementById('js-form-btn-add-payment'),
      error       = document.getElementsByClassName('new_bank')[0],
      resultBlock = document.getElementsByClassName('js-search-form')[0];

  let addError = () => { error.classList.remove('hidden') };
  let removeError = () => { error.classList.add('hidden') };

  let displayResult = (response) => {
    result.classList.remove('hidden');
    result.innerHTML = `<h5> ${response.bank.name} </h5> <p> ${response.bank.correspondent_account} <br> ${response.bank.legal_address.address}</p>`;
  };

  let showBtnAddPayment = () => {
    btnFormP.classList.remove('hidden')
  };

  let setResult = (e) => {
    if (e.detail[0].error) {
      result.classList.add('hidden');
      addError()
    } else {
      removeError();
      bikInput.value = e.detail[0].bank.id;
      displayResult(e.detail[0])
      showBtnAddPayment();
    }
  };

  if (resultBlock) {
    resultBlock.addEventListener('ajax:success', setResult) }
});
