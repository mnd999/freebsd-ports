# $FreeBSD$

PORTNAME=	location
DISTVERSION=	${QT5_VERSION}
PORTREVISION=	2
CATEGORIES=	devel
PKGNAMEPREFIX=	qt5-

MAINTAINER=	kde@FreeBSD.org
COMMENT=	Qt location module

USE_QT=		concurrent core dbus declarative gui network buildtools_build
USES=		compiler:c++11-lang qmake:norecursive qt-dist:5,location

USE_LDCONFIG=	${PREFIX}/${QT_LIBDIR_REL}

.include <bsd.port.mk>
