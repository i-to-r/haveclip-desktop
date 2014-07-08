QT += network
greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TEMPLATE = app
TARGET = ../bin/haveclip

target.path = /usr/bin/
INSTALLS += target

DEPENDPATH += . \
	      src
INCLUDEPATH += . \
	       src

# Input
HEADERS += src/AboutDialog.h \
           src/AutoCompleteLineEdit.h \
           src/CertificateTrustDialog.h \
           src/HaveClip.h \
           src/LoginDialog.h \
	   src/SettingsDialog.h

FORMS += src/AboutDialog.ui \
         src/CertificateTrustDialog.ui \
         src/LoginDialog.ui \
	 src/SettingsDialog.ui

SOURCES += src/AboutDialog.cpp \
           src/AutoCompleteLineEdit.cpp \
           src/CertificateTrustDialog.cpp \
           src/HaveClip.cpp \
           src/LoginDialog.cpp \
	   src/SettingsDialog.cpp \
	   src/Main.cpp

RESOURCES += HaveClip.qrc

win32:RC_FILE = src/HaveClip.rc

win32:CONFIG(release, debug|release): LIBS += -L$$OUT_PWD/../haveclip-core/release/bin/ -lhaveclipcore
else:win32:CONFIG(debug, debug|release): LIBS += -L$$OUT_PWD/../haveclip-core/debug/bin/ -lhaveclipcore
else:unix: LIBS += -L$$OUT_PWD/../haveclip-core/bin/ -lhaveclipcore

INCLUDEPATH += $$PWD/../haveclip-core/src
DEPENDPATH += $$PWD/../haveclip-core/src

unix|win32: LIBS += -lqca
