Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web10.2180.1603847917926232064
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Oct 2020 18:18:38 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@linux.microsoft.com header.s=default header.b=TUiheqmW;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182, mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id 5818E20B4907; Tue, 27 Oct 2020 18:18:37 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 5818E20B4907
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1603847917;
	bh=oETeAmcinkCggKR/bNWT9kMiL1iMgop6pJIrRCyTzW0=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=TUiheqmW5h3c++c7/lsoxKVv+CJcrqejfJ+AVJanzttdcbGo6qS4fM3HzvZ5MChZU
	 MC2rWZCieFxCli8D2rK93TsvnM+kXhUG+fYdSACYvGrV/OU7KZfkAvcJPBoif8D8F2
	 CQN5JX1oTh5uFkUT0tn+KqO2zA+n2I3dLHiVHu+k=
From: "Paul Eggleton" <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/7] ref-manual: add reference anchors for each QA check
Date: Tue, 27 Oct 2020 18:18:29 -0700
Message-Id: <b440e47d516b12f5aeac01b9f184f16eb0cc056f.1603839557.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
References: <cover.1603839557.git.paul.eggleton@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

From: Paul Eggleton <paul.eggleton@microsoft.com>

Make it possible to link to the explanation for a particular QA check.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/ref-manual/ref-qa-checks.rst | 36 ++++++++++++++++++++++++=
++++++
 1 file changed, 36 insertions(+)

diff --git a/documentation/ref-manual/ref-qa-checks.rst b/documentation/r=
ef-manual/ref-qa-checks.rst
index 5b9f92d..228b4fd 100644
--- a/documentation/ref-manual/ref-qa-checks.rst
+++ b/documentation/ref-manual/ref-qa-checks.rst
@@ -43,6 +43,8 @@ error form along with an explanation.
 Errors and Warnings
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
+.. _qa-check-libexec:
+
 -  ``<packagename>: <path> is using libexec please relocate to <libexecd=
ir> [libexec]``
=20
    The specified package contains files in ``/usr/libexec`` when the
@@ -51,6 +53,7 @@ Errors and Warnings
    default can be changed (e.g. ``${libdir}``).
=20
    =C2=A0
+.. _qa-check-rpaths:
=20
 -  ``package <packagename> contains bad RPATH <rpath> in file <file> [rp=
aths]``
=20
@@ -65,6 +68,7 @@ Errors and Warnings
    software.
=20
    =C2=A0
+.. _qa-check-useless-rpaths:
=20
 -  ``<packagename>: <file> contains probably-redundant RPATH <rpath> [us=
eless-rpaths]``
=20
@@ -77,6 +81,7 @@ Errors and Warnings
    the build of the software.
=20
    =C2=A0
+.. _qa-check-file-rdeps:
=20
 -  ``<packagename> requires <files>, but no providers in its RDEPENDS [f=
ile-rdeps]``
=20
@@ -88,6 +93,7 @@ Errors and Warnings
    built.
=20
    =C2=A0
+.. _qa-check-build-deps:
=20
 -  ``<packagename1> rdepends on <packagename2>, but it isn't a build dep=
endency? [build-deps]``
=20
@@ -101,6 +107,7 @@ Errors and Warnings
    to add an explicit ``RDEPENDS`` for the dependency.
=20
    =C2=A0
+.. _qa-check-dev-so:
=20
 -  ``non -dev/-dbg/nativesdk- package contains symlink .so: <packagename=
> path '<path>' [dev-so]``
=20
@@ -112,6 +119,7 @@ Errors and Warnings
    file goes into an appropriate ``-dev`` package.
=20
    =C2=A0
+.. _qa-check-staticdev:
=20
 -  ``non -staticdev package contains static .a library: <packagename> pa=
th '<path>' [staticdev]``
=20
@@ -121,6 +129,7 @@ Errors and Warnings
    goes into an appropriate ``-staticdev`` package.
=20
    =C2=A0
+.. _qa-check-libdir:
=20
 -  ``<packagename>: found library in wrong location [libdir]``
=20
@@ -133,6 +142,7 @@ Errors and Warnings
    :term:`INSANE_SKIP` for the package.
=20
    =C2=A0
+.. _qa-check-debug-files:
=20
 -  ``non debug package contains .debug directory: <packagename> path <pa=
th> [debug-files]``
=20
@@ -145,6 +155,7 @@ Errors and Warnings
    information on ``FILES``.
=20
    =C2=A0
+.. _qa-check-arch:
=20
 -  ``Architecture did not match (<machine_arch> to <file_arch>) on <file=
> [arch]``
=20
@@ -199,6 +210,7 @@ Errors and Warnings
    and verify that the compiler options being used are correct.
=20
    =C2=A0
+.. _qa-check-textrel:
=20
 -  ``ELF binary '<file>' has relocations in .text [textrel]``
=20
@@ -218,6 +230,7 @@ Errors and Warnings
    http://www.akkadia.org/drepper/textrelocs.html.
=20
    =C2=A0
+.. _qa-check-ldflags:
=20
 -  ``No GNU_HASH in the elf binary: '<file>' [ldflags]``
=20
@@ -233,6 +246,7 @@ Errors and Warnings
       TARGET_CC_ARCH +=3D "${LDFLAGS}"
=20
    =C2=A0
+.. _qa-check-xorg-driver-abi:
=20
 -  ``Package <packagename> contains Xorg driver (<driver>) but no xorg-a=
bi- dependencies [xorg-driver-abi]``
=20
@@ -245,6 +259,7 @@ Errors and Warnings
    to explicitly add dependencies to binary driver recipes.
=20
    =C2=A0
+.. _qa-check-infodir:
=20
 -  ``The /usr/share/info/dir file is not meant to be shipped in a partic=
ular package. [infodir]``
=20
@@ -256,6 +271,8 @@ Errors and Warnings
       rm ${D}${infodir}/dir
   =C2=A0
=20
+.. _qa-check-symlink-to-sysroot:
+
 -  ``Symlink <path> in <packagename> points to TMPDIR [symlink-to-sysroo=
t]``
=20
    The specified symlink points into :term:`TMPDIR` on the
@@ -264,6 +281,7 @@ Errors and Warnings
    symlink to use a relative path or remove the symlink.
=20
    =C2=A0
+.. _qa-check-la:
=20
 -  ``<file> failed sanity test (workdir) in path <path> [la]``
=20
@@ -273,6 +291,7 @@ Errors and Warnings
    automatically itself.
=20
    =C2=A0
+.. _qa-check-pkgconfig:
=20
 -  ``<file> failed sanity test (tmpdir) in path <path> [pkgconfig]``
=20
@@ -283,6 +302,7 @@ Errors and Warnings
    are accessed.
=20
    =C2=A0
+.. _qa-check-debug-deps:
=20
 -  ``<packagename> rdepends on <debug_packagename> [debug-deps]``
=20
@@ -305,6 +325,7 @@ Errors and Warnings
    manually (e.g. by adding to :term:`RDEPENDS`).
=20
    =C2=A0
+.. _qa-check-dev-deps:
=20
 -  ``<packagename> rdepends on <dev_packagename> [dev-deps]``
=20
@@ -327,6 +348,7 @@ Errors and Warnings
    manually (e.g. by adding to :term:`RDEPENDS`).
=20
    =C2=A0
+.. _qa-check-dep-cmp:
=20
 -  ``<var>_<packagename> is invalid: <comparison> (<value>)   only compa=
risons <, =3D, >, <=3D, and >=3D are allowed [dep-cmp]``
=20
@@ -341,6 +363,7 @@ Errors and Warnings
    adding to match those listed in the message.
=20
    =C2=A0
+.. _qa-check-compile-host-path:
=20
 -  ``<recipename>: The compile log indicates that host include and/or li=
brary paths were used. Please check the log '<logfile>' for more informat=
ion. [compile-host-path]``
=20
@@ -351,6 +374,7 @@ Errors and Warnings
    file.
=20
    =C2=A0
+.. _qa-check-install-host-path:
=20
 -  ``<recipename>: The install log indicates that host include and/or li=
brary paths were used. Please check the log '<logfile>' for more informat=
ion. [install-host-path]``
=20
@@ -361,6 +385,7 @@ Errors and Warnings
    file.
=20
    =C2=A0
+.. _qa-check-configure-unsafe:
=20
 -  ``This autoconf log indicates errors, it looked at host include and/o=
r library paths while determining system capabilities. Rerun configure ta=
sk after fixing this. The path was '<path>'``
=20
@@ -371,6 +396,7 @@ Errors and Warnings
    file.
=20
    =C2=A0
+.. _qa-check-pkgname:
=20
 -  ``<packagename> doesn't match the [a-z0-9.+-]+ regex [pkgname]``
=20
@@ -384,6 +410,7 @@ Errors and Warnings
    change the package name appropriately.
=20
    =C2=A0
+.. _qa-check-unknown-configure-option:
=20
 -  ``<recipe>: configure was passed unrecognized options: <options> [unk=
nown-configure-option]``
=20
@@ -401,6 +428,7 @@ Errors and Warnings
    accordingly.
=20
    =C2=A0
+.. _qa-check-pn-overrides:
=20
 -  ``Recipe <recipefile> has PN of "<recipename>" which is in OVERRIDES,=
 this can result in unexpected behavior. [pn-overrides]``
=20
@@ -416,6 +444,7 @@ Errors and Warnings
    :term:`FILES` for additional information.
=20
    =C2=A0
+.. _qa-check-pkgvarcheck:
=20
 -  ``<recipefile>: Variable <variable> is set as not being package speci=
fic, please fix this. [pkgvarcheck]``
=20
@@ -433,6 +462,7 @@ Errors and Warnings
    assignments to these variables within your recipe.
=20
    =C2=A0
+.. _qa-check-already-stripped:
=20
 -  ``File '<file>' from <recipename> was already stripped, this will pre=
vent future debugging! [already-stripped]``
=20
@@ -458,6 +488,7 @@ Errors and Warnings
       strip the symbols from the binaries.
=20
    =C2=A0
+.. _qa-check-packages-list:
=20
 -  ``<packagename> is listed in PACKAGES multiple times, this leads to p=
ackaging errors. [packages-list]``
=20
@@ -467,6 +498,7 @@ Errors and Warnings
    already in the variable's value.
=20
    =C2=A0
+.. _qa-check-files-invalid:
=20
 -  ``FILES variable for package <packagename> contains '//' which is inv=
alid. Attempting to fix this but you should correct the metadata. [files-=
invalid]``
=20
@@ -475,6 +507,7 @@ Errors and Warnings
    that there is only a single "/".
=20
    =C2=A0
+.. _qa-check-installed-vs-shipped:
=20
 -  ``<recipename>: Files/directories were installed but not shipped in a=
ny package [installed-vs-shipped]``
=20
@@ -505,6 +538,9 @@ Errors and Warnings
    :term:`PRIVATE_LIBS` in the recipe that provides
    the private version of the library.
=20
+
+.. _qa-check-unlisted-pkg-lics:
+
 -  ``LICENSE_<packagename> includes licenses (<licenses>) that are not l=
isted in LICENSE [unlisted-pkg-lics]``
=20
    The :term:`LICENSE` of the recipe should be a superset
--=20
1.8.3.1

