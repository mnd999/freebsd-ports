# Created by: Radim Kolar <hsn@filez.com>
# $FreeBSD$

# Note to committers:
# With each version update, a new maven repository must be created and distributed
# so build is repeatable and cluster-safe.

PORTNAME=	snappy
PORTVERSION=	1.1.2.4
CATEGORIES=	archivers java
MASTER_SITES=	LOCAL/jgh/archivers/${PORTNAME}/:source3
PKGNAMESUFFIX=	java
EXTRACT_ONLY=   ${DISTNAME}${EXTRACT_SUFX} 

MAINTAINER=	mark@tranquillussoftware.co.uk
COMMENT=	Fast compressor/decompressor library

LICENSE=	APACHE20

BUILD_DEPENDS=	aclocal:devel/automake autoconf:devel/autoconf libtool:devel/libtool sbt:devel/sbt

USE_GITHUB=	yes
GH_ACCOUNT=	xerial google:snappylib
GH_PROJECT=	snappy-java snappy:snappylib
GH_TAGNAME=	1ff9be9:snappylib

USE_JAVA=	yes
JAVA_VERSION=	1.7+
USES=		gmake
USE_LDCONFIG=	yes
MAKE_ARGS+=	Default_CXX=${CXX} SNAPPY_SRC_DIR=target/snappy-1ff9be9 SBT=/usr/local/bin/sbt

PLIST_FILES=	%%JAVAJARDIR%%/snappy-java.jar lib/libsnappyjava.so

post-patch:
	@${REINPLACE_CMD} -e 's|curl.*||g ; \
		s|MVN:=mvn|MVN:=${LOCALBASE}/share/java/maven3/bin/mvn -Dmaven.repo.local=${WRKDIR}/repository --offline|g' \
		${WRKSRC}/Makefile

do-build:
	@${MKDIR} ${WRKSRC}/target
	@${CP} ${DISTDIR}/google-snappy-1ff9be9_GH0.tar.gz ${WRKSRC}/target/snappy-1.1.2.tar.gz
	cd ${WRKSRC} && ${SETENV} JAVA_HOME=${JAVA_HOME} ${SETENV} ${MAKE_ENV} ${MAKE_CMD} ${MAKE_ARGS}

do-install:
	${INSTALL_DATA} ${WRKSRC}/target/snappy-java-${PORTVERSION}.jar \
		${STAGEDIR}${JAVAJARDIR}/snappy-java.jar
	${INSTALL_LIB} ${WRKSRC}/target/snappy-${PORTVERSION:R}-FreeBSD-x86_64/libsnappyjava.so \
		${STAGEDIR}${LOCALBASE}/lib

.include <bsd.port.mk>
