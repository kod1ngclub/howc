# Howc: C coding standard of Kod1ngclub

> v0.2.1

## Index

- Preprocessor - File guard
- Preprocessor - Include
- Preprocessor - If and else
- Statement - If
- Statement - Switch
- Statement - While
- Statement - For
- Statement - Goto
- Naming - Identifier
- Naming - Function
- Naming - Type
- Defination - Typedef
- Defination - Struct
- Defination - Union
- Defination - Enum
- Appendix - When to use C
- Appendix - Clean Arch in C

## Preprocessor - File guard

- Use file guard in `h` files
- Write a comment after `#endif` like following example

```h
#ifndef STORE_MODEL_FRUIT_H
#define STORE_MODEL_FRUIT_H

/*
 * And your
 * - datatypes
 * - function predef
 * - so on
 */

#endif // STORE_MODEL_FRUIT_H
```

## Preprocessor - Include

- Write `#include` from high-policy to low-policy
- Write `#include` from datatypes to functions
- Use doule-quotes in `#include`
- Write `#include` inside file guard

```c
#include "include/model/fruit.h"
#include "include/model/vegetable.h"
#include "include/model/meat.h"

#include "include/service/soup.h"
#include "include/service/steak.h"
#include "include/service/juice.h"

#include "include/repository/config.h"
#include "include/repository/fruit.h"
#include "include/repository/vegetable.h"
#include "include/repository/meat.h"

#include "lib/cJSON.h"
#include "lib/sqlite.3"

int main(void) {
    // and doing something
    // in MAIN component
    return 0;
}

/*
 * model        - 1st policy datatypes
 * service      - 1st policy functions
 * repository   - 2st policy functions
 * lib          - 3st policy datatypes and functions
 */
```

## Preprocessor - If and else

- Do not indent preprocessor
- `#include`, `#define`, `#if`, `#elif`, `#endif`, `#ifdef` and so on

```c
int main(void) {
    printf("Hello, World!");
    printf("Halo, World!");
    printf("Hiiillo, Word!");
    printf("Hao, Wold");

#if 1
    printf("If preprocessor passed!");
#endif

    return 0;
}
```