#ifndef MASTERCONTROLLER_H
#define MASTERCONTROLLER_H

#include <QQmlApplicationEngine>
#include <QtSql>
#include <QSqlDatabase>
#include <QSqlQuery>
#include <QDebug>
#include<QQmlContext>
#include <QObject>
#include <QFile>
#include <QTextStream>
#include <QRegularExpression>
#include <QRegularExpressionMatch>
#include <QRegularExpressionMatchIterator>
#include <QtNetwork>
#include <QNetworkAccessManager>
#include <QNetworkReply>
#include <QNetworkRequest>

#include <QPixmap>
#include <QWidget>
#include <QScreen>
#include <QQuickWindow>



class MasterController : public QObject
{
    Q_OBJECT

//    Properties for the createClientview.qml

    Q_PROPERTY(QString firstName READ getFirstName WRITE setFirstName )
    Q_PROPERTY(QString secondName READ getSecondName WRITE setSecondName )
    Q_PROPERTY(QString email READ getEmail WRITE setEmail )
    Q_PROPERTY(QString phoneNumber READ getPhoneNumber WRITE setPhoneNumber )
    Q_PROPERTY(QString officer READ getOfficer WRITE setOfficer)
    Q_PROPERTY(QString imagePath READ getImagePath WRITE setImagePath)

//    Property to store all the client list
    Q_PROPERTY(QStringList clientsAll READ getClientsAll WRITE setClientsAll NOTIFY clientsAllChanged)

//    Property to hold the index of the selected client

    Q_PROPERTY(QString index READ getIndex WRITE setIndex NOTIFY indexChanged)

//    Property to hold the updated client data

    Q_PROPERTY(QString updatingProblem READ getUpdatingProblem WRITE setUpdatingProblem NOTIFY updatingProblemChanged)

public:
    explicit MasterController(QObject *parent = nullptr);
//    function to split the text that is opened from the text file

    void splitValue(QStringList rowClientData);
//    QStringList allClientData();

    //    Setter

    void setFirstName(QString firstName);
    void setSecondName(QString secondName);
    void setEmail(QString email);
    void setPhoneNumber(QString phoneNumber);
    void setOfficer(QString officer);
    void setImagePath(QString imagePath);
    void setClientsAll(QStringList clientall);
    void setIndex(QString index);
    void setUpdatingProblem(QString updatingProblem);

    //    getter

    QString getFirstName();
    QString getSecondName();
    QString getEmail();
    QString getPhoneNumber();
    QString getOfficer();
    QString getImagePath();
    QStringList getClientsAll();
    QString getIndex();
    QString getUpdatingProblem();

private:

    QString m_first_name;
    QString m_second_name;
    QString m_email_name;
    QString m_phone_number;
    QString m_officer_name;
    QString m_image_path;
    QStringList m_clientall;
    QString m_index;
    QString m_updating_problem;


signals:
    void clientDataChanged();
    void clientsAllChanged();
    void indexChanged();
    void updatingProblemChanged();
    void allClientDataChanged();


public slots:
    // get the user enter data from the createClientview.qml
    void getClientData(QString firstName,QString secondName,QString email,QString phoneNumber,QString officer,QString imagePath);

    // get the user enter data from the ClientInFo.qml
    void updateClientData(QString firstName,QString secondName,QString email,QString phoneNumber,QString officer,QString imagePath, QString index);

    // this function is used when the user need to update his details
    void insertUpdatedValue();

    // display client's fristname
    void displayClientData();

    // get the details of selected client
    void getOneClientData(QString index);
    void grabImage();
};

#endif // MASTERCONTROLLER_H


//in public
//    Q_INVOKABLE void encrpt();
//    Q_INVOKABLE void getui(QString fname,QString lname,QString email,QString pnum,QString officer);
//QFile::copy("/path/file", "/path/copy-of-file");

