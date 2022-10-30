# Sublime-text

## Prerequisites

`Source Code Pro` Font should be installed as described in [Essentials](../essentials/essentials.md#Fonts) section.

## Install

```shell
# if you haven't already installed sublime-text, run:
brew install --cask --appdir=~/Applications sublime-text
```

### Install Package Control

1. Open the `Tools` menu
2. Select `Install Package Control…`
You will get message `Package Control was successfully installed`

Use the **_Command Palette_** and type `Install Package` to install any of the following packages.

To list installed packages: `Preferences -> Package Control -> List Packages`

### Recommended Plugins

Go to Sublime and do `CMD + Shift + P`

Type `install` and select `Package Control: Install Package`

Install the packages listed below:

1. Theme - Soda
2. SCSS
3. Markdown Preview
4. Monokai Extended
5. TypeScript

Go to `Preferences -> Select Theme...` and pick `Soda Light 3` or any other theme you like.

## Customization

Go to `Preferences -> Settings` and copy and paste following `JSON` in _**Right Panel**_

> Note: you can use my user [preferences](../../apps/sublimetext/preferences.json)

```json
{
  "bold_folder_labels": true,
  "color_scheme": "Packages/Monokai Extended/Monokai Extended.tmTheme",
  "font_face": "Consolas",
  "font_size": 14,
  "highlight_line": true,
  "highlight_modified_tabs": true,
  "ignored_packages": ["Vintage"],
  "indent_to_bracket": true,
  "rulers": [79],
  "tab_size": 2,
  "translate_tabs_to_spaces": true,
  "word_wrap": false
}
```
