import mysql.connector

mydb=mysql.connector.connect(host="localhost",user="root",password="MdbS!123",database="online_retail_store")

if mydb.is_connected():
  print("Connected")

cur=mydb.cursor()

print("WELCOME TO OUR ONLINE_RETAIL_GENERAL_STORE APP!!! ")

while True:
    print("choose one of the following options ")
    print("1.enter as admin ") 
    print("2.enter as customer ")
    print("3.enter as delivery person ") 
    print("4.exit ")
    choice=int(input())
    while (choice==1):


        print("1.login ")
        print("2.exit ")

        c=int(input())
                

        if (c==1):
            
            def func(Aemail,Apwd):

                q1=("select * from Admin where Aemail=%s and Apwd=%s")
                que=(Aemail,Apwd)
                cur.execute(q1,que)
                rows = cur.fetchall()
                if rows:
                    for row in rows:
                        print(row)
                else:
                    print("invalid details.enter again ")
                    Aemail=input("enter email id ")
                    Apwd=input("enter password ")
                    func(Aemail,Apwd)

            Aemail=input("enter email id ")
            Apwd=input("enter password ")
            func(Aemail,Apwd)
            while True:

                print("1.add new products to database ")
                print("3.delete products that are out of stock ")
                print("4.update price of a product")
                print("5.view all customer accounts")
                print("6.view all products")
                print("7.view all succesful orders")
                print("8.update stock quantity of specific product")
                print("9.view all delivery persons")
                print("10.exit ")

                ch=int(input())
                if(ch==1):
                    Prname=input("enter product name of product to add ")
                    Prprice=input("enter price ")
                    Prcategory=input("enter category ")
                    Prstatus=input("enter status")
                    Prunits= input("enter product units ")
                    q1=("Insert into Product(Prname,Prprice,Prcategory,Prstatus,Prunits) values(%s,%s,%s,%s,%s)")
                    que=(Prname,Prprice,Prcategory,Prstatus,Prunits) 
                    cur.execute(q1,que)
                    mydb.commit()
                    print(cur.rowcount,"product added")
                
                
                elif(ch==3):
                
                    cur.execute("delete from Product where Prstatus='Not Available' ")
                    mydb.commit()
                    print(cur.rowcount,"out of stock products deleted from cart ")

                

                elif(ch==4):
                    Prid=int(input("enter product id"))
                    Prprice=int(input("enter updated product price"))
                    q1=("Update Product set Prprice=%s where Prid=%s")
                    que=(Prprice,Prid)
                    cur.execute(q1,que)
                    mydb.commit()
                    cur.execute("SELECT * FROM product")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)
                    

                
                elif(ch==5):
                    cur.execute("SELECT * FROM User")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)
                


                elif(ch==6):
                    cur.execute("SELECT * FROM product")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)
                
                elif(ch==7):
              
                    cur.execute("select Oder.Oid,Oder.Uid,Oder.Deliverydate,Oder.Did from Oder,Payment where Oder.Uid=Payment.Uidd && Payment.PaymentStatus='SUCCESSFUL' ")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                elif(ch==8):
                    Prid=int(input("enter product id"))
                    Prunits=int(input("enter extra units to be added"))
                    q1=("update Product set Prunits= Prunits + %s where Prid=%s")
                    que=(Prunits,Prid)
                    cur.execute(q1,que)
                    mydb.commit()
                    cur.execute("SELECT * FROM product")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                elif(ch==9):
                    cur.execute("SELECT * FROM Deliveryperson")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                else:
                    break
        else:
            break

    while(choice==2):

        print("1.create a new account ")
        print("2.login ")
        print("3.exit ")

        c=int(input())
        if(c==1):

            Ufirstname=input("enter first name ")
            ULastname=input("enter last name ")
            Uemail=input("enter email id ")
            Upwd=input("enter password ")
            Uaddr=input("enter shipping address ")
            Uphone=int(input("enter phone number "))
            Udob=input("enter date of birth ")
            q1=("Insert into User (Ufirstname,ULastname,Uemail,Upwd,Uaddr,Uphone,Udob)values (%s,%s,%s,%s,%s,%s,%s)")
            que=(Ufirstname,ULastname,Uemail,Upwd,Uaddr,Uphone,Udob)
            cur.execute(q1,que)
            mydb.commit()
            print(cur.rowcount,"account created ")

        if (c==2):
            
            def func(Uemail,Upwd):

                q1=("select * from User where Uemail=%s and Upwd=%s")
                que=(Uemail,Upwd)
                cur.execute(q1,que)
                rows = cur.fetchall()
                if rows:
                    for row in rows:
                        print(row)
                else:
                    print("invalid details.enter again ")
                    Uemail=input("enter email id ")
                    Upwd=input("enter password ")
                    func(Uemail,Upwd)

            Uemail=input("enter email id ")
            Upwd=input("enter password ")
            func(Uemail,Upwd)
            while True:
                print("1.Browse products ")
                print("2.Add product to cart ")
                print("3.Delete product from cart ")
                print("4.View Cart ")
                print("5.View Order ")
                print("6.View Payment ")
                print("7.exit ")

                ch=int(input())
                if (ch==1):

                    cur.execute("SELECT * FROM product")
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                if(ch==2):

                    PUid=int(input("enter Puid "))
                    Prid=int(input("enter Prid "))
                    unit=int(input("enter units "))
                    Cid=int(input("enter Cid "))
                    q1=("Insert into PrUnit (PUid,Prid,unit,Cid) values (%s,%s,%s,%s)")
                    que=(PUid,Prid,unit,Cid)
                    cur.execute(q1,que)
                    mydb.commit()
                    print(cur.rowcount,"product added to cart ")
                    
                if(ch==3):

                    Prid=int(input("enter Prid "))
                    Cid=int(input("enter Cid "))
                    q1=("delete from PrUnit where Prid=%s and Cid=%s")
                    que=(Prid,Cid)
                    cur.execute(q1,que)
                    mydb.commit()
                    print(cur.rowcount,"product deleted from cart ")

                if(ch==4):

                    Cid=int(input("enter Cid "))
                    q=("select * from PrUnit where Cid=%s")
                    que=(Cid,)
                    cur.execute(q,que)
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                if(ch==5):

                    Uid=int(input("enter Uid "))
                    q=("select * from Oder where Uid =%s")
                    que=(Uid,)
                    cur.execute(q,que)
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                if(ch==6):

                    Uidd=int(input("enter Uid "))
                    q=("select * from Payment where Uidd =%s")
                    que=(Uidd,)
                    cur.execute(q,que)
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                if(ch==7):

                    break
        
        if(c==3):
            break

    while(choice==3):
        print("1.create a new account ")
        print("2.login ")
        print("3.exit ")

        c=int(input())
        if(c==1):

            DFirstname=input("enter first name ")
            DLastname=input("enter last name ")
            Demail=input("enter email id ")
            Dpwd=input("enter password ")
            Daddr=input("enter shipping address ")
            Dphone=int(input("enter phone number "))
            Dsalary=int(input("enter salary"))
            Daadhar=int(input("enter aadhar no"))
            Ddob=input("enter date of birth ")
            q1=("Insert into Deliveryperson (DFirstname,DLastname,Demail,Dpwd,Daddr,Dphone,Dsalary,Daadhar,Ddob)values (%s,%s,%s,%s,%s,%s,%s,%s,%s)")
            que=(DFirstname,DLastname,Demail,Dpwd,Daddr,Dphone,Dsalary,Daadhar,Ddob)
            cur.execute(q1,que)
            mydb.commit()
            print(cur.rowcount,"account created ")

        if (c==2):
            
            def func(Demail,Dpwd):

                q1=("select * from Deliveryperson where Demail=%s and Dpwd=%s")
                que=(Demail,Dpwd)
                cur.execute(q1,que)
                rows = cur.fetchall()
                if rows:
                    for row in rows:
                        print(row)
                else:
                    print("invalid details.enter again ")
                    Demail=input("enter email id ")
                    Dpwd=input("enter password ")
                    func(Demail,Dpwd)

            Demail=input("enter email id ")
            Dpwd=input("enter password ")
            func(Demail,Dpwd)
            while True:

                print("1.view order assigned")
                print("2.exit ")

                ch=int(input())
                if(ch==1):
                    Did=int(input("enter Did"))
                    q=("select Oder.Oid,Oder.Uid,Oder.Deliverydate,Payment.Pid,Payment.Pmethods,Payment.Pamount from Oder,Payment where Oder.Did=%s and Oder.Uid=Payment.Uidd and Payment.PaymentStatus='SUCCESSFUL' ")
                    que=(Did,)
                    cur.execute(q,que)
                    rows = cur.fetchall()
                    for row in rows:
                        print(row)

                elif(ch==2):
                    break
                
        break
        
    if(choice==4):            
        print("Bye!")
        break


