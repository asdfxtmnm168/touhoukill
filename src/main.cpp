#include <QDateTime>
#include <QDir>
#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QTranslator>

#include "engine.h"
#include "settings.h"

int main(int argc, char *argv[])
{
    QGuiApplication a(argc, argv);
#if defined(Q_OS_WIN)
    // QDir::setCurrent(a.applicationDirPath());
#elif defined(Q_OS_LINUX)
#ifdef Q_OS_ANDROID
    // TODO: copy all the files from qrc(or assets) to /sdcard
    QDir::setCurrent("/sdcard/TouhouSatsu");
#else
    // TODO: in prefixed build, assets shoule be read from /usr/share/TouhouSatsu, configs should be written to /etc
#endif
#elif defined(Q_OS_MACOS)
    // TODO: assets should be read from app bundle, configs should be written to the folder where the app bundle is lying
#elif defined(Q_OS_IOS)
    // wait for an expert in IOS
#else
#error "TouhouSatsu is not supperted on this platform."
#endif

    qsrand(QDateTime::currentMSecsSinceEpoch());

    QTranslator qtTranslator;
    QTranslator qSgsTranslator;
    qtTranslator.load("qt_zh_CN.qm");
    qSgsTranslator.load("sanguosha.qm");

    a.installTranslator(&qtTranslator);
    a.installTranslator(&qSgsTranslator);

    Sanguosha = new Engine;
    Config.init();

    a.setFont(Config.font());

    QQmlApplicationEngine appEngine;
    appEngine.rootContext()->setContextProperty("Sanguosha", Sanguosha);
    appEngine.rootContext()->setContextProperty("Config", &Config);
    appEngine.load("qml/MainWindow.qml");

    return a.exec();
}

#if 0
#include <QApplication>

#include <QCoreApplication>
#include <QDateTime>
#include <QDir>
#include <QTranslator>

#include "audio.h"
#include "banpair.h"
#include "mainwindow.h"
#include "server.h"
#include "settings.h"

int main(int argc, char *argv[])
{
    if (argc > 1 && strcmp(argv[1], "-server") == 0) {
        new QCoreApplication(argc, argv);
    } else {
        new QApplication(argc, argv);
        QCoreApplication::addLibraryPath(QCoreApplication::applicationDirPath() + "/plugins");
    }

    QDir::setCurrent(qApp->applicationDirPath());

#ifdef Q_OS_LINUX
    QDir dir(QString("lua"));
    if (dir.exists() && (dir.exists(QString("config.lua")))) {
        // things look good and use current dir
    } else {
        QDir::setCurrent(qApp->applicationFilePath().replace("games", "share"));
    }
#endif

    // initialize random seed for later use
    qsrand(QTime(0, 0, 0).secsTo(QTime::currentTime()));

    QTranslator qt_translator, translator;
    qt_translator.load("qt_zh_CN.qm");
    translator.load("sanguosha.qm");

    qApp->installTranslator(&qt_translator);
    qApp->installTranslator(&translator);

    Sanguosha = new Engine;
    Config.init();
    qApp->setFont(Config.AppFont);
    BanPair::loadBanPairs();

    if (qApp->arguments().contains("-server")) {
        Server *server = new Server(qApp);
        printf("Server is starting on port %u\n", Config.ServerPort);

        if (server->listen())
            printf("Starting successfully\n");
        else
            printf("Starting failed!\n");

        return qApp->exec();
    }

    QFile file("sanguosha.qss");
    if (file.open(QIODevice::ReadOnly)) {
        QTextStream stream(&file);
        qApp->setStyleSheet(stream.readAll());
    }

#ifdef AUDIO_SUPPORT
    Audio::init();
#endif

    MainWindow *main_window = new MainWindow;

    Sanguosha->setParent(main_window);
    main_window->show();

    foreach (QString arg, qApp->arguments()) {
        if (arg.startsWith("-connect:")) {
            arg.remove("-connect:");
            Config.HostAddress = arg;
            Config.setValue("HostAddress", arg);

            main_window->startConnection();
            break;
        }
    }

    int execResult = qApp->exec();
    delete qApp;
    return execResult;
}
#endif
