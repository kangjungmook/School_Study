package dddddd;

import java.util.*;
import java.io.*;

public class ddddd {
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
		}

		return usr; // 입력받은 숫자 배열 반환
	}

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
}
