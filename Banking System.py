try:
    data = dict()
    opt = 1
    while opt != 0:
        print("\nWelcome To Our Bank...!")
        print("=======================")
        opt = int(input("\n    MAIN MENU\n    ---------\n\n1. Sign In\n2. Sign Up\n"
                        "3. Delete User\n0. Exit\n\nEnter your choice: "))
        li = list(data.keys())
        if opt == 1:
            Id = input("Enter User ID: ")
            if Id in li:
                pwd = input("Enter Password: ")
                if pwd == data[Id][0]:
                    choice = 1
                    while choice != 0:
                        choice = int(input("\n   SUB MENU\n   --------\n\n1. Add Cash\n2. Withdraw Cash\n"
                                           "3. Check Balance\n0. Sign out\n\nPlease Enter Your Choice : "))
                        if choice == 1:  # code for deposit
                            print(f"Your Account Balance = {data[Id][3]}\n")
                            amt = float(input("Enter Amount to deposit: "))
                            data[Id][3] += amt
                            print(f"\n*** Successfully Deposited ***\n"
                                  f"\n       User Id         : {Id}"
                                  f"\n       Name            : {data[Id][1]}"
                                  f"\n       Mobile Number   : {data[Id][2]}"
                                  f"\n       Current Balance : {data[Id][3]}")

                        elif choice == 2:  # code for withdraw
                            print(f"Your Account Balance = {data[Id][3]}\n")
                            amt = float(input("Enter Amount to withdraw: "))
                            if data[Id][3] < amt:
                                print(
                                    f"\nThere is no sufficient amount to withdraw...\nYou can withdraw only upto {data[Id][3]}.!")
                            else:
                                data[Id][3] -= amt
                                print(f"\n***** Successfully Deducted amount of {amt}\n"
                                      f"\n      User Id         : {Id}"
                                      f"\n      Name            : {data[Id][1]}"
                                      f"\n      Mobile Number   : {data[Id][2]}"
                                      f"\n      Current Balance : {data[Id][3]}")

                        elif choice == 3:  # code for balance checking
                            print(f"\n    Account Balance Details...\n"
                                  f"\n      User Id         : {Id}"
                                  f"\n      Name            : {data[Id][1]}"
                                  f"\n      Mobile Number   : {data[Id][2]}"
                                  f"\n      Current Balance : {data[Id][3]}")
                else:
                    print("\n\tIncorrect Password.  Please try again...")
            else:
                print("\n\tUser not Found.  Please Sign Up...")
        elif opt == 2:
            Id = input(" Enter User ID: ")
            if Id in li:
                print("User ID already found....")
            else:
                pwd = input(" Enter Password: ")
                name = input(" Enter your name: ")
                mob = input(" Enter your Mobile Number: ")
                amt = 0.0
                data[Id] = [pwd, name, mob, amt]  # write to dictionary
                print(f"\n  successfully Registered.... "
                      f"\n    User ID  : {Id}"
                      f"\n    Password : **********"
                      f"\n    Name     : {data[Id][1]}"
                      f"\n    Mob      : {data[Id][2]}"
                      f"\n    Amount   : {data[Id][3]}")  # print(data)
        elif opt == 3:
            Id = input("Enter User ID: ")
            if Id in li:
                pwd = input("Enter Password: ")
                if pwd == data[Id][0]:
                    if data[Id][3] == 0:
                        print(f"\nAccount Balance : {data[Id][3]}")
                        print(f"\n  User Details.... "
                              f"\n    User ID : {Id}"
                              f"\n    Name    : {data[Id][1]}"
                              f"\n    Mob     : {data[Id][2]}"
                              f"\n    Amount  : {data[Id][3]}")
                        tex = input("Do you want to Delete the Account...(Y/N).: ")
                        if tex == 'Y' or tex == 'y':
                            del data[Id]
                            # data.pop()
                            print("    Account deleted successfully...")
                        else:
                            print("   Account is still exist...")
                    else:
                        print(f"\nAccount Balance : {data[Id][3]}\nMake sure Balance is zero")
            else:
                print("\n   User not found...")
        elif opt == 0:
            break
        else:
            print("\nPlease enter numbers either 1,2,3 or 0...only")
except:
    pass # print("Raised an Error")

finally:
    print("\n____________________________________________")
    print("!......THANKS FOR VISITING OUR BRANCH......!")
    print("--------------------------------------------")
