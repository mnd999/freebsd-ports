# $FreeBSD$

PORTNAME=	petiga
DISTVERSION=	g20180518
PORTREVISION=	5
CATEGORIES=	math python
MASTER_SITES=	https://bitbucket.org/${BB_ACCOUNT}/${BB_PROJECT}/get/${BB_COMMIT}.tar.gz?dummy=/

MAINTAINER=	yuri@FreeBSD.org
COMMENT=	Framework for High Performance Isogeometric Analysis

LICENSE=	BSD2CLAUSE
LICENSE_FILE=	${WRKSRC}/LICENSE.rst

LIB_DEPENDS=	libblas.so:math/blas \
		liblapack.so:math/lapack \
		libmpich.so:net/mpich \
		libpetsc.so:science/PETSc

BB_ACCOUNT=	dalcinl
BB_PROJECT=	${PORTNAME}
BB_COMMIT=	e2a59b1ba054

WRKSRC=		${WRKDIR}/${BB_ACCOUNT}-${BB_PROJECT}-${BB_COMMIT}

USES=		cmake:outsource compiler:c++14-lang fortran
USE_XORG=	x11
USE_LDCONFIG=	yes

PLIST_FILES=	include/petiga.h \
		lib/libpetiga.so \
		lib/petiga/conf/rules \
		lib/petiga/conf/test \
		lib/petiga/conf/variables

post-install:
	@cd ${STAGEDIR}${PREFIX}/include && ${RMDIR} petiga/cxx petiga/fad petiga

.include <bsd.port.mk>
