<script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['Store', 'Success'],
		  ['Barnstaple', 12.5],
          ['Chippenham', 12.5],
		  ['Dover', 12.5],
		  ['Swindon', 12.5],
		  ['Bradford Girlington', 12.5],
		  ['Grimsby', 12.5],
		  ['Bicester', 12.5],
		  ['Redruth', 12.5],
		  
          
        ]);

        var options = {
          is3D: true,
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(data, options);
      }
    </script>