export default function tabs (element) {
  if (!element) return;
  console.log('element', element)
  const buttons = Array.from(element.querySelectorAll('.js-tabs-button'));
  const allTabs = Array.from(element.querySelectorAll('.js-tabs-tab'));

  console.log("buttons", buttons)
  console.log("tabs", allTabs)

  element.addEventListener('click', event => {
    const { target } = event;
    console.log("clicked")
    console.log("target", target)

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
