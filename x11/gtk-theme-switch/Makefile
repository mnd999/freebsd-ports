# Created by: Maxim Sobolev <sobomax@FreeBSD.org>
# $FreeBSD$

PORTNAME=	gtk-theme-switch
PORTVERSION=	1.0.1
PORTREVISION=	9
CATEGORIES=	x11
MASTER_SITES=	http://www.muhri.net/
PKGNAMESUFFIX=	1

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Command line tool for switching GTK+ themes

DEPRECATED=	Uses obsolete glib12
EXPIRATION_DATE=	2018-12-20

LICENSE=	GPLv2

USE_GNOME=	gtk12
USES=		gmake

OPTIONS_DEFINE=	DOCS

post-install-DOCS-on:
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	${INSTALL_DATA} ${WRKSRC}/readme ${STAGEDIR}${DOCSDIR}/README

.include <bsd.port.mk>
