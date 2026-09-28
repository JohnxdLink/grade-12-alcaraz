const backToTop = () => {
  const homeBtn = document.getElementById("home-btn");
  const mainContainer = document.getElementById("main-container");

  if (!homeBtn || !mainContainer) {
    console.error("Home button or main container not found.");
    return;
  }

  homeBtn.addEventListener("click", (event) => {
    event.preventDefault();

    mainContainer.scrollTo({
      top: 0,
      behavior: "smooth",
    });
  });
};

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
  backToTop();
  updateLogoDisplay(mediaQuery);
  updatePosition(mediaQuery);
  updateMenuLabel(mediaQuery);
};
