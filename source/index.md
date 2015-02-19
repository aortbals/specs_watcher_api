---
title: API Reference

search: true
---

# Introduction

The Specs Watcher API searches through Spec’s online inventory. This project is just for fun, and is not meant to be relied on in any sort of *serious* capacity.

# Authentication

> Include an API key in the `Authorization` header of your request:

```shell
curl 'http://specs-watcher.herokuapp.com/search?q=balvenie'
  -H "Authorization: API_KEY"
```


Specs Watcher uses API keys to allow access to the API. Currently, API keys are not available to the public. If you'd like one, considering using the [open source project](https://github.com/aortbals/specs_watcher_api) yourself, or please [get in touch](mailto:me@aaronortbals.com).

Specs Watcher expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: API_KEY`

<aside class="notice">
You must replace `API_KEY` with an authorized API key.
</aside>

# Search

## Keyword Search


```shell
curl 'http://specs-watcher.herokuapp.com/search?q=balvenie'
  -H "Authorization: API_KEY"
```

> Example JSON response:

```json
[
  {
    "title": "BALVENIE  MALT * 12YR SINGLE BARREL 6/CS  [SCOTLAND]",
    "price": 72.41,
    "size": "750ML",
    "case_price": 386.65,
    "case_size": "Case [6]",
    "description": "",
    "image": "http://www.specsonline.com/prodpics/008366487306.jpg",
    "upc": "008366487306"
  },
  {
    "title": "BALVENIE MALT * 12YR DOUBLEWOOD  [SCOTLAND]",
    "price": 51.99,
    "size": "750ML",
    "case_price": 576.13,
    "case_size": "Case [12]",
    "description": "AMBER COLOUR. NOSE SHERRY AND ORANGE SKINS. MEDIUM RICH BODY. PALATE BEAUTIFULLY COMBINED FLAVOURS; NUTTY SWEET SHERRY ORANGERY FRUITINESS AND CINNAMON SPICINESS. FINISH LONG TINGLING WARM.",
    "image": "http://www.specsonline.com/prodpics/008366411221.jpg",
    "upc": "008366411221"
  }
]
```

This endpoint searches for items by keyword.

### HTTP Request

`GET http://specs-watcher.herokuapp.com/search?q=balvenie`

### Query Parameters

Parameter | Required | Default | Description
--------- | ------- | ------- | -----------
q | **yes** | none | The search query


# Availability

## Check Availability

```shell
curl 'http://specs-watcher.herokuapp.com/availability?zip=90210&upc=008366487306'
  -H "Authorization: API_KEY"
```

> Example JSON response:

```json
{
  "title": "BALVENIE  MALT * 12YR SINGLE BARREL 6/CS  [SCOTLAND] 750ML",
  "locations": [
    {
      "store_name": "00-Downtown",
      "availability": "Available"
    },
    {
      "store_name": "150-Dallas",
      "availability": "Available"
    }
  ]
}
```

This endpoint retrieves the availability of an item based on `zip` code and `upc`.

### HTTP Request

`GET http://specs-watcher.herokuapp.com/availability?zip=90210&upc=008366487306`

### Query Parameters

Parameter | Required | Default | Description
--------- | ------- | ------- | -----------
zip | **yes** | none | The zip code
upc | **yes** | none | The product UPC to check for


# Categories

## List Categories


```shell
curl 'http://specs-watcher.herokuapp.com/categories'
  -H "Authorization: API_KEY"
```

> Example JSON response:

```json
[
  "armagnac",
  "blended_whiskey",
  "bourbon",
  "boutique_bourbon",
  "brandy",
  "canadian_whiskey",
  "cocktails",
  "cognac",
  "cream_liqueurs",
  "decanters",
  "eau_de_vie",
  "flavored_vodka",
  "gift_liquor",
  "gin",
  "grappa",
  "imported_vodka",
  "irish_whisky",
  "liqueur",
  "miniatures_50ml",
  "other_whiskeys",
  "rum",
  "scotch_blends",
  "scotch_malts",
  "tequila",
  "tequila_super_premium",
  "us_vodka",
  "whiskey_flavored"
]
```

This endpoint lists the different categories that an item can fall under.

### HTTP Request

`GET http://specs-watcher.herokuapp.com/categories`


## List Items in a Category

```shell
curl 'http://specs-watcher.herokuapp.com/categories/rum'
  -H "Authorization: API_KEY"
```

> Example JSON response:

```json
[
  {
    "title": "10 CANE RUM  [TRINIDAD]",
    "price": 33.67,
    "size": "LT",
    "case_price": 187.2,
    "case_size": "Case [6]",
    "description": "",
    "image": "http://www.specsonline.com/prodpics/008807616445.jpg",
    "upc": "008807616445"
  },
  {
    "title": "10 CANE RUM  [TRINIDAD]",
    "price": 14.73,
    "size": "375ML",
    "case_price": 145.89,
    "case_size": "Case [12]",
    "description": "",
    "image": "http://www.specsonline.com/prodpics/008807616518.jpg",
    "upc": "008807616518"
  }
]
```

This endpoint lists all items in a category.

<aside class="notice">Keep in mind that this is an expensive query and should be cached locally. It limits to 1000 items, but this typically includes all items within a category.</aside>

### HTTP Request

`GET http://specs-watcher.herokuapp.com/categories/rum`

### URL Parameters

Parameter | Required | Default | Description
--------- | ------- | ------- | -----------
id | **yes** | none | The category to retrieve. Example: `rum`.
