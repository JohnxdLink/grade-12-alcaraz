import { projects } from "../projects/projects.js";

const students = [
  {
    profile: "",
    initial: "A",
    name: "Amosora",
    fullname: "Juf Rohan Amosora",
    id: "26-0096",
    group: 1,
    role: "UI/UX Designer",
  },
  { profile: "", initial: "A", name: "Arena", fullname: "Regie Carl Arena", id: "26-0255", group: 4, role: "Frontend" },
  {
    profile: "",
    initial: "B",
    name: "Bersales",
    fullname: "Juancho Salera Bersales",
    id: "26-0062",
    group: 1,
    role: "Quality Assurance",
  },
  {
    profile: "",
    initial: "C",
    name: "Corrales",
    fullname: "Charlize Andrei Corrales",
    id: "26-0257",
    group: 1,
    role: "Backend",
  },
  {
    profile: "",
    initial: "D",
    name: "Dabatos",
    fullname: "Rheyven Dabatos",
    id: "26-1005",
    group: 3,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "D",
    name: "De Leon",
    fullname: "Luke Lorence De Leon",
    id: "26-0071",
    group: 2,
    role: "Backend",
  },
  {
    profile: "",
    initial: "F",
    name: "Fuentes",
    fullname: "Julian Zach Fuentes",
    id: "26-0059",
    group: 2,
    role: "Frontend",
  },
  {
    profile: "",
    initial: "G",
    name: "Garces",
    fullname: "Renerito Gallego Garces",
    id: "26-0270",
    group: 3,
    role: "FullStack",
  },
  {
    profile: "",
    initial: "J",
    name: "Jalipa",
    fullname: "Cyros Wenly Jalipa",
    id: "26-0095",
    group: 2,
    role: "Quality Assurance",
  },
  {
    profile: "",
    initial: "L",
    name: "Labanda",
    fullname: "Arwin Labanda",
    id: "26-0109",
    group: 3,
    role: "Quality Assurance",
  },
  {
    profile: "",
    initial: "L",
    name: "Lentija",
    fullname: "Rommel Lentija",
    id: "26-0100",
    group: 3,
    role: "UI/UX Designer",
  },
  { profile: "", initial: "L", name: "Limen", fullname: "Alfred Limen", id: "26-0319", group: 3, role: "Frontend" },
  {
    profile: "",
    initial: "M",
    name: "Matondo",
    fullname: "James Kenneth Matondo",
    id: "26-0259",
    group: 2,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "M",
    name: "Montoya",
    fullname: "Zedikiel Ryu Gingo Montoya",
    id: "26-0344",
    group: 4,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "O",
    name: "Oflas",
    fullname: "John Dave Libre Oflas",
    id: "26-0294",
    group: 4,
    role: "Backend",
  },
  {
    profile: "",
    initial: "P",
    name: "Pechera",
    fullname: "Vincent Gallego Pechera",
    id: "26-0269",
    group: 5,
    role: "FullStack",
  },
  {
    profile: "",
    initial: "P",
    name: "Pepito",
    fullname: "Alfred John Bensig Pepito",
    id: "26-0077",
    group: 5,
    role: "Quality Assurance",
  },
  {
    profile: "",
    initial: "Q",
    name: "Quiruben",
    fullname: "Nino Quiruben",
    id: "26-0080",
    group: 4,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "R",
    name: "Recta",
    fullname: "Zion Sheimer Recta",
    id: "26-0293",
    group: 5,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "R",
    name: "Rondina",
    fullname: "Miguel Nino Rondina",
    id: "26-0060",
    group: 5,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "S",
    name: "Semblante",
    fullname: "Ryu Huris Semblante",
    id: "26-XXXX",
    group: 4,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "T",
    name: "Temperatura",
    fullname: "Jhon Paul Temperatura",
    id: "26-0256",
    group: 6,
    role: "Quality Assurance",
  },
  {
    profile: "",
    initial: "T",
    name: "Templa",
    fullname: "Kersey Binaluyo Templa",
    id: "26-0085",
    group: 6,
    role: "FullStack",
  },
  {
    profile: "",
    initial: "A",
    name: "Andriano",
    fullname: "Mariel Andriano",
    id: "26-0317",
    group: 1,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "B",
    name: "Balanuico",
    fullname: "Sheena Mae Balanuico",
    id: "26-0316",
    group: 6,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "M",
    name: "Maglasang",
    fullname: "Allaiza Faith Maglasang",
    id: "26-0083",
    group: 6,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "M",
    name: "Managaytay",
    fullname: "Managaytay Chris Nina",
    id: "26-0087",
    group: 1,
    role: "Frontend",
  },
  {
    profile: "",
    initial: "P",
    name: "Parallon",
    fullname: "Parallon Kay Lane",
    id: "26-0097",
    group: 5,
    role: "UI/UX Designer",
  },
  {
    profile: "",
    initial: "V",
    name: "Visoc",
    fullname: "Visoc Shane Tudtud",
    id: "26-0088",
    group: 2,
    role: "Frontend",
  },
];

export const renderStudents = () => {
  const studentList = document.getElementById("student-list");

  if (!studentList) return;

  studentList.innerHTML = "";

  students.forEach((student) => {
    const button = document.createElement("button");

    button.type = "button";
    button.className = "btn-tertiary btn-student shadow-md";

    button.innerHTML = `
      <h1>${student.initial}</h1>
      <div class="d-flex flex-column gap-2">
        <p>${student.name}</p>
        <p>${student.id}</p>
      </div>
    `;

    studentList.appendChild(button);
  });
};

export const renderDevelopmentTeam = () => {
  const roles = {
    "UI/UX Designer": {
      color: "var(--color-info-warning)",
      light: "var(--color-info-warning-light)",
      icon: "fa-palette",
    },

    "Quality Assurance": {
      color: "var(--color-info-info)",
      light: "var(--color-info-info-light)",
      icon: "fa-stamp",
    },

    FullStack: {
      color: "var(--color-info-success)",
      light: "var(--color-info-success-light)",
      icon: "fa-code",
    },

    Backend: {
      color: "var(--color-info-success)",
      light: "var(--color-info-success-light)",
      icon: "fa-code",
    },

    Frontend: {
      color: "var(--color-info-success)",
      light: "var(--color-info-success-light)",
      icon: "fa-code",
    },
  };

  const studentGroups = students.reduce((groups, student) => {
    if (!groups[student.group]) {
      groups[student.group] = [];
    }

    groups[student.group].push(student);

    return groups;
  }, {});

  const developmentTeam = document.getElementById("development-team");

  if (!developmentTeam) return;

  developmentTeam.innerHTML = "";

  Object.entries(studentGroups).forEach(([group, students]) => {
    const button = document.createElement("button");

    button.type = "button";
    button.className = "p-4 w-256 d-flex flex-column items-start rounded-md border-0 shadow-md";

    button.innerHTML = `
      <h1>Group</h1>

      <h1 class="text-40 text-light-gray">${group}</h1>

      <div class="mt-2 w-100 border-b border-light-gray"></div>

      <div class="mt-5 d-flex flex-column items-start gap-3">
        ${students
          .map((student) => {
            const role = roles[student.role] || {
              color: "var(--color-info-info)",
              light: "var(--color-info-info-light)",
            };

            return `
              <div class="d-flex flex-column items-start">
                <h1>${student.fullname}</h1>

                <span
                  class="mt-1 px-3 text-xs rounded-full"
                  style="
                    color: ${role.color};
                    background-color: ${role.light};
                  "
                >
                  <i class="fa-solid ${role.icon}"></i>
                  ${student.role}
                </span>
              </div>
            `;
          })
          .join("")}
      </div>
    `;

    developmentTeam.appendChild(button);
  });
};
