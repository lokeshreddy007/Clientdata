#include <QGuiApplication>
#include <QQuickView>

#include <mastercontroller.h>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

    QGuiApplication app(argc, argv);
    qmlRegisterType<MasterController>("CM",1,0,"MasterConterllor");

    MasterController masterController;

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("masterController",&masterController);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    if (engine.rootObjects().isEmpty())
        return -1;

    return app.exec();
}
