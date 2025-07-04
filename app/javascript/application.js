// app/javascript/application.js
import "@hotwired/turbo-rails"
import "controllers"
import "bootstrap"

// Optional: Initialize all Bootstrap components
document.addEventListener("DOMContentLoaded", function() {
  // Initialize Bootstrap tooltips
  var tooltipTriggerList = [].slice.call(document.querySelectorAll('[data-bs-toggle="tooltip"]'))
  var tooltipList = tooltipTriggerList.map(function (tooltipTriggerEl) {
    return new bootstrap.Tooltip(tooltipTriggerEl)
  })
})