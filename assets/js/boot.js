(function() {
    var comments = document.getElementById('comments');

    if (comments) {
        // Add default text to the comments block
        var text = document.createTextNode("Chargement…");
        comments.appendChild(text);

        // Create the juvia script element
        var script = document.createElement("script");
        script.setAttribute("src", "/assets/js/juvia_embedding_code.js");
        script.setAttribute("type", "text/javascript");
        script.setAttribute("class", "juvia");
        console.log(script);
        document.body.appendChild(script);
    }
})();

