# Created by: Vanilla I. Shu <vanilla@MinJe.com.TW>
# $FreeBSD$

PORTNAME=	Gtk-Perl
PORTVERSION=	0.7010
PORTREVISION=	3
CATEGORIES=	x11-toolkits lang perl5
MASTER_SITES=	CPAN
PKGNAMEPREFIX=	p5-

MAINTAINER=	perl@FreeBSD.org
COMMENT=	The base module of Gtk-Perl

DEPRECATED=	Uses obsolete glib12
EXPIRATION_DATE=	2018-12-20

LICENSE=	ART10 GPLv1+
LICENSE_COMB=	dual

BUILD_DEPENDS=	p5-XML-Writer>=0:textproc/p5-XML-Writer \
		p5-XML-Parser>=0:textproc/p5-XML-Parser

USE_GNOME=	gtk12
USES=		perl5 shebangfix
SHEBANG_FILES=	tools/gendoc.pl tools/gpdoc2pod
USE_PERL5=	configure
CONFIGURE_ARGS=	--without-guessing --lazy-load
MAKE_JOBS_UNSAFE=	yes

post-install:
	${STRIP_CMD} ${STAGEDIR}${PREFIX}/${SITE_ARCH_REL}/auto/Gtk/Gtk.so

.include <bsd.port.mk>
