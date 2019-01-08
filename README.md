<p align="center">
<img src="https://github.com/95Revolution/Kiyamuda-pwa/blob/master/public/src/images/icons/app-icon-96x96.png" alt="Kiyamuda">
</p>
<h2 align="center">Kiyamuda</h2>

<p align="center">
<a href="https://github.com/95Revolution/Kiyamuda-pwa/blob/master/LICENSE"><img src="https://poser.pugx.org/laravel/framework/license.svg" alt="License"></a>
<a href="https://discord.gg/p9gHBZj"><img src="https://img.shields.io/badge/chat-on%20discord-7289da.svg" alt="Discord"></a>
<a href="https://join.slack.com/t/95revolution/shared_invite/enQtNDI0NDAxODg3NzgzLTdkMTZmMDM3N2E3MThlZTQwY2EzMjAzMWZjOTYwZGY2MjcyMzE4YmFiMzkzOTk1Yjg4MjI4ZWM1ZTc0NDI1ZWY"><img src="https://img.shields.io/badge/chat-on%20slack-7289da.svg" alt="Slack"></a>
<a href="https://app.fossa.io/projects/git%2Bgithub.com%2F95Revolution%2FKiyamuda-flutter?ref=badge_shield" alt="FOSSA Status"><img src="https://app.fossa.io/api/projects/git%2Bgithub.com%2F95Revolution%2FKiyamuda-flutter.svg?type=shield"/></a>
<a class="badge-align" href="https://www.codacy.com/app/DevDHera/Kiyamuda-flutter?utm_source=github.com&amp;utm_medium=referral&amp;utm_content=95Revolution/Kiyamuda-flutter&amp;utm_campaign=Badge_Grade"><img src="https://api.codacy.com/project/badge/Grade/49b1ccca1a1f482dabbfe4258adb3d3c"/></a>
</p>

# About Kiyamuda

Kiyamuda is a Geo-location based reviewing portal that hopes to bring accountability to both private & public sectors.

Kiyamuda is an open source initiative launched by `95Revolution` :blush: in order to spread goodwill :heart: for the Sri Lankan society.

If you are a _huge nerd_ like us help us to help you by contributing to this awesome adventure.

Show us you're capabilities :muscle: and the spread message about our journey!!!

## Tech Stack

Kiyamuda portal is fully powered with the worlds neweset **heartbreaker** `JS`. From backend to frontend all the bits are configured using the `MEAN` stack.

Also, we are actively developing our **Flutter** based app for your downloads. We are using the concepts of Flutter because our motto is,

> Be lazy, code less, run anywhere any way you want

### Current Progress

Right now we have successfully launched our alpha version of the Kiyamuda portal. Check the progress and contribute to the cause.

## How to setup

Clone the project using

```sh
git clone
```

Run the project via

```sh
flutter run
```
Now, find :beetle: and create issues so we can help you :grin:.

## Guidelines

We are modularizing our project for the ease of management. Flutter supports this by providing us the concept of `widgets`.

Following is a sample setup you can use anywhere.

```dart
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Kiyamuda'),
          ),
          body: ReportManager('Report Tester')),
    );
  }
}
```

## TO DO

Visit our [project board](https://github.com/95Revolution/Kiyamuda-pwa/projects/1) to get the latest details about the Kiyamuda portal

## License

[![FOSSA Status](https://app.fossa.io/api/projects/git%2Bgithub.com%2F95Revolution%2FKiyamuda-flutter.svg?type=large)](https://app.fossa.io/projects/git%2Bgithub.com%2F95Revolution%2FKiyamuda-flutter?ref=badge_large)
