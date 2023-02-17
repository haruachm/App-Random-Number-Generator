# **랜덤 디자인 숫자 생성기**

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ff9ee6a5-3969-442b-bc89-c7559203a004/Untitled.gif)

</br>

---

## **랜덤 디자인 숫자 생성기 앱 위젯 스타일 꾸미기**

### **style 값 constant 폴더에 따로 관리하기**

- **constant 디렉터리 생성**
- **color 값을 모아줄 color.dart 파일 생성**
- **const로 색상 정의**

![https://blog.kakaocdn.net/dn/l56AN/btrZbpmYud8/qB8Qnqi4X9GXFtgrVzaRH1/img.png](https://blog.kakaocdn.net/dn/l56AN/btrZbpmYud8/qB8Qnqi4X9GXFtgrVzaRH1/img.png)

![https://blog.kakaocdn.net/dn/b7N5yz/btrZbrd9u4o/95Ag8laVMGANnS2LbBc8s0/img.png](https://blog.kakaocdn.net/dn/b7N5yz/btrZbrd9u4o/95Ag8laVMGANnS2LbBc8s0/img.png)

```
import 'package:flutter/material.dart';

const Color primary_color = Color(0xff2d2d33);
const Color red_color = Color(0xffae4955);
const Color blue_color = Color(0xff549fbf);
const Color green_color = Color(0xff26FF00);
const Color white_color = Color(0xffffffff);
```

---

### **다른 파일에 정의한 color 사용해보기**

- **style: TextStyle(color: white_color)** : const로 지정한 white_color를 Text 위젯에 적용한다.
- **icon: Icon(color: green_color)** : const로 지정한 green_color를 IconButton 위젯에 적용한다.
- **style: ElevatedButton.styleFrom(primary: )** : primary는 버튼이 활성화되었을 때의 주색상을 설정할 수 있다.

아래의 사진을 보면, **constant > color.dart 파일에서 지정한 색상을 color: _color로 사용**한 것을 확인할 수 있다.

![https://blog.kakaocdn.net/dn/FdIX0/btrZchPMMOJ/0KK9RVDZln7qLhtBlu8G3K/img.png](https://blog.kakaocdn.net/dn/FdIX0/btrZchPMMOJ/0KK9RVDZln7qLhtBlu8G3K/img.png)

```
class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primary_color,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  ' ⚡ NUMBER MAKER',
                  style: TextStyle(
                    color: white_color,
                    fontSize: 25,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.android_sharp,
                    color: green_color,
                  ),
                )
              ],
            ),
            Expanded(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('123'),
                Text('123'),
                Text('123'),
              ],
            )),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: red_color,
                ),
                onPressed: () {},
                child: Text('랜덤숫자 생성'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
```

---

### **보기 좋게 Padding 적용하기**

![https://blog.kakaocdn.net/dn/di03ya/btrZbo2UkNI/AszRbFdD2yFQOBcV6gqJ6K/img.png](https://blog.kakaocdn.net/dn/di03ya/btrZbo2UkNI/AszRbFdD2yFQOBcV6gqJ6K/img.png)

![https://blog.kakaocdn.net/dn/O2IdU/btrZbRKBQlg/LSlY6mnzpSVdK8RG9wWRN0/img.png](https://blog.kakaocdn.net/dn/O2IdU/btrZbRKBQlg/LSlY6mnzpSVdK8RG9wWRN0/img.png)

```
child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
          ...
        ),
```

---

---

## **화면에 랜덤 숫자 디자인 파일과 매칭시켜 나타내기**

**랜덤 숫자를 이미지 파일과 매칭시키기 위해서는 랜덤 숫자를 받아오고 나서 숫자 자릿수를 쪼개서, 1~9 중 어떤 수를 나타내는지 알아야 한다.**

**그러기 위해서는 Dart 언어의 split()와 map()을 사용해 숫자를 쪼개야 한다.**

### **Dart 언어, split()와 map() 함수 사용하기**

**예를 들어보자. 만약 아래와 같이 코드를 작성한다면 결과가 다음과 같다.**

```
void main() {
  final number = '1357';

  print(number.toString().split('').map((x) => '$x.jpg').toList());

  final numbers = [
    123,
    456,
    789
  ];

  print(numbers);
  print(numbers.map(
    (x) => x.toString().split('')));
  print(numbers.map((x) => x.toString().split('').map((y) => '$y.jpg').toList()));
  print(numbers.map((x) => x.toString().split('').map((y) => '$y.jpg').toList()).toList());
}

//[1.jpg, 3.jpg, 5.jpg, 7.jpg]//[123, 456, 789]//([1, 2, 3], [4, 5, 6], [7, 8, 9])////([1.jpg, 2.jpg, 3.jpg], [4.jpg, 5.jpg, 6.jpg], [7.jpg, 8.jpg, 9.jpg])//[[1.jpg, 2.jpg, 3.jpg], [4.jpg, 5.jpg, 6.jpg], [7.jpg, 8.jpg, 9.jpg]]
```

---

### **숫자 이미지 파일과 매칭시켜서 나타내보기**

![https://blog.kakaocdn.net/dn/bOC3n7/btrZeyqZiV8/yCRaE9S0kdpfxiB5qFhKQk/img.png](https://blog.kakaocdn.net/dn/bOC3n7/btrZeyqZiV8/yCRaE9S0kdpfxiB5qFhKQk/img.png)

위에서 그대로 다뤘던 코드를 **'asset/img/$x.png'**에만 적용시켰을 뿐이다.

```
Row(
                    children: 123456789
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              width: 40,
                              height: 60,
                            ))
                        .toList(),
                  ),
```

---

### **Row가 아닌 컬렉션과 Map()을 사용한 코드 줄이기**

![https://blog.kakaocdn.net/dn/oKgO1/btrZiPy7U2L/hAd0mECVDjWksm9Et98FfK/img.png](https://blog.kakaocdn.net/dn/oKgO1/btrZiPy7U2L/hAd0mECVDjWksm9Et98FfK/img.png)

아래의 두 코드를 비교해보면 Row가 아닌 컬렉션을 사용했을 때 얼마나 많은 코드가 단축되는지 파악할 수 있다.

### **Row()를 사용해 열 만들기**

```
Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                  	mainAxisAlignment: MainAxisAlignment.center,
                    children: 1234
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              width: 40,
                              height: 60,
                            ))
                        .toList(),
                  ),
                  Row(
                  	mainAxisAlignment: MainAxisAlignment.center,
                    children: 1234
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              width: 40,
                              height: 60,
                            ))
                        .toList(),
                  ),
                  Row(
                  	mainAxisAlignment: MainAxisAlignment.center,
                    children: 1234
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              width: 40,
                              height: 60,
                            ))
                        .toList(),
                  ),
                  Row(
                  	mainAxisAlignment: MainAxisAlignment.center,
                    children: 1234
                        .toString()
                        .split('')
                        .map((x) => Image.asset(
                              'asset/img/$x.png',
                              width: 40,
                              height: 60,
                            ))
                        .toList(),
                  ),
                ],
              )),
```

---

### **컬렉션과 Map 함수를 사용해 열 만들기**

```
Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    1234,
                    5678,
                    9012,
                    3456,
                  ]
                      .map(
                        (x) => Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: x
                              .toString()
                              .split('')
                              .map((x) => Image.asset(
                                    'asset/img/$x.png',
                                    width: 40,
                                    height: 60,
                                  ))
                              .toList(),
                        ),
                      )
                      .toList(),
                ),
              ),
```

---

### **Padding 값 주기. but 맨 마지막 요소 제외**

**EdgeInsets.only(bottom: 10)을 주어 아래 부분만 패딩 값을 적용한다.**

```
padding: const EdgeInsets.only(bottom: 10),
```

![https://blog.kakaocdn.net/dn/oKgO1/btrZiPy7U2L/hAd0mECVDjWksm9Et98FfK/img.png](https://blog.kakaocdn.net/dn/oKgO1/btrZiPy7U2L/hAd0mECVDjWksm9Et98FfK/img.png)

![https://blog.kakaocdn.net/dn/csJMlT/btrZjrLjcxC/jhdkCxkemcTrkEQzA73zKk/img.png](https://blog.kakaocdn.net/dn/csJMlT/btrZjrLjcxC/jhdkCxkemcTrkEQzA73zKk/img.png)

```
Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    1234,
                    5678,
                    9012,
                    3456,
                  ]
                      .map(
                        (x) => Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: x
                                .toString()
                                .split('')
                                .map((x) => Image.asset(
                                      'asset/img/$x.png',
                                      width: 40,
                                      height: 60,
                                    ))
                                .toList(),
                          ),
                        ),
                      )
                      .toList(),
                ),
              ),
```

그러나 위와 같이 패딩을 적용하면 **의도치 않게 맨 밑에 요소에도 패딩 값**이 들어가게 된다.

맨 아래에는 패딩 값을 제외하고 적용해보도록 하자. 이때 **asMap().entries를 사용**해 조건을 적용한다.

![https://blog.kakaocdn.net/dn/cjDqv1/btrZkRP2ZjZ/fOKCcm1sdlmXIHmHyikZ9K/img.png](https://blog.kakaocdn.net/dn/cjDqv1/btrZkRP2ZjZ/fOKCcm1sdlmXIHmHyikZ9K/img.png)

### **맨 밑에 요소 제외하고 패딩 적용해보기**

- **number.asMap().entries.toList()[].key**
- **number.asMap().entries.toList()[].value**

아래의 사진 부분에 asMap().entries와 x.key, x.value 값을 활용해준다.

![https://blog.kakaocdn.net/dn/bBVYX1/btrZg9rcZTD/y1nqreAriMkaBDY0vIuZxk/img.png](https://blog.kakaocdn.net/dn/bBVYX1/btrZg9rcZTD/y1nqreAriMkaBDY0vIuZxk/img.png)

만약 아래와 같이 조건문을 주게 되면 x.key 값이 1인 그러니까 entries, 즉 두 번째 줄이라면 바텀패딩을 0으로 준다는 말이 된다.

```
padding: EdgeInsets.only(bottom: x.key == 1 ? 0 : 30),
```

위의 코드처럼 작성하면 사진과 같이 2번째 줄 밑에 패딩 값이 0이 된다.

그렇다면 마지막 요소의 바텀 패딩을 0으로 주기 위해서는 '**x.key == 마지막 줄'**이 되면 된다.

![https://blog.kakaocdn.net/dn/cPPPqQ/btrZkavz6Tq/w9HoicX9CFc4S19pEGr8YK/img.png](https://blog.kakaocdn.net/dn/cPPPqQ/btrZkavz6Tq/w9HoicX9CFc4S19pEGr8YK/img.png)



