# Created by: Raphael Kubo da Costa <rakuco@FreeBSD.org>
# $FreeBSD$

PORTNAME=	libkcompactdisc
PORTVERSION=	${KDE4_VERSION}
PORTREVISION=	6
CATEGORIES=	audio kde kde-kde4

MAINTAINER=	kde@FreeBSD.org
COMMENT=	KDE library for interfacing with audio CDs

DEPRECATED=	KDE4 is EOL upstream
EXPIRATION_DATE=	2018-12-31

USES=		cmake:outsource kde:4 qt:4 tar:xz
USE_KDE=	automoc4 kdelibs
USE_QT=		phonon moc_build qmake_build rcc_build uic_build
USE_LDCONFIG=	yes

OPTIONS_DEFINE=	ALSA

ALSA_LIB_DEPENDS=	libasound.so:audio/alsa-lib

post-patch-ALSA-off:
	${REINPLACE_CMD} -e '/find_package(Alsa)/d' \
		-e '/alsa_configure_file/d' ${WRKSRC}/CMakeLists.txt

post-configure-ALSA-off:
	${TOUCH} ${CONFIGURE_WRKSRC}/config-alsa.h

.include <bsd.port.mk>
