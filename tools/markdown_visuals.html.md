---
title: "Markdown Visuals"
subtitle: "commonly use visuals"
format: 
  html:
    embed-resources: true
    toc: true
    code-fold: true
---






# Callout notes 


::: {.callout-note icon="true" title="Type I Errors" appearance="default"}
This is a note callout with:

- **icon enabled**

- **default appearance**

- **a custom title**
:::

::: {.callout-tip icon="false" title="Check Your Understanding" appearance="minimal"}
This is a tip callout with:
- **icon disabled**
- **minimal appearance**
- **a custom title**
:::

::: {.callout-important icon="true" title="Critical Info" appearance="default"}
This is an important callout with:
- **icon enabled**
- **default appearance**
- **a custom title**
:::

::: {.callout-warning icon="false" title="Warning Alert" appearance="minimal"}
This is a warning callout with:
- **icon disabled**
- **minimal appearance**
- **a custom title**



::: {.cell}

```{.r .cell-code}
print("can also have code chunks inside")
```

::: {.cell-output .cell-output-stdout}

```
[1] "can also have code chunks inside"
```


:::
:::




:::

::: {.callout-caution icon="false" appearance="minimal"}
This is a caution callout with:
- **icon disabled**
- **minimal appearance**
- **no title**
:::
