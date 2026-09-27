import { mediaQueries } from "../utils/media-query.js";
import { renderStudents, renderDevelopmentTeam } from "../component/students/students.js";

const updateHeightImage = (mediaQuery) => {
  const heights = document.querySelectorAll(".hero-image");

  heights.forEach((height) => {
    height.classList.toggle("h-320", mediaQuery.matches);
    height.classList.toggle("h-192", !mediaQuery.matches);
  });
};

const updateHeroContent = (mediaQuery) => {
  const paddingTop = document.getElementById("hero-left-content");

  paddingTop.classList.toggle("pt-16", mediaQuery.matches);
  paddingTop.classList.toggle("pt-8", !mediaQuery.matches);
};

const updateHeroDescription = (mediaQuery) => {
  const description = document.getElementById("description");

  description.classList.toggle("text-16", mediaQuery.matches);
  description.classList.toggle("w-4/5", mediaQuery.matches);
  description.classList.toggle("text-14", !mediaQuery.matches);
};

const studentSection = {
  content: (mediaQuery, studentDisplay, developmentTeamDisplay) => {
    studentDisplay.classList.toggle("h-480", !mediaQuery.matches);
    developmentTeamDisplay.classList.toggle("h-auto", mediaQuery.matches);
    developmentTeamDisplay.classList.toggle("h-480", !mediaQuery.matches);
  },

  button: (studentDisplay, developmentTeamDisplay) => {
    const masterListBtn = document.getElementById("master-list-btn");
    const developmentTeamBtn = document.getElementById("development-team-btn");

    if (!masterListBtn || !developmentTeamBtn) return;

    masterListBtn.addEventListener("click", (event) => {
      event.preventDefault();

      masterListBtn.classList.add("btn-ghost__is-active");
      developmentTeamBtn.classList.remove("btn-ghost__is-active");

      studentDisplay.classList.replace("d-none", "d-flex");
      developmentTeamDisplay.classList.replace("d-flex", "d-none");
    });

    developmentTeamBtn.addEventListener("click", (event) => {
      event.preventDefault();

      masterListBtn.classList.remove("btn-ghost__is-active");
      developmentTeamBtn.classList.add("btn-ghost__is-active");

      studentDisplay.classList.replace("d-flex", "d-none");
      developmentTeamDisplay.classList.replace("d-none", "d-flex");
    });
  },
};

export const landing = () => {
  const desktopQuery = mediaQueries.desktop;
  const studentDisplay = document.getElementById("student-list");
  const developmentTeamDisplay = document.getElementById("development-team");

  updateHeightImage(desktopQuery);
  updateHeroDescription(desktopQuery);
  updateHeroContent(desktopQuery);
  studentSection.content(desktopQuery, studentDisplay, developmentTeamDisplay);
  studentSection.button(studentDisplay, developmentTeamDisplay);

  renderStudents();
  renderDevelopmentTeam();
};

landing();
