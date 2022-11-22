//
//  main.swift
//  MyCreditManager
//
//  Created by 이범준 on 11/22/22.
//

import Foundation

print("원하는 기능을 입력해주세요")
print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제 5: 평점보기, X: 종료")
var classStudent = [Student]()
var studentCount = 0
var student: Student = Student()

var selectNumber = readLine()

while 1 == 1 {
    if selectNumber == "X" {
        print("프로그램을 종료합니다...")
    } else if selectNumber == "1" {
        selectOne()
    } else if selectNumber == "2" {
        selectTwo()
    } else if selectNumber == "3" {
        selectThree()
    } else if selectNumber == "4" {
        selectFour()
    }
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제 5: 평점보기, X: 종료")
    print(classStudent)
    selectNumber = readLine()
}
func selectOne() {
    print("추가할 학생의 이름을 알려주세요")
    let addStudent = readLine()!
    student.name = addStudent

    let existStudent = classStudent.contains{ $0 == student }
    if existStudent == true {
        print("\(addStudent)는 이미 존재하는 학생입니다\n")
    } else {
        classStudent.append(student)
        print("\(addStudent) 학생을 추가했습니다\n")
    }

}

func selectTwo() { //예외처리 해야함
    print("삭제할 학생의 이름을 입력해주세요.")
    let deleteStudent = readLine()
    student.name = deleteStudent
    if let index = classStudent.firstIndex(where: { $0.name == student.name }) {
        print("\(deleteStudent) 학생을 삭제 했습니다\n")
        classStudent.remove(at: index)
    } else {
        print("\(deleteStudent) 학생을 찾지 못했습니다\n")
    }
    
}

func selectThree() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let addGrade = Array(readLine()!.components(separatedBy: " "))
    student.name = addGrade[0]
    
    if let index = classStudent.firstIndex(where: { $0.name == student.name }) {
        print("\(addGrade[0]) 학생의 \(addGrade[1])과목이 \(addGrade[2])로 추가(변경) 되었습니다\n")
        classStudent[index].classGrade[addGrade[1]] = addGrade[2]
    } else {
        print("\(addGrade[0]) 학생을 찾지 못했습니다\n")
    }
}

func selectFour() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let deleteGrade = Array(readLine()!.components(separatedBy: " "))
    student.name = deleteGrade[0]
    if let index = classStudent.firstIndex(where: { $0.name == student.name }) { //이름이 있는 건 확인했으나 성적이 존재하는지 확인 필요
        classStudent[index].classGrade.removeValue(forKey: deleteGrade[1])
    } else {
        print("\(deleteGrade[0]) 학생을 찾지 못했습니다\n")
    }
}

