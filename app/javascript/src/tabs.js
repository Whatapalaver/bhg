export default function tabs (element) {
  if (!element) return;
  const buttons = Array.from(element.querySelectorAll('.js-tabs-button'));
  const allTabs = Array.from(element.querySelectorAll('.js-tabs-tab'));


  element.addEventListener('click', event => {
    const { target } = event;

    if (target.matches('.js-tabs-button')) {
      const targetTab = element.querySelector(`.js-tabs-tab[data-tab="${target.dataset.tab}"]`);

      if (targetTab) {
        buttons.forEach(button => {
          button.classList.remove('is-current');
        });
        target.classList.add('is-current');

        allTabs.forEach(tab => {
          tab.classList.remove('is-active');
        });
        targetTab.classList.add('is-active');
      }
    }
  }, false);
}
