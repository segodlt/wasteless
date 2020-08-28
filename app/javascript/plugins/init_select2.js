import $ from 'jquery';
import 'select2';

const initSelect2 = (cssSelector) => {
  $(cssSelector).select2({width: "100%"}).on('select2:select', (e) => {
    const select = e.currentTarget;
    const event = new Event('change');
    select.dispatchEvent(event);
  });
};

export { initSelect2 };
