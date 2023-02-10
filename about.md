---
layout: page
title: About Hoa
permalink: /about/
---
 >*I am passionate about coding and delving into the code that drives the essence of life.*
 
Hello, I'm Hoa Nguyen (Nguyễn Thị Thanh Hòa). I am a pharmacist with a passion for maths and biology. My graduate thesis focused on screening small molecules to inhibit protein-protein interactions by using [pharmacophore](https://www.wikiwand.com/en/Pharmacophore), [docking](https://www.wikiwand.com/en/Docking_(molecular)), and [molecular dynamics](https://www.wikiwand.com/en/Molecular_dynamics). The literature review process for my thesis illuminated the limitless potential of Machine Learning in drug discovery, inspiring me to pursue a career in this fascinating field.

In my leisure time, I find joy in contributing to open-source projects, indulging in a good read, drawing, and experimenting in the kitchen with delicious recipes.


With a thirst for knowledge and a desire to ameliorate my writing skills, I have embarked on a journey to document my learning experiences on this page. If you happen to stumble upon my blogs, I hope you find something of value or at least an enjoyable read.

 
<!-- <html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis.css" type="text/css" />
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/vis/4.16.1/vis-network.min.js"> </script>

<style type="text/css">

        #mynetwork {
            width: 100%;
            height: 750px;
            background-color: #ffffff;
            position: relative;
            float: left;
        }

        

        

        
</style>

</head>

<body>
<div id = "mynetwork"></div>


<script type="text/javascript">

    // initialize global variables.
    var edges;
    var nodes;
    var network; 
    var container;
    var options, data;

    
    // This method is responsible for drawing the graph, returns the drawn network
    function drawGraph() {
        var container = document.getElementById('mynetwork');
        
        

        // parsing and collecting nodes and edges from the python
        nodes = new vis.DataSet([{"id": "Hoa Nguyen", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/Gau.jpg", "label": "Hoa Nguyen", "shape": "circularImage", "size": 50}, {"id": "Education", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/education.png", "label": "Education", "shape": "circularImage"}, {"id": "Luong The Vinh high school for the gifted", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/LTV.jpg", "label": "Luong The Vinh high school for the gifted", "shape": "circularImage"}, {"id": "University of Medicine and Pharmacy, Ho Chi Minh city", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/UMPHCM.png", "label": "University of Medicine and Pharmacy, Ho Chi Minh city", "shape": "circularImage"}, {"id": "VietAI", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/VietAI.png", "label": "VietAI", "shape": "circularImage"}, {"id": "Research Experience", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/research.png", "label": "Research Experience", "shape": "circularImage"}, {"id": "Online Research Club", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/ORC.png", "label": "Online Research Club", "shape": "circularImage"}, {"id": "Working Experience", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/working.png", "label": "Working Experience", "shape": "circularImage"}, {"id": "Cao Thang Eye Hospital", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/CTEH.png", "label": "Cao Thang Eye Hospital", "shape": "circularImage"}, {"id": "Hobbies", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/hobby.jpg", "label": "Hobbies", "shape": "circularImage"}, {"id": "Playing musical instruments", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/piano.jpg", "label": "Playing musical instruments", "shape": "circularImage"}, {"id": "Cycling", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/cycling.jpg", "label": "Cycling", "shape": "circularImage"}, {"id": "Drawing", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/drawing.png", "label": "Drawing", "shape": "circularImage"}, {"id": "Reading", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/reading.png", "label": "Reading", "shape": "circularImage"}, {"id": "Pasteur Institute", "image": "https://raw.githubusercontent.com/nguyenhoa93/cv_graph/master/images/pasteur.jpg", "label": "Pasteur Institute", "shape": "circularImage"}]);
        edges = new vis.DataSet([{"color": "#0B806C", "from": "Hoa Nguyen", "to": "Education"}, {"color": "#0B806C", "from": "Education", "to": "Luong The Vinh high school for the gifted"}, {"color": "#0B806C", "from": "Education", "to": "University of Medicine and Pharmacy, Ho Chi Minh city"}, {"color": "#0B806C", "from": "Education", "to": "VietAI"}, {"color": "#0B3080", "from": "Hoa Nguyen", "to": "Research Experience"}, {"color": "#0B3080", "from": "Research Experience", "to": "University of Medicine and Pharmacy, Ho Chi Minh city"}, {"color": "#0B3080", "from": "Research Experience", "to": "Online Research Club"}, {"color": "#805B0B", "from": "Hoa Nguyen", "to": "Working Experience"}, {"color": "#805B0B", "from": "Working Experience", "to": "VietAI"}, {"color": "#805B0B", "from": "Working Experience", "to": "Cao Thang Eye Hospital"}, {"color": "#800B64", "from": "Hoa Nguyen", "to": "Hobbies"}, {"color": "#800B64", "from": "Hobbies", "to": "Playing musical instruments"}, {"color": "#800B64", "from": "Hobbies", "to": "Cycling"}, {"color": "#800B64", "from": "Hobbies", "to": "Drawing"}, {"color": "#800B64", "from": "Hobbies", "to": "Reading"}, {"color": "#0B3080", "from": "Research Experience", "to": "Pasteur Institute"}, {"color": "#805B0B", "from": "Working Experience", "to": "Pasteur Institute"}]);

        // adding nodes and edges to the graph
        data = {nodes: nodes, edges: edges};

        var options = {"nodes": {"color": {"background": "rgba(255,253,248,1)"}}, "edges": {"color": {"inherit": true}, "smooth": true}, "physics": {"minVelocity": 0.75}};
        
        

        

        network = new vis.Network(container, data, options);

        


        

        return network;

    }

    drawGraph();

</script>
</body>
</html>

<sup>A simple interactive graph of my resume. <strong>Source code:</strong> [cv_graph](https://github.com/nguyenhoa93/cv_graph)</sup> -->