package com.firstweb.portfolio;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PortfolioController {

    @GetMapping("/")
    public String home() {
        return "index";  // Serves src/main/resources/static/index.html
    }

    @GetMapping("/projects")
    public String projects() {
        return "projects";  // Serves projects.html
    }

    @GetMapping("/contact")
    public String contact() {
        return "contact";  // Serves contact.html
    }
}

