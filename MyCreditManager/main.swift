//
//  main.swift
//  MyCreditManager
//
//  Created by 이범준 on 11/22/22.
//

import Foundation

var classStudent = [Student]()
var studentCount = 0
var student: Student = Student()
var grade = ["A+","A","B+","B","C","C+","D","D+","F"]

while 1 == 1 {
    print("원하는 기능을 입력해주세요")
    print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제 5: 평점보기, X: 종료")
    let selectNumber = readLine()
    if let num = selectNumber, !selectNumber!.isEmpty {
        if num == "X" {
            print("프로그램을 종료합니다...")
            break
        } else if num == "1" {
            selectOne()
        } else if num == "2" {
            selectTwo()
        } else if num == "3" {
            selectThree()
        } else if num == "4" {
            selectFour()
        } else if num == "5" {
            selectFive()
        }
    } else {
        print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
    }
}

func selectOne() {
    print("추가할 학생의 이름을 알려주세요")
    let addStudent = readLine()
    if let stu = addStudent, !addStudent!.isEmpty {
        student.name = addStudent
        let existStudent = classStudent.contains{ $0 == student }
        if existStudent == true {
            print("\(stu)는 이미 존재하는 학생입니다\n")
        } else {
            classStudent.append(student)
            print("\(stu) 학생을 추가했습니다\n")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func selectTwo() { //예외처리 해야함
    print("삭제할 학생의 이름을 입력해주세요.")
    let deleteStudent = readLine()
    if let stu = deleteStudent, !deleteStudent!.isEmpty {
        student.name = stu
        if let index = classStudent.firstIndex(where: { $0.name == student.name }) {
            print("\(stu) 학생을 삭제 했습니다\n")
            classStudent.remove(at: index)
        } else {
            print("\(stu) 학생을 찾지 못했습니다\n")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func selectThree() {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let addGrade = Array(readLine()!.components(separatedBy: " "))
    if addGrade.count == 3 && transferGrade(addGrade[2]) != -1 {
        student.name = addGrade[0]
        if let index = classStudent.firstIndex(where: { $0.name == student.name }) {
            print("\(addGrade[0]) 학생의 \(addGrade[1])과목이 \(addGrade[2])로 추가(변경) 되었습니다\n")
            classStudent[index].classGrade[addGrade[1]] = addGrade[2]
        } else {
            print("\(addGrade[0]) 학생을 찾지 못했습니다\n")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func selectFour() {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    let deleteGrade = Array(readLine()!.components(separatedBy: " "))
    if deleteGrade.count == 2 {
        student.name = deleteGrade[0]
        if let index = classStudent.firstIndex(where: { $0.name == student.name}) {
            if (classStudent[index].classGrade.removeValue(forKey: deleteGrade[1]) != nil) == true {
                print("\(deleteGrade[0]) 학생의 \(deleteGrade[1]) 과목의 성적이 삭제되었습니다.")
            } else {
                print("\(deleteGrade[0]) 학생은 \(deleteGrade[1]) 과목을 수강하지 않았습니다.")
            }
        } else {
            print("\(deleteGrade[0]) 학생을 찾지 못했습니다\n")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func selectFive() {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    var meanStudent = readLine()
    if let stu = meanStudent, !meanStudent!.isEmpty {
        if let index = classStudent.firstIndex(where: { $0.name == stu }) {
            var mean: Float = 0
            var gradeCount: Float = 0
            for student in classStudent[index].classGrade {
                mean += transferGrade(student.value)
                gradeCount += 1
                print("\(student.key) : \(student.value)")
            }
            print("평점 : \(mean / gradeCount)")
        } else {
            print("학생을 찾지 못했습니다\n")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func transferGrade(_ grade: String) -> Float{
    if grade == "A+" {
        return 4.5
    } else if grade == "A" {
        return 4
    } else if grade == "B+" {
        return 3.5
    } else if grade == "B" {
        return 3
    } else if grade == "C+" {
        return 2.5
    } else if grade == "C" {
        return 2
    } else if grade == "D+" {
        return 1.5
    } else if grade == "D" {
        return 1
    } else if grade == "F" {
        return 0
    } else {
        return -1
    }
}
