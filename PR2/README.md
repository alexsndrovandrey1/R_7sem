<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml" lang="en" xml:lang="en"><head>

<meta charset="utf-8">
<meta name="generator" content="quarto-1.3.353">

<meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes">


<title>PR2</title>
<style>
code{white-space: pre-wrap;}
span.smallcaps{font-variant: small-caps;}
div.columns{display: flex; gap: min(4vw, 1.5em);}
div.column{flex: auto; overflow-x: auto;}
div.hanging-indent{margin-left: 1.5em; text-indent: -1.5em;}
ul.task-list{list-style: none;}
ul.task-list li input[type="checkbox"] {
  width: 0.8em;
  margin: 0 0.8em 0.2em -1em; /* quarto-specific, see https://github.com/quarto-dev/quarto-cli/issues/4556 */ 
  vertical-align: middle;
}
/* CSS for syntax highlighting */
pre > code.sourceCode { white-space: pre; position: relative; }
pre > code.sourceCode > span { display: inline-block; line-height: 1.25; }
pre > code.sourceCode > span:empty { height: 1.2em; }
.sourceCode { overflow: visible; }
code.sourceCode > span { color: inherit; text-decoration: inherit; }
div.sourceCode { margin: 1em 0; }
pre.sourceCode { margin: 0; }
@media screen {
div.sourceCode { overflow: auto; }
}
@media print {
pre > code.sourceCode { white-space: pre-wrap; }
pre > code.sourceCode > span { text-indent: -5em; padding-left: 5em; }
}
pre.numberSource code
  { counter-reset: source-line 0; }
pre.numberSource code > span
  { position: relative; left: -4em; counter-increment: source-line; }
pre.numberSource code > span > a:first-child::before
  { content: counter(source-line);
    position: relative; left: -1em; text-align: right; vertical-align: baseline;
    border: none; display: inline-block;
    -webkit-touch-callout: none; -webkit-user-select: none;
    -khtml-user-select: none; -moz-user-select: none;
    -ms-user-select: none; user-select: none;
    padding: 0 4px; width: 4em;
  }
pre.numberSource { margin-left: 3em;  padding-left: 4px; }
div.sourceCode
  {   }
@media screen {
pre > code.sourceCode > span > a:first-child::before { text-decoration: underline; }
}
</style>


<script src="README_files/libs/clipboard/clipboard.min.js"></script>
<script src="README_files/libs/quarto-html/quarto.js"></script>
<script src="README_files/libs/quarto-html/popper.min.js"></script>
<script src="README_files/libs/quarto-html/tippy.umd.min.js"></script>
<script src="README_files/libs/quarto-html/anchor.min.js"></script>
<link href="README_files/libs/quarto-html/tippy.css" rel="stylesheet">
<link href="README_files/libs/quarto-html/quarto-syntax-highlighting.css" rel="stylesheet" id="quarto-text-highlighting-styles">
<script src="README_files/libs/bootstrap/bootstrap.min.js"></script>
<link href="README_files/libs/bootstrap/bootstrap-icons.css" rel="stylesheet">
<link href="README_files/libs/bootstrap/bootstrap.min.css" rel="stylesheet" id="quarto-bootstrap" data-mode="light">


</head>

<body class="fullcontent">

<div id="quarto-content" class="page-columns page-rows-contents page-layout-article">

<main class="content" id="quarto-document-content">

<header id="title-block-header" class="quarto-title-block default">
<div class="quarto-title">
<h1 class="title">PR2</h1>
</div>



<div class="quarto-title-meta">

    
  
    
  </div>
  

</header>

<section id="цель-работы" class="level2">
<h2 class="anchored" data-anchor-id="цель-работы">Цель работы</h2>
<ol type="1">
<li><p>Развить практические навыки использования языка программирования R для обработки данных.</p></li>
<li><p>Закрепить знания базовых типов данных языка R.</p></li>
<li><p>Развить пркатические навыки использования функций обработки данных пакета dplyr – функции select(), filter(), mutate(), arrange(), group_by().</p></li>
</ol>
</section>
<section id="исходные-данные" class="level2">
<h2 class="anchored" data-anchor-id="исходные-данные">Исходные данные</h2>
<ol type="1">
<li>RStudio</li>
</ol>
</section>
<section id="план" class="level2">
<h2 class="anchored" data-anchor-id="план">План</h2>
<ol type="1">
<li><p>Познакомиться с базовыми типами данных в языке R.</p></li>
<li><p>Выполнить задания.</p></li>
<li><p>Оформить отчет.</p></li>
</ol>
</section>
<section id="описание-шагов" class="level2">
<h2 class="anchored" data-anchor-id="описание-шагов">Описание шагов</h2>
<ol type="1">
<li>Установливаем библиотеку dplyr.</li>
</ol>
<pre><code>install.packages("dplyr")</code></pre>
<ol start="2" type="1">
<li>Загружаем пакет dplyr и загружаем датафрейм starwars.</li>
</ol>
<div class="cell">
<div class="sourceCode cell-code" id="cb2"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb2-1"><a href="#cb2-1" aria-hidden="true" tabindex="-1"></a><span class="fu">library</span>(dplyr)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stderr">
<pre><code>
Присоединяю пакет: 'dplyr'</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>Следующие объекты скрыты от 'package:stats':

    filter, lag</code></pre>
</div>
<div class="cell-output cell-output-stderr">
<pre><code>Следующие объекты скрыты от 'package:base':

    intersect, setdiff, setequal, union</code></pre>
</div>
<div class="sourceCode cell-code" id="cb6"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb6-1"><a href="#cb6-1" aria-hidden="true" tabindex="-1"></a><span class="fu">data</span>(starwars)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
</div>
<ol start="3" type="1">
<li>Переходим к выполнению заданий.</li>
</ol>
<ul>
<li>Задание 1. Сколько строк в датафрейме?</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb7"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb7-1"><a href="#cb7-1" aria-hidden="true" tabindex="-1"></a>n_rows <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span> <span class="fu">nrow</span>()</span>
<span id="cb7-2"><a href="#cb7-2" aria-hidden="true" tabindex="-1"></a>n_rows</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 87</code></pre>
</div>
</div>
<p>Присваиваем переменной n_rows кол-во строк в датафрейме, %&gt;% - используется для передачи данных из одной функции в другую, вызываем функцию nrow(), которая возвращает кол-во строк в датафрейме, выводим результат на экран.</p>
<ul>
<li>Задание 2. Сколько столбцов в датафрейме?</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb9"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb9-1"><a href="#cb9-1" aria-hidden="true" tabindex="-1"></a>n_columns <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span> <span class="fu">ncol</span>()</span>
<span id="cb9-2"><a href="#cb9-2" aria-hidden="true" tabindex="-1"></a>n_columns</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 14</code></pre>
</div>
</div>
<p>Присваиваем переменной n_columns кол-во столбцов в датафрейме, вызываем функцию ncol(), которая возвращает кол-во столбцов в датафрейме, выводим результат на экран.</p>
<ul>
<li>Задание 3. Как просмотреть примерный вид датафрейма?</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb11"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb11-1"><a href="#cb11-1" aria-hidden="true" tabindex="-1"></a>dataframe <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span> <span class="fu">glimpse</span>()</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>Rows: 87
Columns: 14
$ name       &lt;chr&gt; "Luke Skywalker", "C-3PO", "R2-D2", "Darth Vader", "Leia Or…
$ height     &lt;int&gt; 172, 167, 96, 202, 150, 178, 165, 97, 183, 182, 188, 180, 2…
$ mass       &lt;dbl&gt; 77.0, 75.0, 32.0, 136.0, 49.0, 120.0, 75.0, 32.0, 84.0, 77.…
$ hair_color &lt;chr&gt; "blond", NA, NA, "none", "brown", "brown, grey", "brown", N…
$ skin_color &lt;chr&gt; "fair", "gold", "white, blue", "white", "light", "light", "…
$ eye_color  &lt;chr&gt; "blue", "yellow", "red", "yellow", "brown", "blue", "blue",…
$ birth_year &lt;dbl&gt; 19.0, 112.0, 33.0, 41.9, 19.0, 52.0, 47.0, NA, 24.0, 57.0, …
$ sex        &lt;chr&gt; "male", "none", "none", "male", "female", "male", "female",…
$ gender     &lt;chr&gt; "masculine", "masculine", "masculine", "masculine", "femini…
$ homeworld  &lt;chr&gt; "Tatooine", "Tatooine", "Naboo", "Tatooine", "Alderaan", "T…
$ species    &lt;chr&gt; "Human", "Droid", "Droid", "Human", "Human", "Human", "Huma…
$ films      &lt;list&gt; &lt;"The Empire Strikes Back", "Revenge of the Sith", "Return…
$ vehicles   &lt;list&gt; &lt;"Snowspeeder", "Imperial Speeder Bike"&gt;, &lt;&gt;, &lt;&gt;, &lt;&gt;, "Imp…
$ starships  &lt;list&gt; &lt;"X-wing", "Imperial shuttle"&gt;, &lt;&gt;, &lt;&gt;, "TIE Advanced x1",…</code></pre>
</div>
<div class="sourceCode cell-code" id="cb13"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb13-1"><a href="#cb13-1" aria-hidden="true" tabindex="-1"></a>dataframe</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 87 × 14
   name     height  mass hair_color skin_color eye_color birth_year sex   gender
   &lt;chr&gt;     &lt;int&gt; &lt;dbl&gt; &lt;chr&gt;      &lt;chr&gt;      &lt;chr&gt;          &lt;dbl&gt; &lt;chr&gt; &lt;chr&gt; 
 1 Luke Sk…    172    77 blond      fair       blue            19   male  mascu…
 2 C-3PO       167    75 &lt;NA&gt;       gold       yellow         112   none  mascu…
 3 R2-D2        96    32 &lt;NA&gt;       white, bl… red             33   none  mascu…
 4 Darth V…    202   136 none       white      yellow          41.9 male  mascu…
 5 Leia Or…    150    49 brown      light      brown           19   fema… femin…
 6 Owen La…    178   120 brown, gr… light      blue            52   male  mascu…
 7 Beru Wh…    165    75 brown      light      blue            47   fema… femin…
 8 R5-D4        97    32 &lt;NA&gt;       white, red red             NA   none  mascu…
 9 Biggs D…    183    84 black      light      brown           24   male  mascu…
10 Obi-Wan…    182    77 auburn, w… fair       blue-gray       57   male  mascu…
# ℹ 77 more rows
# ℹ 5 more variables: homeworld &lt;chr&gt;, species &lt;chr&gt;, films &lt;list&gt;,
#   vehicles &lt;list&gt;, starships &lt;list&gt;</code></pre>
</div>
</div>
<p>Присваиваем переменной dataframe результат работы функции glimpse(), которая показывает краткую информацию о стрктуре датафрейма(кол-во строк, столбцов и типов данных в каждом столбце), выводим результат на экран.<br>
</p>
<ul>
<li>Задание 4. Сколько уникальных рас персонажей (species) представлено в данных?</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb15"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb15-1"><a href="#cb15-1" aria-hidden="true" tabindex="-1"></a>unique_species <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb15-2"><a href="#cb15-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">select</span>(species) <span class="sc">%&gt;%</span></span>
<span id="cb15-3"><a href="#cb15-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">distinct</span>() <span class="sc">%&gt;%</span></span>
<span id="cb15-4"><a href="#cb15-4" aria-hidden="true" tabindex="-1"></a>  <span class="fu">nrow</span>()</span>
<span id="cb15-5"><a href="#cb15-5" aria-hidden="true" tabindex="-1"></a>unique_species</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>[1] 38</code></pre>
</div>
</div>
<p>Присваиваем переменной unique_species результат работы функций: select(species) - выбираем столбец с расами, distinct() - удаляем повторяющиеся строки в выбранном столбце, оставляя только уникальные значения, nrow() - считаем кол-во строк в итоге и вывовим результат на экран.</p>
<ul>
<li>Задание 5. Найти самого высокого персонажа.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb17"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb17-1"><a href="#cb17-1" aria-hidden="true" tabindex="-1"></a>tallest_hero <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb17-2"><a href="#cb17-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">filter</span>(height <span class="sc">==</span> <span class="fu">max</span>(height, <span class="at">na.rm =</span> <span class="cn">TRUE</span>))</span>
<span id="cb17-3"><a href="#cb17-3" aria-hidden="true" tabindex="-1"></a><span class="fu">cat</span>(tallest_hero<span class="sc">$</span>name)</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>Yarael Poof</code></pre>
</div>
</div>
<p>Присваиваем переменной tallest_hero результат работы функций: filter(height == max(height, na.rm = TRUE)) - фильтруем датафрейм, оставляя только те строки, где значение в столбце height равно максимальному значению в столбце так же мы игнорируем отсутствующие значения(потому что если мы не укажем этого то если в столбце отсутствует хотя бы одно значение(NA), то функция max() вернет нам NA) и выводим резултат на экран .</p>
<ul>
<li>Задание 6. Найти всех персонажей ниже 170.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb19"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb19-1"><a href="#cb19-1" aria-hidden="true" tabindex="-1"></a>short_hero <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb19-2"><a href="#cb19-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">filter</span>(height <span class="sc">&lt;</span> <span class="dv">170</span>)</span>
<span id="cb19-3"><a href="#cb19-3" aria-hidden="true" tabindex="-1"></a><span class="fu">cat</span>(<span class="fu">paste</span>(short_hero<span class="sc">$</span>name, <span class="st">"</span><span class="sc">\n</span><span class="st">"</span>))</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code>C-3PO 
 R2-D2 
 Leia Organa 
 Beru Whitesun lars 
 R5-D4 
 Yoda 
 Mon Mothma 
 Wicket Systri Warrick 
 Nien Nunb 
 Watto 
 Sebulba 
 Shmi Skywalker 
 Dud Bolt 
 Gasgano 
 Ben Quadinaros 
 Cordé 
 Barriss Offee 
 Dormé 
 Zam Wesell 
 Jocasta Nu 
 Ratts Tyerell 
 R4-P17 
 Padmé Amidala </code></pre>
</div>
</div>
<p>Присваиваем переменной short_hero результат работы функций: filter(height &lt; 170) - aфильтруем строки датафрейма, оставляя только те значения в столбце height меньше 170 и выводим результат на экран, функция paste() - для объединения имени и фамилии героя в одну строку, разделенную пробелом; функция cat() - для вывода результатов в более читаемом формате.</p>
<p>Задание 7. Подсчитать ИМТ (индекс массы тела) для всех персонажей. ИМТ подсчитать по формуле 𝐼 = 𝑚/ℎ2 , где 𝑚 – масса (weight), а ℎ – рост (height).</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb21"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb21-1"><a href="#cb21-1" aria-hidden="true" tabindex="-1"></a>IMT <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb21-2"><a href="#cb21-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">mutate</span>(<span class="at">BMI =</span> mass <span class="sc">/</span> ((height<span class="sc">/</span><span class="dv">100</span>)<span class="sc">^</span><span class="dv">2</span>)) <span class="sc">%&gt;%</span></span>
<span id="cb21-3"><a href="#cb21-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">select</span>(name, BMI)</span>
<span id="cb21-4"><a href="#cb21-4" aria-hidden="true" tabindex="-1"></a>IMT</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 87 × 2
   name                 BMI
   &lt;chr&gt;              &lt;dbl&gt;
 1 Luke Skywalker      26.0
 2 C-3PO               26.9
 3 R2-D2               34.7
 4 Darth Vader         33.3
 5 Leia Organa         21.8
 6 Owen Lars           37.9
 7 Beru Whitesun lars  27.5
 8 R5-D4               34.0
 9 Biggs Darklighter   25.1
10 Obi-Wan Kenobi      23.2
# ℹ 77 more rows</code></pre>
</div>
</div>
<p>Присваиваем переменной IMT результат работы функций: mutate(BMI = mass / ((height/100)^2)) - создаем новый столбец BMI(индекс массы тела) с помощью mutate(), далее вычисляем индекс массы тела для каждого героя на основе их массы и роста и выводим результат на экран.</p>
<ul>
<li>Задание 8. Найти 10 самых “вытянутых” персонажей. “Вытянутость” оценить по отношению массы (mass) к росту (height) персонажей.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb23"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb23-1"><a href="#cb23-1" aria-hidden="true" tabindex="-1"></a>ten_elongated <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb23-2"><a href="#cb23-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">mutate</span>(<span class="at">elongation =</span> mass <span class="sc">/</span> height) <span class="sc">%&gt;%</span></span>
<span id="cb23-3"><a href="#cb23-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">arrange</span>(<span class="fu">desc</span>(elongation)) <span class="sc">%&gt;%</span></span>
<span id="cb23-4"><a href="#cb23-4" aria-hidden="true" tabindex="-1"></a>  <span class="fu">head</span>(<span class="dv">10</span>) <span class="sc">%&gt;%</span></span>
<span id="cb23-5"><a href="#cb23-5" aria-hidden="true" tabindex="-1"></a>  <span class="fu">select</span>(name, elongation)</span>
<span id="cb23-6"><a href="#cb23-6" aria-hidden="true" tabindex="-1"></a>ten_elongated</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 10 × 2
   name                  elongation
   &lt;chr&gt;                      &lt;dbl&gt;
 1 Jabba Desilijic Tiure      7.76 
 2 Grievous                   0.736
 3 IG-88                      0.7  
 4 Owen Lars                  0.674
 5 Darth Vader                0.673
 6 Jek Tono Porkins           0.611
 7 Bossk                      0.595
 8 Tarfful                    0.581
 9 Dexter Jettster            0.515
10 Chewbacca                  0.491</code></pre>
</div>
</div>
<p>Присваиваем переменной ten_elongated результат работы функций: mutate(elongation = mass / height) - создаем новый столбец в датафрейме elongation (вытянутость) и вычисляем вытянутость кажного героя, с помощью функции arrange(desc(elongation)) происходить упорядочивание таблицы по убыванию значения вытянутости, далее выбираем первые 10 строк head(10) и выводим результат на экран.</p>
<ul>
<li>Задание 9. Найти средний возраст персонажей каждой расы вселенной Звездных войн.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb25"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb25-1"><a href="#cb25-1" aria-hidden="true" tabindex="-1"></a>average_age_each_species <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb25-2"><a href="#cb25-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">group_by</span>(species) <span class="sc">%&gt;%</span></span>
<span id="cb25-3"><a href="#cb25-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">summarise</span>(<span class="at">average_age =</span> <span class="fu">mean</span>(birth_year, <span class="at">na.rm =</span> <span class="cn">TRUE</span>))</span>
<span id="cb25-4"><a href="#cb25-4" aria-hidden="true" tabindex="-1"></a>average_age_each_species</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 38 × 2
   species   average_age
   &lt;chr&gt;           &lt;dbl&gt;
 1 Aleena          NaN  
 2 Besalisk        NaN  
 3 Cerean           92  
 4 Chagrian        NaN  
 5 Clawdite        NaN  
 6 Droid            53.3
 7 Dug             NaN  
 8 Ewok              8  
 9 Geonosian       NaN  
10 Gungan           52  
# ℹ 28 more rows</code></pre>
</div>
</div>
<p>Присваиваем переменной average_age_each_species результат работы функций: group_by(species) - группируем данные по столбцу species, summarise(average_age = mean(birth_year, na.rm = TRUE)) - вычисляем средний возраст героев для каждого вида, используя функцию mean(), которая вычисляет среднее значение столбца birth_year, игнорируя при этом отсутствующие значения (NA) и выводим результат на экран в виде новой таблицы.</p>
<ul>
<li>Задание 10. Найти самый распространенный цвет глаз персонажей вселенной Звездных войн.</li>
</ul>
<div class="cell">
<div class="sourceCode cell-code" id="cb27"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb27-1"><a href="#cb27-1" aria-hidden="true" tabindex="-1"></a>color_eyes <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb27-2"><a href="#cb27-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">count</span>(eye_color) <span class="sc">%&gt;%</span></span>
<span id="cb27-3"><a href="#cb27-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">filter</span>(n <span class="sc">==</span> <span class="fu">max</span>(n))</span>
<span id="cb27-4"><a href="#cb27-4" aria-hidden="true" tabindex="-1"></a>color_eyes</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 1 × 2
  eye_color     n
  &lt;chr&gt;     &lt;int&gt;
1 brown        21</code></pre>
</div>
</div>
<p>Присваиваем переменной color_eyes результат работы функций: count(eye_color) - считает кол-во записей для каждого значеия в столбце eye_color, то есть создается новая таблица, содержащая столбцы eye_color и n (кол-во записей для каждого цвета глаз), filter(n == max(n)) - фитруем данные по условию, где n равно максимальному значению в таблице и выводим результат на экран.</p>
<p>-Задание 11. Подсчитать среднюю длину имени в каждой расе вселенной Звездных войн.</p>
<div class="cell">
<div class="sourceCode cell-code" id="cb29"><pre class="sourceCode r code-with-copy"><code class="sourceCode r"><span id="cb29-1"><a href="#cb29-1" aria-hidden="true" tabindex="-1"></a>average_len_name_each_species <span class="ot">&lt;-</span> starwars <span class="sc">%&gt;%</span></span>
<span id="cb29-2"><a href="#cb29-2" aria-hidden="true" tabindex="-1"></a>  <span class="fu">group_by</span>(species) <span class="sc">%&gt;%</span></span>
<span id="cb29-3"><a href="#cb29-3" aria-hidden="true" tabindex="-1"></a>  <span class="fu">summarise</span>(<span class="at">average_name_len =</span> <span class="fu">mean</span>(<span class="fu">nchar</span>(name)))</span>
<span id="cb29-4"><a href="#cb29-4" aria-hidden="true" tabindex="-1"></a>average_len_name_each_species</span></code><button title="Copy to Clipboard" class="code-copy-button"><i class="bi"></i></button></pre></div>
<div class="cell-output cell-output-stdout">
<pre><code># A tibble: 38 × 2
   species   average_name_len
   &lt;chr&gt;                &lt;dbl&gt;
 1 Aleena               13   
 2 Besalisk             15   
 3 Cerean               12   
 4 Chagrian             10   
 5 Clawdite             10   
 6 Droid                 4.83
 7 Dug                   7   
 8 Ewok                 21   
 9 Geonosian            17   
10 Gungan               11.7 
# ℹ 28 more rows</code></pre>
</div>
</div>
<p>Присваиваем переменной average_name_len_each_species результат работы функций: group_by(species) - группируем данные по значению в столбце species, summarise(average_name_len = mean(nchar(name))) - вычисляем суммарное хначение для каждой расы, nchar(name) - вычисляет длину имени, mean() - вычисляет среднее значение и выводим результат на экран.</p>
</section>
<section id="вывод" class="level2">
<h2 class="anchored" data-anchor-id="вывод">Вывод</h2>
<p>Развил практические навыки использования языка R для обработки данных, закрепил знания базовых типов данных в языке R и развил навыки использования функций обработки данных пакета dplyr.</p>
</section>

</main>
<!-- /main column -->
<script id="quarto-html-after-body" type="application/javascript">
window.document.addEventListener("DOMContentLoaded", function (event) {
  const toggleBodyColorMode = (bsSheetEl) => {
    const mode = bsSheetEl.getAttribute("data-mode");
    const bodyEl = window.document.querySelector("body");
    if (mode === "dark") {
      bodyEl.classList.add("quarto-dark");
      bodyEl.classList.remove("quarto-light");
    } else {
      bodyEl.classList.add("quarto-light");
      bodyEl.classList.remove("quarto-dark");
    }
  }
  const toggleBodyColorPrimary = () => {
    const bsSheetEl = window.document.querySelector("link#quarto-bootstrap");
    if (bsSheetEl) {
      toggleBodyColorMode(bsSheetEl);
    }
  }
  toggleBodyColorPrimary();  
  const icon = "";
  const anchorJS = new window.AnchorJS();
  anchorJS.options = {
    placement: 'right',
    icon: icon
  };
  anchorJS.add('.anchored');
  const isCodeAnnotation = (el) => {
    for (const clz of el.classList) {
      if (clz.startsWith('code-annotation-')) {                     
        return true;
      }
    }
    return false;
  }
  const clipboard = new window.ClipboardJS('.code-copy-button', {
    text: function(trigger) {
      const codeEl = trigger.previousElementSibling.cloneNode(true);
      for (const childEl of codeEl.children) {
        if (isCodeAnnotation(childEl)) {
          childEl.remove();
        }
      }
      return codeEl.innerText;
    }
  });
  clipboard.on('success', function(e) {
    // button target
    const button = e.trigger;
    // don't keep focus
    button.blur();
    // flash "checked"
    button.classList.add('code-copy-button-checked');
    var currentTitle = button.getAttribute("title");
    button.setAttribute("title", "Copied!");
    let tooltip;
    if (window.bootstrap) {
      button.setAttribute("data-bs-toggle", "tooltip");
      button.setAttribute("data-bs-placement", "left");
      button.setAttribute("data-bs-title", "Copied!");
      tooltip = new bootstrap.Tooltip(button, 
        { trigger: "manual", 
          customClass: "code-copy-button-tooltip",
          offset: [0, -8]});
      tooltip.show();    
    }
    setTimeout(function() {
      if (tooltip) {
        tooltip.hide();
        button.removeAttribute("data-bs-title");
        button.removeAttribute("data-bs-toggle");
        button.removeAttribute("data-bs-placement");
      }
      button.setAttribute("title", currentTitle);
      button.classList.remove('code-copy-button-checked');
    }, 1000);
    // clear code selection
    e.clearSelection();
  });
  function tippyHover(el, contentFn) {
    const config = {
      allowHTML: true,
      content: contentFn,
      maxWidth: 500,
      delay: 100,
      arrow: false,
      appendTo: function(el) {
          return el.parentElement;
      },
      interactive: true,
      interactiveBorder: 10,
      theme: 'quarto',
      placement: 'bottom-start'
    };
    window.tippy(el, config); 
  }
  const noterefs = window.document.querySelectorAll('a[role="doc-noteref"]');
  for (var i=0; i<noterefs.length; i++) {
    const ref = noterefs[i];
    tippyHover(ref, function() {
      // use id or data attribute instead here
      let href = ref.getAttribute('data-footnote-href') || ref.getAttribute('href');
      try { href = new URL(href).hash; } catch {}
      const id = href.replace(/^#\/?/, "");
      const note = window.document.getElementById(id);
      return note.innerHTML;
    });
  }
      let selectedAnnoteEl;
      const selectorForAnnotation = ( cell, annotation) => {
        let cellAttr = 'data-code-cell="' + cell + '"';
        let lineAttr = 'data-code-annotation="' +  annotation + '"';
        const selector = 'span[' + cellAttr + '][' + lineAttr + ']';
        return selector;
      }
      const selectCodeLines = (annoteEl) => {
        const doc = window.document;
        const targetCell = annoteEl.getAttribute("data-target-cell");
        const targetAnnotation = annoteEl.getAttribute("data-target-annotation");
        const annoteSpan = window.document.querySelector(selectorForAnnotation(targetCell, targetAnnotation));
        const lines = annoteSpan.getAttribute("data-code-lines").split(",");
        const lineIds = lines.map((line) => {
          return targetCell + "-" + line;
        })
        let top = null;
        let height = null;
        let parent = null;
        if (lineIds.length > 0) {
            //compute the position of the single el (top and bottom and make a div)
            const el = window.document.getElementById(lineIds[0]);
            top = el.offsetTop;
            height = el.offsetHeight;
            parent = el.parentElement.parentElement;
          if (lineIds.length > 1) {
            const lastEl = window.document.getElementById(lineIds[lineIds.length - 1]);
            const bottom = lastEl.offsetTop + lastEl.offsetHeight;
            height = bottom - top;
          }
          if (top !== null && height !== null && parent !== null) {
            // cook up a div (if necessary) and position it 
            let div = window.document.getElementById("code-annotation-line-highlight");
            if (div === null) {
              div = window.document.createElement("div");
              div.setAttribute("id", "code-annotation-line-highlight");
              div.style.position = 'absolute';
              parent.appendChild(div);
            }
            div.style.top = top - 2 + "px";
            div.style.height = height + 4 + "px";
            let gutterDiv = window.document.getElementById("code-annotation-line-highlight-gutter");
            if (gutterDiv === null) {
              gutterDiv = window.document.createElement("div");
              gutterDiv.setAttribute("id", "code-annotation-line-highlight-gutter");
              gutterDiv.style.position = 'absolute';
              const codeCell = window.document.getElementById(targetCell);
              const gutter = codeCell.querySelector('.code-annotation-gutter');
              gutter.appendChild(gutterDiv);
            }
            gutterDiv.style.top = top - 2 + "px";
            gutterDiv.style.height = height + 4 + "px";
          }
          selectedAnnoteEl = annoteEl;
        }
      };
      const unselectCodeLines = () => {
        const elementsIds = ["code-annotation-line-highlight", "code-annotation-line-highlight-gutter"];
        elementsIds.forEach((elId) => {
          const div = window.document.getElementById(elId);
          if (div) {
            div.remove();
          }
        });
        selectedAnnoteEl = undefined;
      };
      // Attach click handler to the DT
      const annoteDls = window.document.querySelectorAll('dt[data-target-cell]');
      for (const annoteDlNode of annoteDls) {
        annoteDlNode.addEventListener('click', (event) => {
          const clickedEl = event.target;
          if (clickedEl !== selectedAnnoteEl) {
            unselectCodeLines();
            const activeEl = window.document.querySelector('dt[data-target-cell].code-annotation-active');
            if (activeEl) {
              activeEl.classList.remove('code-annotation-active');
            }
            selectCodeLines(clickedEl);
            clickedEl.classList.add('code-annotation-active');
          } else {
            // Unselect the line
            unselectCodeLines();
            clickedEl.classList.remove('code-annotation-active');
          }
        });
      }
  const findCites = (el) => {
    const parentEl = el.parentElement;
    if (parentEl) {
      const cites = parentEl.dataset.cites;
      if (cites) {
        return {
          el,
          cites: cites.split(' ')
        };
      } else {
        return findCites(el.parentElement)
      }
    } else {
      return undefined;
    }
  };
  var bibliorefs = window.document.querySelectorAll('a[role="doc-biblioref"]');
  for (var i=0; i<bibliorefs.length; i++) {
    const ref = bibliorefs[i];
    const citeInfo = findCites(ref);
    if (citeInfo) {
      tippyHover(citeInfo.el, function() {
        var popup = window.document.createElement('div');
        citeInfo.cites.forEach(function(cite) {
          var citeDiv = window.document.createElement('div');
          citeDiv.classList.add('hanging-indent');
          citeDiv.classList.add('csl-entry');
          var biblioDiv = window.document.getElementById('ref-' + cite);
          if (biblioDiv) {
            citeDiv.innerHTML = biblioDiv.innerHTML;
          }
          popup.appendChild(citeDiv);
        });
        return popup.innerHTML;
      });
    }
  }
});
</script>
</div> <!-- /content -->



</body></html>