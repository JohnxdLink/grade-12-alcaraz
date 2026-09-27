const updateLogoDisplay = (mediaQuery) => {
  const logo = document.getElementById("logo");

  logo.classList.toggle("d-flex", mediaQuery.matches);
  logo.classList.toggle("d-none", !mediaQuery.matches);
};

const updatePosition = (mediaQuery) => {
  const menu = document.getElementById("menu");

  menu.classList.toggle("top-0", mediaQuery.matches);
  menu.classList.toggle("bottom-0", !mediaQuery.matches);
};

const updateMenuLabel = (mediaQuery) => {
  const menuLabels = document.querySelectorAll(".menuLabel");

  menuLabels.forEach((menuLabel) => {
    menuLabel.classList.toggle("d-block", mediaQuery.matches);
    menuLabel.classList.toggle("d-none", !mediaQuery.matches);
  });
};

export const handleNavBarMediaQuery = (mediaQuery) => {
  updateLogoDisplay(mediaQuery);
  updatePosition(mediaQuery);
  updateMenuLabel(mediaQuery);
};
