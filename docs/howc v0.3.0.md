# Howc: C coding standard of Kod1ngclub

> v0.3.0

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
// use this ✅

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
// use this ✅

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
// use this ✅

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

## Statement - If

- Use 4 space indent
- If possible, use `if` only for early-return
- Use equal, lessor, greater expression
  - Don't use number as boolean

```c
// not this ❌
if (grade == 'A') {
    printf("Grade is A-class");
} else if (grade == 'B') {
    printf("Grade is B-class");
}

// use this ✅
switch (grade) {
    case 'A':
        printf("Grade is A-class");
        break;
    case 'B':
        printf("Grade is B-class");
        break;
    //...
}
```

```c
// use this ✅
// If possible, use only for early-return
int div(int a, int b) {
    if (b == 0) return 0;
    return (a/b);
}
```

```c
// not this ❌
if (grade) {
    printf("Grade is not 0");
}

// use this ✅
if (grade != 0) {
    printf("Grade is not 0");
}
```

## Statement - Switch

- Use 4 space indent
- Don't use fall-through
- Don't write meaningful code in `default`
  - Write `assert(0)` in `default`

```c
// not this ❌
switch (grade) {
    case 'I':
        /* intentional fallthrough */
    case 'A':
        printf("Grade is A-class!");
        break;
    case 'B':
        printf("Grade is B-class!");
        break;
    // ...
}

// use this ✅
// (no intentional-fallthrough)
switch (grade) {
    case 'A':
        printf("Grade is A-class!");
        break;
    case 'B':
        printf("Grade is B-class!");
        break;
    // ...
}
```

```c
// not this ❌
switch (grade) {
    case 'A':
        printf("Grade is A-class!");
        break;
    case 'B':
        printf("Grade is B-class!");
        break;
    default:
        printf("Grade is undefined!");
}

// use this ✅
switch (grade) {
    case 'A':
        printf("Grade is A-class!");
        break;
    case 'B':
        printf("Grade is B-class!");
        break;
    default:
        assert(0);
}
```

## Statement - While

- Use 4 space indent
- Use equal, lessor, greater expression
  - Don't use number as boolean

```c
// not this ❌
int i = 10;
while (i) {
    printf("One loop!");
    i--;
}

// use this ✅
int i = 10;
while (i != 0) {
    printf("One loop!");
    i--;
}
```

## Statement - For

- Use 4 space indent
- Use `for` expression like following exmaple.

```c
for (int i=0; i<10; i++) {
    printf("One loop!");
}
```

If need `for` expression with array,
define iterable functions separately.

```c
void foreach(int* arr, void (*func)) {
    ...
}

// If need optimization, use 'inline function'
```

## Statement - Goto

- Don't use GOTO so much
- Only jump to low-position label

```c
int main(void) {
    int pos[3]  = [0, 0, 0];
    int a1[7]   = [0, 0, 0, 0, 0, 0, 0];
    int a2[7]   = [0, 0, 0, 0, 0, 0, 0];
    int a3[7]   = [0, 0, 0, 0, 1, 0, 0];

    for (int i=0; i<7; i++) {
        for (int j=0; j<7; j++) {
            for (int k=0; k<7; k++) {
                int a1ok = (a1[i] == 1);
                int a2ok = (a2[j] == 1);
                int a3ok = (a3[k] == 1);

                if (a1ok || a2ok || a3ok) {
                    pos[0]  = i;
                    pos[1]  = j;
                    pos[2]  = k;

                    goto endlabel;
                }
            }
        }
    }

endlabel:
    printf("pos: %d, %d, %d", pos[0], pos[1], pos[2]);
    return 0;
}
```
