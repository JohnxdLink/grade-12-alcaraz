import { handleNavBarMediaQuery } from "../js/component/nav-bar/nav-bar.js";
import { mediaQueries } from "../js/utils/media-query.js";

export const main = () => {
  console.log("Welcome!");

  const desktopQuery = mediaQueries.desktop;

  handleNavBarMediaQuery(desktopQuery);

  desktopQuery.addEventListener("change", handleNavBarMediaQuery);
};

main();
