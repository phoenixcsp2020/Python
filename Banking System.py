try:
    data = dict()
    choice = 1
    while choice != 0:
        print("\nWelcome To Our Banking System...!")
        choice = int(input("\n   MAIN MENU\n\n1. Add New Customer\n2. Add Cash\n3. Withdraw Cash\n4. Check Balance\n"
                           "5. Delete Customer\n0. Exit\n\nPlease Enter Your Choice : "))
        system('clear')
        li = list(data.keys())

        if choice == 1:                         # for new registration
            name = input("Enter your Name: ")
            if name in li:
                print("\n***** Already found *****")
            else:
                mob = int(input("Enter your Mob: "))
                amt = float(input("Enter Amount: "))
                data[name] = [mob, amt]
                print(f"\n         Successfully Registered...!\n"
                      f"\n         Your Name            = {name}"
                      f"\n         Your Mobile Number   = {data[name][0]}"
                      f"\n         Your current Balance = {data[name][1]}")

        elif choice == 2:                       # for deposit the money
            name = input("Enter your Name: ")
            if name in li:
                print(f"Your Account Balance = {data[name][1]}\n")
                amt = float(input("Enter Amount to deposit: "))
                data[name][1] += amt
                print(f"\n*** Successfully Deposited ***\n"
                      f"\n          Your Name            = {name}"
                      f"\n          Your Mobile Number   = {data[name][0]}"
                      f"\n          Your current Balance = {data[name][1]}")
            else:
                print("     Account not found....!")
        elif choice == 3:               # for cash withdrawal
            name = input("Enter your Name: ")
            if name in li:
                print(f"Your Account Balance = {data[name][1]}\n")
                amt = float(input("Enter Amount to withdraw: "))
                data[name][1] -= amt
                print(f"\n***** Successfully Deducted amount of {amt}\n"
                      f"\n          Your Name            = {name}"
                      f"\n          Your Mobile Number   = {data[name][0]}"
                      f"\n          Your current Balance = {data[name][1]}")
            else:
                print("Account not found....!")
        elif choice == 4:                   # for account deletion
            name = input("Enter your Name to check A/C Balance: ")
            if name in li:
                print(f"\n           Your Name            = {name}"
                      f"\n           Your Mobile Number   = {data[name][0]}"
                      f"\n           Your current Balance = {data[name][1]}")
            else:
                print("Account not found....!")
        elif choice == 5:
            name = input("Enter your Name to Delete A/C: ")
            if name in li:
                print(f"             Your Account Balance = {data[name][1]}\n")
                if data[name][1]==0:
                    print(f"\n       Your Name            = {name}"
                          f"\n       Your Mobile Number   = {data[name][0]}"
                          f"\n       Your current Balance = {data[name][1]}"
                          f"\n\n     Account has been deleted....!")
                    data.pop(name)
                else:
                    print("     Make sure Account is Zero Balance...\n"
                          "     Select option 3 in main menu..")
            else:
                print("         Account not found....!")

except:
    pass
finally:
    system('clear')
    print("\n!......THANKS FOR VISITING OUR BRANCH......!")



