# $FreeBSD$

PORTNAME=	atf-allwinner
PORTVERSION=	2.0.20181123
CATEGORIES=	sysutils
MASTER_SITES=	GH

MAINTAINER=	manu@FreeBSD.org
COMMENT=	Arm Trusted Framework for Allwinner SoCs

LICENSE=	BSD3CLAUSE

BUILD_DEPENDS=	aarch64-none-elf-gcc:devel/aarch64-none-elf-gcc

USE_GITHUB=	yes
GH_ACCOUNT=	ARM-software
GH_PROJECT=	arm-trusted-firmware
GH_TAGNAME=	98aab97

SSP_UNSAFE=	yes
USES=	gmake
MAKE_ENV+=	CROSS_COMPILE="aarch64-none-elf-"
ALL_TARGET=	ARCH="aarch64" PLAT=sun50i_a64 V=1 bl31

PLIST_FILES=	${PREFIX}/share/${PORTNAME}/bl31.bin

do-install:
	${MKDIR} ${STAGEDIR}/${PREFIX}/share/${PORTNAME}/
	${INSTALL_DATA} ${WRKSRC}/build/sun50i_a64/release/bl31.bin ${STAGEDIR}/${PREFIX}/share/${PORTNAME}/

.include <bsd.port.mk>
