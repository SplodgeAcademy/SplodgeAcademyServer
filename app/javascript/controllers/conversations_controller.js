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

        // Get HTML elements
        const form = document.getElementById(formID);
        const commentBody = document.getElementById(commentBodyID);

        // Toggle visability
        form.classList.toggle("d-none");
        form.classList.toggle("mt-5");
        commentBody.classList.toggle("d-none");
    }
}
