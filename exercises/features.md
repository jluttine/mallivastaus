---
title:  "Features"
---

# Math

The most beautiful equation is

$$
e^{i\pi} + 1 =0
$$

where $i = \sqrt{-1}$.

Inline math is surrounded with `$` as `$i = \sqrt{-1}$` and display math is
surrounded with `$$` as ``$$e^{i\pi} + 1 = 0$$``.

# Programming

Ruby:

{% highlight ruby %}
def foo
  puts 'foo'
end
{% endhighlight %}


Python:

{% highlight python %}
def fib(n):
    if n < 2:
        return n
    return fib(n-2) + fib(n-1)
{% endhighlight %}

Haskell:

{% highlight haskell %}
sum :: [a] -> a
sum [] = 0
sum x:xs = x + sum xs
{% endhighlight %}

Syntax highlighting is created by `{% raw %}{% highlight language %}some code here{%
endhighlight %}{% endraw %}`.

# JavaScript

You can also use JavaScript libraries to create graphs, charts, visualizations
and whatever. They can be interactive as the example below shows:

<div markdown="0">
    <script src="http://www.chartjs.org/dist/2.7.2/Chart.bundle.js"></script>
	<script src="http://www.chartjs.org/samples/latest/utils.js"></script>

	<div id="canvas-holder" style="width:40%">
		<canvas id="chart-area"></canvas>
	</div>
	<button id="randomizeData">Randomize Data</button>
	<button id="addDataset">Add Dataset</button>
	<button id="removeDataset">Remove Dataset</button>
	<script>
		var randomScalingFactor = function() {
			return Math.round(Math.random() * 100);
		};

		var config = {
			type: 'pie',
			data: {
				datasets: [{
					data: [
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
						randomScalingFactor(),
					],
					backgroundColor: [
						window.chartColors.red,
						window.chartColors.orange,
						window.chartColors.yellow,
						window.chartColors.green,
						window.chartColors.blue,
					],
					label: 'Dataset 1'
				}],
				labels: [
					'Red',
					'Orange',
					'Yellow',
					'Green',
					'Blue'
				]
			},
			options: {
				responsive: true
			}
		};

		window.onload = function() {
			var ctx = document.getElementById('chart-area').getContext('2d');
			window.myPie = new Chart(ctx, config);
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			config.data.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});

			window.myPie.update();
		});

		var colorNames = Object.keys(window.chartColors);
		document.getElementById('addDataset').addEventListener('click', function() {
			var newDataset = {
				backgroundColor: [],
				data: [],
				label: 'New dataset ' + config.data.datasets.length,
			};

			for (var index = 0; index < config.data.labels.length; ++index) {
				newDataset.data.push(randomScalingFactor());

				var colorName = colorNames[index % colorNames.length];
				var newColor = window.chartColors[colorName];
				newDataset.backgroundColor.push(newColor);
			}

			config.data.datasets.push(newDataset);
			window.myPie.update();
		});

		document.getElementById('removeDataset').addEventListener('click', function() {
			config.data.datasets.splice(0, 1);
			window.myPie.update();
		});
	</script>
</div>

To achieve this, put arbitrary HTML code inside a div tag as follows:

    <div markdown="0">
    <b>Hello World!</b>
    </div>

Then you can use HTML, CSS and JavaScript as you would normally use within an
HTML file.

# Attachments

TODO: Adding PDF files and other attachments.
