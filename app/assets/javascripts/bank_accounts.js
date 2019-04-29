document.addEventListener('turbolinks:load', () => {

  let result      = document.getElementById('js-search-result'),
      error       = document.getElementsByClassName('new_bank')[0],
      resultBlock = document.getElementsByClassName('js_search_form')[0];

  let addError = () => { error.classList.remove('hidden') };
  let removeError = () => { error.classList.add('hidden') };

  let displayResult = (response) => {
    result.classList.remove('hidden');
    result.innerHTML = `<h5> ${response.bank.name} </h5> <p> ${response.bank.correspondent_account} <br> ${response.bank.legal_address.address}</p>`;

  };

  let setResult = (e) => {
    console.log(e.detail[0]);

    if (e.detail[0].error) {
      result.classList.add('hidden');
      addError()
    } else {
      removeError();
      displayResult(e.detail[0]) }
  };

  if (resultBlock) {
    resultBlock.addEventListener('ajax:success', setResult) }
});
