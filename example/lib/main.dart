import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: new MyHomePage(title: 'flutter_html Example'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

const htmlData = """
<h1>Header 1</h1>
<h2>Header 2</h2>
<h3>Header 3</h3>
<h4>Header 4</h4>
<h5>Header 5</h5>
<h6>Header 6</h6>
<h3>Ruby Support:</h3>
      <p>
        <ruby>
          漢<rt>かん</rt>
          字<rt>じ</rt>
        </ruby>
        &nbsp;is Japanese Kanji.
      </p>
      <h3>Support for <code>sub</code>/<code>sup</code></h3>
      Solve for <var>x<sub>n</sub></var>: log<sub>2</sub>(<var>x</var><sup>2</sup>+<var>n</var>) = 9<sup>3</sup>
      <p>One of the most <span>common</span> equations in all of physics is <br /><var>E</var>=<var>m</var><var>c</var><sup>2</sup>.</p>
      <h3>Table support (with custom styling!):</h3>
      <p>
      <q>Famous quote...</q>
      </p>
      <table>
      <colgroup>
        <col width="50%" />
        <col width="25%" />
        <col width="25%" />
      </colgroup>
      <thead>
      <tr><th>One</th><th>Two</th><th>Three</th></tr>
      </thead>
      <tbody>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      <tr>
        <td>Data</td><td>Data</td><td>Data</td>
      </tr>
      </tbody>
      <tfoot>
      <tr><td>fData</td><td>fData</td><td>fData</td></tr>
      </tfoot>
      </table>
      <h3>Custom Element Support:</h3>
      <flutter></flutter>
      <flutter horizontal></flutter>
      <h3>SVG support:</h3>
      <svg id='svg1' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'>
            <circle r="32" cx="35" cy="65" fill="#F00" opacity="0.5"/>
            <circle r="32" cx="65" cy="65" fill="#0F0" opacity="0.5"/>
            <circle r="32" cx="50" cy="35" fill="#00F" opacity="0.5"/>
      </svg>
      <h3>List support:</h3>
      <ol>
            <li>This</li>
            <li><p>is</p></li>
            <li>an</li>
            <li>
            ordered
            <ul>
            <li>With<br /><br />...</li>
            <li>a</li>
            <li>nested</li>
            <li>unordered
            <ol>
            <li>With a nested</li>
            <li>ordered list.</li>
            </ol>
            </li>
            <li>list</li>
            </ul>
            </li>
            <li>list! Lorem ipsum dolor sit amet.</li>
            <li><h2>Header 2</h2></li>
            <h2><li>Header 2</li></h2>
      </ol>
      <h3>Link support:</h3>
      <p>
        Linking to <a href='https://github.com'>websites</a> has never been easier.
      </p>
      <h3>Image support:</h3>
      <p>
        <img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' />
        <a href='https://google.com'><img alt='Google' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30dp.png' /></a>
        <img alt='Alt Text of an intentionally broken image' src='https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_92x30d' />
      </p>
      <h3>Video support:</h3>
      <video controls>
        <source src="https://www.w3schools.com/html/mov_bbb.mp4" />
      </video>
      <h3>Audio support:</h3>
      <audio controls>
        <source src="https://www.w3schools.com/html/horse.mp3" />
      </audio>
      <h3>IFrame support:</h3>
      <iframe src="https://google.com"></iframe>
      <p>Morgen ist Wahltag in Amerika. Morgen wird entschieden, wer in Amerika für die nächsten vier Jahre das Amt des Präsidenten einnimmt. Das Wahlsystem in Amerika ist grundlegend anders als das System in der Schweiz. Politologe Dr. Tobias Arnold erklärt, wieso in den USA ein Zweiparteiensystem vorherrschend ist und in welchen Punkten sich das amerikanische Wahlsystem vom schweizerischen Wahlsystem unterscheidet.&nbsp;</p>\r\n         
      <div class=\"audio-file\">
      <figure>\n
      <img alt='audio' src='https://3fach.ch/storage/app/uploads/public/5fa/a57/41b/thumb_18567_140_140_0_0_crop.jpg' />    
      <figcaption>Test Meli</figcaption>             
      <audio controls src=\"https://3fach.ch/mp3/stooszyt/01080-1-praesidentschaftswahlen-den-usa.mp3\">\n                    
      Dein Browser unterstützt die Wiedergabe von MP3-Dateien nicht.\n                
      </audio>\n            
      </figure>\n
      </div>
      <p>
      <a href=\"https://khruangbin.bandcamp.com/album/mordechai\" rel=\"noopener noreferrer\" target=\"_blank\">Mordechai</a> 
      heisst das neue Album der Band <a href=\"https://www.instagram.com/khruangbin/\" rel=\"noopener noreferrer\" target=\"_blank\">Khruangbin</a>. 
      Zwei Begriffe, die fast nicht auszusprechen sind sondern mehr wie eine komische Ansammlung von Buchstaben aussieht. 
      Hinter Khruangbin steckt aber eine dreiköpfige Band. Laura Lee am Bass, Mar Speer an der Gitarre und Donald Jonson am Schlagzeug ergeben eine Mischung aus Thai-Funk aus den 1960erJahren mit weiteren Einflüssen, wie die Filmmusik vom Regisseur Quentin Tarantino.
      </p>\r\n\r\n
      <p>Dieser neue Mix aus psychedelischen Klängen gemischt mit ein bisschen Surf Rock ergeben das Album Mordechai von Khruangbin.</p>
      \r\n    
      <div class=\"audio\">\n          
      <figure>\n                
      <img class=\"audio__image\" src=\"https://preview.3fach.ch/storage/app/uploads/public/5fc/4eb/be0/thumb_16647_140_140_0_0_crop.jpg\" />\n                
      <figcaption>Whole lotta love</figcaption>\n            
      </figure>\n      
      <audio controls src=\"https://preview.3fach.ch/mp3/monde-sonore/00137-1-was-haben-thai-funk-tarantino-und-texas-gemeinsam.mp3\">\n            
      Dein Browser unterstützt die Wiedergabe von MP3-Dateien nicht.\n        
      </audio>\n    
      </div>\r\n\r\n<p>Durch die Quarantänezeit verkriechen sich die zwei Künstler der Band <a href=\"https://www.facebook.com/chromeo/\" rel=\"noopener noreferrer\" target=\"_blank\">Chromeo</a> in ihrem Studio schrieben den Song Clorox Wipe mehr aus einem Unterstützenden Grund, für all die Menschen, die zu Hause in Quarantäne seien. Die Resonanz auf diesen einen Song sei so überwältigend gewesen, dass die zwei New Yorker beschlossen ein ganzes Album daraus zu machen.</p>\r\n\r\n<p>Das Album <a href=\"https://chromeo.bandcamp.com/releases\" rel=\"noopener noreferrer\" target=\"_blank\">Quarantine Casanova</a>, mit elektrofunk vom Feinsten ist nun das Ergebnis und nur wärmstens zu empfehlen.</p>
""";

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text('flutter_html Example'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Html(
          data: htmlData,
          //Optional parameters:
          style: {
            "html": Style(
              backgroundColor: Colors.black12,
//              color: Colors.white,
            ),
//            "h1": Style(
//              textAlign: TextAlign.center,
//            ),
            "table": Style(
              backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
            ),
            "tr": Style(
              border: Border(bottom: BorderSide(color: Colors.grey)),
            ),
            "th": Style(
              padding: EdgeInsets.all(6),
              backgroundColor: Colors.grey,
            ),
            "td": Style(
              padding: EdgeInsets.all(6),
            ),
            "var": Style(fontFamily: 'serif'),
          },
          customRender: {
            "flutter": (RenderContext context, Widget child, attributes, _) {
              return FlutterLogo(
                style: (attributes['horizontal'] != null)
                    ? FlutterLogoStyle.horizontal
                    : FlutterLogoStyle.markOnly,
                textColor: context.style.color,
                size: context.style.fontSize.size * 5,
              );
            },
          },
          onLinkTap: (url) {
            print("Opening $url...");
          },
          onImageTap: (src) {
            print(src);
          },
          onImageError: (exception, stackTrace) {
            print(exception);
          },
        ),
      ),
    );
  }
}
