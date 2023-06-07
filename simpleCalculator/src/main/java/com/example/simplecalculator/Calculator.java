package com.example.simplecalculator;

public class Calculator {
    public static float calculator(float firstOperand, float secondOperand, char operator) {
        switch (operator){
            case '+':
                return firstOperand + secondOperand;
            case '-':
                return firstOperand - secondOperand;
            case '*':
                return firstOperand * secondOperand;
            case '/':
                if (secondOperand != 0)
                    return firstOperand / secondOperand;
                else
                    throw new RuntimeException("Không thể chia cho số 0");
            default:
                throw new RuntimeException("Hoạt động không hợp lệ");
        }
    }
}
