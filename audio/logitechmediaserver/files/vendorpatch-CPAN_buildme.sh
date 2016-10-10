--- ../slimserver-vendor-14cc392/CPAN/buildme.sh.orig	2016-08-12 14:27:39.000000000 +0100
+++ ../slimserver-vendor-14cc392/CPAN/buildme.sh	2016-10-10 14:59:39.879530000 +0100
@@ -83,7 +83,8 @@
 if [ "$OS" = "FreeBSD" ]; then
     ARCHPERL=/usr/local/bin/perl
 fi
-ARCH=`$ARCHPERL -MConfig -le 'print $Config{archname}' | sed 's/gnu-//' | sed 's/^i[3456]86-/i386-/' | sed 's/armv.*?-/arm-/' `
+PERL_ARCHNAME=`$ARCHPERL -MConfig -le 'print $Config{archname}' | sed 's/gnu-//' | sed 's/^i[3456]86-/i386-/' | sed 's/armv.*?-/arm-/' `
+ARCH=mach
 
 if [ "$OS" = "Linux" -o "$OS" = "Darwin" -o "$OS" = "FreeBSD" ]; then
     echo "Building for $OS / $ARCH"
@@ -92,7 +93,7 @@
     exit
 fi
 
-for i in gcc cpp rsync make rsync ; do
+for i in cc cpp rsync make rsync ; do
     which $i > /dev/null
     if [ $? -ne 0 ] ; then
         echo "$i not found - please install it"
@@ -416,7 +417,7 @@
     if [ $PERL_BIN ]; then
         export PERL5LIB=$PERL_BASE/lib/perl5
         
-        $PERL_BIN Makefile.PL INSTALL_BASE=$PERL_BASE $makefile_args
+        $PERL_BIN Makefile.PL INSTALL_BASE=$PERL_BASE INSTALLARCHLIB=$PERL_BASE/lib/perl5/mach INSTALLSITEARCH=$PERL_BASE/lib/perl5/mach INSTALLVENDORARCH=$PERL_BASE/lib/perl5/mach $makefile_args
         if [ $local_run_tests -eq 1 ]; then
             make test
         else
@@ -552,7 +553,7 @@
                     ICUOS="FreeBSD"
                 fi
                 CFLAGS="$ICUFLAGS" CXXFLAGS="$ICUFLAGS" LDFLAGS="$FLAGS $OSX_ARCH $OSX_FLAGS" \
-                    ./runConfigureICU $ICUOS --prefix=$BUILD --enable-static --with-data-packaging=archive
+                    ./configure --prefix=$BUILD --enable-static --with-data-packaging=archive
                 $MAKE
                 if [ $? != 0 ]; then
                     echo "make failed"
@@ -1216,13 +1217,16 @@
     
     # ASM doesn't work right on x86_64
     # XXX test --arch options on Linux
-    if [ "$ARCH" = "x86_64-linux-thread-multi" -o "$ARCH" = "amd64-freebsd-thread-multi" ]; then
+    if [ "$PERL_ARCHNAME" = "x86_64-linux-thread-multi" -o "$PERL_ARCHNAME" = "amd64-freebsd-thread-multi" ]; then
         FFOPTS="$FFOPTS --disable-mmx"
     fi
     # FreeBSD amd64 needs arch option
-    if [ "$ARCH" = "amd64-freebsd" -o "$ARCH" = "amd64-freebsd-thread-multi" ]; then
+    if [ "$PERL_ARCHNAME" = "amd64-freebsd" -o "$PERL_ARCHNAME" = "amd64-freebsd-thread-multi" ]; then
         FFOPTS="$FFOPTS --arch=x86"
     fi
+    if [ "$OS" = "FreeBSD" ]; then
+	FFOPTS="$FFOPTS --cc=clang"
+    fi
     
     if [ "$OS" = "Darwin" ]; then
         SAVED_FLAGS=$FLAGS
