# Howc: C coding standard of Kod1ngclub

> v1.6.0

## Index

- Indent
- Preprocessor - File guard
- Preprocessor - Include
- Preprocessor - If and else
- Statement - If
- Statement - Switch
- Statement - While
- Statement - For
- Statement - Goto
- Identifier - Variable
- Identifier - Constant
- Identifier - Function
- Identifier - Type

## Indent

- Use 4 indent
- Use space for indent
- Exceptionally, use tab for indent in makefile

## Preprocessor - File guard

- Use file guard in header files
- Write a comment after `#endif` like following example

```h
#ifndef STORE_MODEL_FRUIT_H
#define STORE_MODEL_FRUIT_H

/*
 * Here is store/include/model/fruit.h
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

/*
 * model        - 1st policy datatypes
 * service      - 1st policy functions
 * repository   - 2st policy functions
 * lib          - 3st policy datatypes and functions
 */
```

## Preprocessor - If and else

- Do not indent preprocessor among codes
- Indent preprocessor among preprocessors
- `#include`, `#define`, `#if`, `#elif`, `#endif`, `#ifdef` and so on

```c
int main(void) {
    printf("Test code for preprocessor");

#if 1
    printf("If preprocessor passed!");
#endif

    return 0;
}
```

```c
#ifdef _WIN32
    #define SYSTEM_CLEAR    ("cls")
#else
    #define SYSTEM_CLEAR    ("clear")
#endif
```

## Statement - If

- If possible, use only for early-return
  - If not, use `switch` rather
- Use equal, lessor, greater expression (no number as boolean)

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

- If need to use fallthrough,  use `/* intentional fallthrough */`
- Write `assert(0)` in default case not meaningful codes
- If MUST use jump table optimization, implement it yourself

```c
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

- Use equal, lessor, greater expression
  - Don't use number as boolean for condition-expression
- Use `for` expression like following exmaple.

```c
const int count = 1000;

for (int i=0; i<count; i++) {
    printf("One loop!");
}
```

## Statement - Goto

- Don't use `goto` too much
- Only jump to lower-position label

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

## Identifier - Variable

- If local and mutable, use `name` form
- If static and mutable, use `s_name` form
- If global and mutables, use `g_name` form

---

- If local and constant, use `name` form
- If static and constant, use `NAME` form
- If global and constant, use `NAME` form

> Use `const` as much as possible in code

```c
static char* const s_name = "John"
char* const g_name = "James"

const char PREFIX = '>';

int main(void) {
    const char* const name = "Kate";

    printf("s_name %c %s", PREFIX, s_name);
    printf("g_name %c %s" PREFIX, g_name);
    pritnf("name %c %s", PREFIX, name);

    return 0;
}
```

## Identifier - Function

- Use 'verb' as a function name
- Use `is` for bool-returning function

> Use static function as possible

```c
// not this ❌
void line(const char* const text) {
    printf("%s\n", text);
}

// use this ✅
void writeline(const char* const text) {
    printf("%s\n", text);
}
```

```c
// not this ❌
return new_user(const unsigned long id) {
    ...
}

// use this ✅
return is_new_user(const unsigned long id) {
    ...
}
```

Use 'noun' as a function name, only in following cases.

- When used as a DSL-like syntax for library
- When conventional usage

```c
// (DSL-like)
int main(void) {
    html h = html(
        head(
            ...
        ),
        body(
            ...
        )
    );

    return 0;
}
```

```c
// (conventional)
int main(void) {
    intlist l = newintlist(3);
    intlist_randomset(l);

    int v1 = cdr(l);
    int v2 = cddr(l);

    printf("v1: %d", v1);
    printf("v2: %d", v2);
}

/*
 * 'cdr' is a conventional name of the first item of a list
 * 'cddr' is a conventional name of the second item of a list
 */
```

## Identifier - Type

- Basically, use `struct` `enum` `union` purely (with no `typedef)
  - For function pointer, exceptionally use `typedef`
- When need to redefine a type, only then use `typedef` and `_t`

```c
// not this ❌
typedef struct {
    const char* cosnt head;
    const char* const body;
} Doc;

// use this ✅
struct Doc {
    const char* const head;
    const char* const body;
};
```

```c
// not this ❌
typedef int numeric;

// use this ✅
typedef int numeric_t;

/*
 * This is sometimes used in firmware development
 */
```

```c
typedef void (*listened_callback_t);

/*
 * For function pointer,
 * exceptionally use typedef (but comply typename_t)
 */
```

- If wrapper-like type, use `typedef`.
- If wrapper-like type, use domain words as possible

```c
typedef struct { const UserId data; } OwnerId_t;
typedef struct { const UserId data; } TesterId_t;

void StartAutoTest(const OwnerId_t owner, const TesterId_t tester);

/*
 * ==== Situtation
 * - Here is header file
 * - Programmer submit a code to tester
 * - Tester runs 'AutoTest'
 * - If problem occurs, tell it to that programmer
 */
```
