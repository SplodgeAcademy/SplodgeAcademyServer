import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
    connect() {
    }


    toggleForm(event) {
        // Stop page from refreshing or popping to top
        event.preventDefault();
        event.stopPropagation();

        // Grab IDs from params
        const formID = event.params["form"];
        const commentBodyID = event.params["body"];
        const editButtonID = event.params["edit"];

        // Get HTML elements
        const form = document.getElementById(formID);
        const commentBody = document.getElementById(commentBodyID);
        const editButton = document.getElementById(editButtonID);

        // Toggle visability
        form.classList.toggle("d-none");
        form.classList.toggle("mt-5");
        commentBody.classList.toggle("d-none");

        // Toggle the edit button
        this.toggleEditButton(editButton);
    }


    // Helper to change text on edit button
    toggleEditButton(editButton) {
        if (editButton.innerText === "Edit") {
            editButton.innerText = "Cancel";
            this.toggleEditButtonClass(editButton);
        } else {
            editButton.innerText = "Edit";
            this.toggleEditButtonClass(editButton);
        }
    }

    // Helper to toggle button styling
    toggleEditButtonClass(editButton) {
        editButton.classList.toggle("btn-secondary");
        editButton.classList.toggle("btn-warning");
    }
}
