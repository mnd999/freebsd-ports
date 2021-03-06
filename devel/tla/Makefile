# Created by: Sean Chittenden <seanc@FreeBSD.org>
# $FreeBSD$

PORTNAME=	tla
PORTVERSION=	1.3.5
PORTREVISION=	1
CATEGORIES=	devel
MASTER_SITES=	GNU/gnu-arch \
		http://www.atai.org/gnuarch/releases/

MAINTAINER=	ports@FreeBSD.org
COMMENT=	Original arch source control management CLI written in C

BROKEN_SSL=	openssl111
BROKEN_SSL_REASON_openssl111=	incomplete definition of type 'struct X509_name_entry_st'

BUILD_DEPENDS=	gpatch:devel/patch \
		gdiff:textproc/diffutils \
		gtar:archivers/gtar
RUN_DEPENDS:=	${BUILD_DEPENDS}

USES=		gmake pkgconfig ssl
HAS_CONFIGURE=	yes
MAKE_JOBS_UNSAFE=	yes

CONFIGURE_SCRIPT=	../configure
CONFIGURE_ARGS=	--prefix=${PREFIX} \
		--with-gnu-patch gpatch \
		--with-gnu-diff gdiff \
		--with-gnu-diff3 gdiff3 \
		--with-gnu-tar gtar

ORIGWRKSRC=	${WRKDIR}/${DISTNAME}/src
PATCH_WRKSRC=	${ORIGWRKSRC}/..
WRKSRC=		${ORIGWRKSRC}/=build

OPTIONS_DEFINE=	DOCS

pre-patch:
	${MKDIR} ${WRKSRC}

test:
	cd ${WRKSRC} ; ${MAKE_CMD} test

pre-install:
	${RM} -r ${ORIGWRKSRC}/docs-tla/PLUGIN \
		${ORIGWRKSRC}/docs-tla/{arch} ${ORIGWRKSRC}/docs-tla/.arch-ids

do-install:
	${INSTALL_PROGRAM} ${ORIGWRKSRC}/=build/tla/tla/tla ${STAGEDIR}${PREFIX}/bin
	${SED} 's,^#!.*$$,#!${AWK} -f,' ${ORIGWRKSRC}/tla/=gpg-check.awk \
		> ${WRKDIR}/tla-gpg-check
	${INSTALL_SCRIPT} ${WRKDIR}/tla-gpg-check ${STAGEDIR}${PREFIX}/bin
	@${MKDIR} ${STAGEDIR}${DOCSDIR}
	cd ${ORIGWRKSRC}/docs-tla && ${FIND} . -name '*.html' | \
		${CPIO} -pdm -R ${SHAREOWN}:${SHAREGRP} ${STAGEDIR}${DOCSDIR}

.include <bsd.port.mk>
