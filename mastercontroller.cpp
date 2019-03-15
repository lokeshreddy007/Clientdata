#include "mastercontroller.h"

#include <QQmlApplicationEngine>
#include <QtSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include <QString>
#include <QStringList>
#include <QFileDevice>
#include <QCryptographicHash>
#include <QtQuick/qquickview.h>

#include <QJsonArray>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonValue>

using namespace std;

MasterController::MasterController(QObject *parent) : QObject(parent) {

}
//getter

QString MasterController::getFirstName() {
    return m_first_name;
}

QString MasterController::getSecondName() {
    return m_second_name;
}

QString MasterController::getEmail() {
    return m_email_name;
}

QString MasterController::getPhoneNumber() {
    return m_phone_number;
}

QString MasterController::getOfficer() {
    return m_officer_name;
}

QString MasterController::getImagePath() {
    return m_image_path;
}

QStringList MasterController::getClientsAll() {
    return m_clientall;
}

QString MasterController::getIndex() {
    return m_index;
}

QString MasterController::getUpdatingProblem() {
    return m_updating_problem;
}


//setter

void MasterController::setFirstName(QString firstName) {
    m_first_name = firstName;
}

void MasterController::setSecondName(QString secondName) {
    m_second_name = secondName;
}
void MasterController::setEmail(QString email) {
    m_email_name = email;
}

void MasterController::setPhoneNumber(QString phoneNumber) {
    m_phone_number = phoneNumber;
}

void MasterController::setOfficer(QString officer) {
    m_officer_name = officer;
}

void MasterController::setImagePath(QString imagePath) {
    m_image_path = imagePath;
}

void MasterController::setClientsAll(QStringList clientall) {
    m_clientall = clientall;
    qDebug() << m_clientall;

    emit clientsAllChanged();
}

void MasterController::setIndex(QString index) {
    m_index = index;
    emit indexChanged();
}

void MasterController::setUpdatingProblem(QString updatingProblem) {
    m_updating_problem = updatingProblem;
    emit updatingProblemChanged();
}

//funtion info: get's the  value from the createClientView.qml  and append to the text file

void MasterController::getClientData(QString firstName,QString secondName,QString email,QString phoneNumber,QString officer,QString imagePath) {
    //  setting value by calling setter

    setFirstName(firstName);
    setSecondName(secondName);
    setEmail(email);
    setPhoneNumber(phoneNumber);
    setOfficer(officer);
    setImagePath(imagePath);

    qDebug()<< getFirstName()<<getSecondName()<<getEmail()<<getPhoneNumber()<<getOfficer()<<imagePath;

    //  getting all values by  calling getter and assgin to QString

    QString clientData = getFirstName() + "," + getSecondName() +
            "," +getEmail() + "," + getPhoneNumber() + "," + getOfficer() + ","+getImagePath();

    //  Opening file and append data to the file

    QFile data("/home/lokeshreddy/Music/Clientdata/data.txt");
    if (data.open(QFile::Append)) {
        QTextStream out(&data);
        out << clientData << "\n";
    }

//    QFile::copy(imagePath, "");


}

//funtion info: this is used get the old details of the client before updating his new data this function is used in " updateClientData " function

QString getoldvalue(QString index) {

    int i =  index.split(" ")[0].toInt();    //convert the first part to Int
    QFile file("/home/lokeshreddy/Music/Clientdata/data.txt");
    QString line;
    QStringList Fname;
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)) {
        QTextStream stream(&file);
        while (!stream.atEnd()) {
            QString line = stream.readLine();
            Fname.append(line);
        }
        file.close();
        QString nowdata = Fname[i];
        return nowdata;
    } else {
        qDebug() << "not open";
    }
    return "null";
}

void MasterController::updateClientData(QString firstName, QString secondName, QString email, QString phoneNumber, QString officer,QString imagePath, QString index)
{
    QString oldData  = getoldvalue(index);   // using this function we get old values of the client
    qDebug()<<"first function data";
    qDebug() << oldData;
    QString updatedValue;

//    here we  used datatext to read all the data from the text file

    QFile data("/home/lokeshreddy/Music/Clientdata/data.txt");
    if (data.open(QIODevice::Text | QIODevice::ReadOnly)) {
        QString dataText = data.readAll();
        qDebug() << "inside the function after read text";
        qDebug()<<dataText;

//        passing the old data of the client  to regularexpression to find whereold data and using QString.replace method we insert new data

        QRegularExpression re(oldData);

        //  new values got

        QString replacementText(firstName + "," +secondName+
                                "," +email + "," + phoneNumber + "," + officer + ","+imagePath);

        dataText.replace(re, replacementText);
        // so here we replaced the old data with the new data and assgin to new String
        QString updatedValue = dataText;

//        setting the updated data to private variable
        setUpdatingProblem(updatedValue);

        qDebug()<< updatedValue;
        data.close();
        data.flush();
    }else {
        qDebug() << "not open";
    }
    // again opening and cleaning the data in text file so that we can insert the new updated updated data
    QFile file("/home/lokeshreddy/Music/Clientdata/data.txt");
    if(file.open(QIODevice::WriteOnly | QIODevice::Text)) {
        // We're going to streaming text to the file
        QTextStream stream(&file);
        stream <<'\n';
        file.close();
        file.flush();
        qDebug() << "Writing finished";
    } else {
        qDebug()<< "not open";
    }
    insertUpdatedValue(); // used to append the new data which we have in a private variable
}
void MasterController::insertUpdatedValue() {
    QString insertingValue = m_updating_problem;
    qDebug() << insertingValue;
    QFile data("/home/lokeshreddy/Music/Clientdata/data.txt");
    if (data.open(QFile::Append)) {
        QTextStream out(&data);
        out << insertingValue << "\n";
        qDebug()<<"completed!";
    }
}

// function info:  used to open the text and get only firstname of the client

void MasterController::displayClientData() {
    QFile file("/home/lokeshreddy/Music/Clientdata/data.txt");
    QString line;
    QStringList Fname;
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QTextStream stream(&file);
        while (!stream.atEnd()){
            QString line = stream.readLine();
            Fname.append(line);
        }
        file.close();
         qDebug() << Fname;
        /*
         the Fname will be like as show below so to get only firstname , i created function call "splitVale"

      Fname =["Lok,jhoioj,ijoijio,joiji,ojiijioj,file:///D:/learning/build-ClientData-Desktop_Qt_5_11_2_MinGW_32bit-Debug/code.jpg",
        "Rajesh,kjkjkk;d;fdf;,kmlm,km,klm,file:///D:/learning/build-ClientData-Desktop_Qt_5_11_2_MinGW_32bit-Debug/coding.jpg",
        "Kiran,jjnoiiokjiop,kijk,ipk,iopkoipko,file:///D:/learning/build-ClientData-Desktop_Qt_5_11_2_MinGW_32bit-Debug/programmer.png]
          */

        splitValue(Fname);
    }
    else {
        qDebug() << "not open";
    }
}

// function info:  iterating through length of the QStringlist[fname] and for  ever iteration we create a Qstring,split it and
//append the first values to QStringlist [allvalue]

void MasterController::splitValue(QStringList rowClientData) {
    qDebug() <<rowClientData[0];
    qDebug() <<rowClientData[1];
    //    qDebug() << rowClientData.length();

    QStringList allValue;
    for (int i=0;i<rowClientData.length();i++) {
        QString nowdata = rowClientData[i];
        QStringList list;
        list = nowdata.split(',');
        qDebug() << list;
        allValue.append(list[0]);
    }
    qDebug() << allValue;
    setClientsAll(allValue);  // setting the value
}

//function info: gets the selected client value by using the index

void MasterController::getOneClientData(QString index)
{
    setIndex(index);
    int i =  index.split(" ")[0].toInt();    //convert the first part to Int

    qDebug() << index;
    qDebug() << "in the function";
    QFile file("/home/lokeshreddy/Music/Clientdata/data.txt");
    QString line;
    QStringList Fname;
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QTextStream stream(&file);
        while (!stream.atEnd()){
            QString line = stream.readLine();
            Fname.append(line);
        }
        file.close();
        QString nowdata = Fname[i];
        qDebug() << nowdata;
        QStringList list;
        list = nowdata.split(',');  // split the value and setting the value to all the properties
        qDebug() << list;
        qDebug() << list[0];
        setFirstName(list[0]);
        setSecondName(list[1]);
        setEmail(list[2]);
        setPhoneNumber(list[3]);
        setOfficer(list[4]);
        setImagePath(list[5]);

    } else {
        qDebug() << "not open";
    }
}

void MasterController::grabImage()
{
//   it is in qt----  ui->myWidget->grab().save("image.png");

    //    QPixmap QScreen::grabWindow(WId window, int x = 0, int y = 0, int width = -1, int height = -1)

}



//i need to display all fname
// if he click on one of them i need to display that paritcural all line text






//this is using QProperty for all the value

//this is using only single string

/*
//void MasterController::encrpt()
//{
//    QString s = "hello world";
//    QString encodedPass = QString(QCryptographicHash::hash(("hello world"),QCryptographicHash::Md5));
//    qDebug() << encodedPass;

//}
void MasterController::setGetvalue(QString str)
{
    QFile data("/home/lokeshreddy/Music/Clientdata/data.txt");
    if (data.open(QFile::Append)) {
        QTextStream out(&data);
        out << str << "\n";
    }
}

void MasterController::getallvalue()
{
    QFile file("/home/lokeshreddy/Music/Clientdata/data.txt");
    QString line;
    if (file.open(QIODevice::ReadOnly | QIODevice::Text)){
        QTextStream stream(&file);
        while (!stream.atEnd()){
            line.append(stream.readLine()+"\n");
        }
        file.close();
        qDebug() << line;
        val = line;
        emit getvalueChanged();


    }
    else {
        qDebug() << "not open";
    }

}
void MasterController::updatedclientdata(QString str) {
    setGetvalue(str);

}

*/

//this function is for insert user enter data to mysql

/*
void MasterController::getui(QString fname,QString lname,QString email,QString pnum,QString officer) {
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("client");
    db.setUserName("root");
    db.setPassword("");
    if (db.open())
    {
        qDebug() << "Connected!";
        qDebug() << fname <<lname << email << pnum << officer ;

        //    QString command = "INSERT INTO `Client`(`fname`, `lname`, `email`, `pnum`, `off`) VALUES ('"
        //                   " + fname + ',' +lname + ','  +email + ',' +pnum + ',' + officer + ')';
        QSqlQuery query;
        query.prepare("INSERT INTO clientlist (fname, lname, email , pnum , off ) "
                      "VALUES (:fname, :lname, :email, :pum, :off)");
        query.bindValue(":fname", fname);
        query.bindValue(":lname", lname);
        query.bindValue(":email", email);
        query.bindValue(":pum", pnum);
        query.bindValue(":off", officer);
        query.exec();
    } else
    {
        qDebug() << "Failed to connect.";
    }
}
*/

//    this  get all   client  data form the database

/*
void MasterController::getClient() {

    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("client");
    db.setUserName("root");
    db.setPassword("");
    if (db.open())
    {
        qDebug() << "Connected!";
        QString command = "SELECT * FROM `clientlist` ";
        QSqlQuery query(db);
        QStringList clientName;
        QStringList clientId;
        if (query.exec(command)) {
            while (query.next()) {
                QString name = query.value("fname").toString();
                QString id = query.value("id").toString();
                clientName.append(name);
                clientId.append(id);
                qDebug() << name;
                qDebug() <<id;
            }
        }
        QQuickView ClientList;
        QQmlContext *ctxt = ClientList.rootContext();
        ctxt->setContextProperty("myModel", QVariant::fromValue(clientName));

        ClientList.setSource(QUrl("qrc:ClientList.qml"));
        ClientList.show();
        qDebug() << "Data in the Clienttable";
        qDebug() << clientId;
        qDebug() << clientName;
    } else {
        qDebug() << "Failed to connect.";
    }

}
*/

//    the get the data only if the  searched name is present in the databse

/*
QStringList MasterController::findClientByName(QString clientName) {
    qDebug() << clientName;
    QSqlDatabase db = QSqlDatabase::addDatabase("QMYSQL");
    db.setHostName("127.0.0.1");
    db.setPort(3306);
    db.setDatabaseName("client");
    db.setUserName("root");
    db.setPassword("");
    if (db.open())
    {
        qDebug() << "Connected!";
        QString command = "select fname,id from clientlist where fname='" + clientName +"'";
        QSqlQuery query(db);
        QStringList clientNameId;

        if(query.exec(command)) {
            if(query.size() > 0) {
                while (query.next()) {
                    qDebug() << "Client is present";

                    QString clientnamefromdata = query.value("fname").toString();
                    QString ClientIdfromdata =query.value("id").toString();
                    //                clientNameId.append(clientnamefromdata);
                    //                clientNameId.append(ClientIdfromdata);
                    qDebug() << clientnamefromdata;
                    qDebug() << ClientIdfromdata;
                }
                return clientNameId;
            } else {
                qDebug() << "client is not fount";


            }
        }
    } else
    {
        qDebug() << "Failed to connect.";

    }
    QStringList emptyid;
    return emptyid;
}
*/



