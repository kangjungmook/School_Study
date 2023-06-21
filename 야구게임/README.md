## 야구 게임의 구현 설명

이 코드는 숫자 야구 게임을 구현한 Java 프로그램입니다. 
사용자는 1부터 9까지의 숫자 중에서 서로 다른 세 개의 숫자를 입력해야 합니다. 
컴퓨터는 랜덤으로 1부터 9까지의 서로 다른 세 개의 숫자를 선택하고, 사용자가 입력한 숫자와 비교하여 스트라이크와 볼을 판정합니다.

게임의 진행은 playGame() 메서드에서 처리됩니다. 이 메서드는 세 개의 랜덤 숫자를 생성하고,
용자로부터 입력을 받아 스트라이크와 볼을 계산합니다.
게임은 최대 10회까지 진행되며, 매 회마다 입력을 받고 결과를 출력합니다. 
게임 종료 조건은 스트라이크가 3개인 경우이거나 시도한 횟수가 10회를 초과하는 경우입니다.

main() 메서드는 프로그램의 시작점입니다. 사용자로부터 입력받은 숫자를 기반으로 게임을 시작하거나, 입력이 없는 경우 랜덤한 숫자로 게임을 시작합니다. 게임이 종료된 후 결과에 따라 메시지를 출력합니다.

따라서, 코드를 실행하면 숫자 야구 게임이 시작되며 사용자는 입력을 통해 게임을 진행합니다. 게임이 종료되면 결과에 따라 메시지가 출력됩니다.

---
### UserInput() 메서드
>usr이라는 길이가 3인 int 배열을 생성하여 사용자의 입력을 저장합니다.
BufferedReader 객체를 생성하여 사용자로부터 입력을 받을 준비를 합니다.
1부터 3까지 반복하면서 각각의 숫자를 입력받습니다.
입력이 유효한지 확인하기 위해 boolean 변수 a를 사용합니다. 초기에 a는 false로 설정됩니다.
유효한 입력이 들어올 때까지 반복합니다.
사용자에게 숫자 입력을 요청하는 메시지를 출력합니다.
BufferedReader를 사용하여 사용자 입력을 받습니다.
입력된 문자열을 정수로 변환하여 usr 배열에 저장합니다.
입력된 숫자가 1부터 9 사이의 범위인지 확인합니다. 범위를 벗어난 경우 오류 메시지를 출력합니다.
입력된 숫자가 이전에 입력한 숫자와 중복되지 않는지 확인합니다. 중복된 경우 오류 메시지를 출력합니다.
유효한 입력인 경우 a를 true로 설정하여 반복을 종료합니다.
숫자 형식이 아닌 입력이 들어온 경우 예외 처리하여 오류 메시지를 출력합니다.
입력이 유효하게 완료되면 usr 배열을 반환합니다.

```java
public static int[] UserInput() throws IOException {
		int[] usr = new int[3]; // 사용자 입력을 저장할 배열

		BufferedReader in = new BufferedReader(new InputStreamReader(System.in)); // 사용자로부터 입력을 받기 위한 BufferedReader 객체
		
		String input; // 사용자 입력을 저장할 변수

		for (int i = 0; i < 3; i++) { // 3번 반복하여 3개의 숫자를 입력받음
			boolean a = false; // 유효한 입력인지 확인하기 위한 변수

			while (!a) { // 유효한 입력이 들어올 때까지 반복
				System.out.print((i + 1) + "번째 숫자: "); // 사용자에게 입력을 요청하는 메시지 출력
				input = in.readLine(); // 사용자 입력 받기

				try {
					usr[i] = Integer.parseInt(input); // 입력받은 문자열을 정수로 변환하여 배열에 저장
					
					if (usr[i] < 1 || usr[i] > 9) { // 입력한 숫자가 1부터 9 사이의 범위인지 확인
						System.out.println("1부터 9까지의 숫자 중 하나를 입력해주세요."); // 범위를 벗어난 경우 오류 메시지 출력
					} else if (i > 0 && (usr[i] == usr[i - 1])) { // 중복된 숫자인지 확인
						System.out.println("모두 다른 숫자를 입력해주세요."); // 중복된 경우 오류 메시지 출력
					} else {	
						a = true; // 유효한 입력이면 반복 종료
					}
				} catch (NumberFormatException e) { // 숫자 형식이 아닌 경우 예외 처리
					System.out.println("올바른 숫자 형식이 아닙니다."); // 오류 메시지 출력
				}
			}
```

### playGame() 메서드
> x, y, z 변수에 랜덤으로 1부터 9까지의 서로 다른 세 개의 숫자를 저장합니다.<br>
사용자로부터 숫자를 입력받습니다. 입력된 숫자는 usr 배열에 저장됩니다.<br>
입력된 숫자가 유효한 범위인지와 서로 다른 숫자인지 확인합니다. 유효하지 않은 입력이면 적절한 메시지를 출력하고 다시 입력을 받습니다.<br>
입력된 숫자와 컴퓨터가 선택한 숫자를 비교하여 스트라이크와 볼의 개수를 계산합니다.<br>
스트라이크와 볼의 개수를 출력합니다.<br>
게임이 종료 조건인 스트라이크가 3개이거나 시도한 횟수가 10회를 초과한 경우까지 게임을 반복합니다.<br>
게임 종료 후 시도한 횟수를 반환합니다.
 ``` java
public static int playGame() throws IOException {
		int x, y, z;
		Random r = new Random();

		x = Math.abs(r.nextInt() % 9) + 1;

		do {
			y = Math.abs(r.nextInt() % 9) + 1;
		} while (y == x);

		do {
			z = Math.abs(r.nextInt() % 9) + 1;
		} while ((z == x) || (z == y));

		System.out.println(x + ", " + y + ", " + z);

		return playGame(x, y, z);
	}

 ```

### playGame(int x, int y, int z) 메서드
> x, y, z 매개변수는 컴퓨터가 선택한 숫자입니다.<br>
나머지 내용은 playGame() 메소드와 동일합니다.<br>
>  사용자로부터 입력을 받고, 스트라이크와 볼의 개수를 계산하여 출력합니다.
```java
public static int playGame(int x, int y, int z) throws IOException {
		int count; // 게임을 시도하는 횟수
		int strike, ball; // 숫자 매칭에 따른 결과

		int[] com = { x, y, z }; // 컴퓨터가 선택한 숫자 3개를 저장하는 배열

		System.out.println("숫자 야구 게임");

		count = 0;

		do {
			count++;

			System.out.println("\n카운트: " + count);

			int[] usr = UserInput();

			strike = ball = 0;

			if (usr[0] == com[0])
				strike++;
			if (usr[1] == com[1])
				strike++;
			if (usr[2] == com[2])
				strike++;

			if (usr[0] == com[1])
				ball++;
			if (usr[0] == com[2])
				ball++;
			if (usr[1] == com[0])
				ball++;
			if (usr[1] == com[2])
				ball++;
			if (usr[2] == com[0])
				ball++;
			if (usr[2] == com[1])
				ball++;

			System.out.println("Strike: " + strike + " Ball: " + ball);

		} while ((strike < 3) && (count < 11));

		return count;
	}
```

### main(String[] args) 메서드
>프로그램의 시작점입니다.<br>
명령줄 인수로 3개의 숫자가 전달된 경우, 해당 숫자를 기반으로 playGame(int x, int y, int z) 메소드를 호출합니다.<br>
명령줄 인수로 3개의 숫자가 전달되지 않은 경우, playGame() 메소드를 호출합니다.<br>
게임 종료 후 시도한 횟수에 따라 적절한 메시지를 출력합니다.
```java
public static void main(String[] args) throws IOException {
		int result;

		if (args.length == 3) {
			int x = Integer.valueOf(args[0]).intValue();
			int y = Integer.valueOf(args[1]).intValue();
			int z = Integer.valueOf(args[2]).intValue();

			result = playGame(x, y, z);
		} else {
			result = playGame();
		}

		System.out.println();

		if (result <= 2) {
			System.out.println("참 잘했어요!");
		} else if (result <= 5) {
			System.out.println("잘했어요!");
		} else if (result <= 9) {
			System.out.println("보통이네요!");
		} else {
			System.out.println("분발하세요!");
		}
	}
```
---

![image](https://github.com/kangjungmook/School_Study/assets/106642094/a4078671-5f0b-4064-808c-e3cb100c6d30)
