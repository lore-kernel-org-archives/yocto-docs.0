Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFAFDC7EE2A
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 12:43:09 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.18641.1750682586901269308
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 05:43:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AxN5eE2+;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2071310f8f.1
        for <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 05:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750682585; x=1751287385; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yASFNSDCDrWVnrZMD+GgYbz1nU/OUOCUNP65Wx3ZRJo=;
        b=AxN5eE2+gZkyYl8vWrc1TKK4J77FmnvebfMx15efG5F42ATZf+SrZGx0gGimNHcNXf
         zwVFp9BWU1IT2hMNgvFZb23IBnzApXuKrvcJBu9CqqJ3cWUofYO3jobH7QqvV0XAUf9U
         sJfrCv+gDCNgSQnaHkT8JqjzMI8cbakwW/z0rM/BXR5zxiSOQnUIPnt0gUPsHuTU1V4k
         PjiK7pQ93ooJTn04+G3Pjw36WXD7TsuZW/ItOZE1Db1chHAAw/Kpk/bSlU9bMxip9VzI
         oUd5MZGhmHCUa+DXoT+ZJsD/aO8zIdlv5VBzO5tXmMXx8e7vTEGTMvYPgXS5L3UmQ59T
         xjZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750682585; x=1751287385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yASFNSDCDrWVnrZMD+GgYbz1nU/OUOCUNP65Wx3ZRJo=;
        b=TAL3ywglCdt/6VpagH9ki+HknjVgNf3jGumYaT1rIafUZfPSCbVchEWrH0m5amwX7p
         CBuCYPm3NJ0s2nwCxhEFpy5J1pKj5gHQYa0DB5SIjUBbBh6VZh7F4pkMATjsES9PJUMk
         wFthLnSuzg3bCPUAMvmrJlVYDOy/NX/fMgzGXmcUjcIB2q1XAXeY03GuBZ0Qf3cegIaI
         n8ECDOqsiKY9WPA8XJyvG+5vbtEV0+xz979eQyjklAn2Pqa0Ia8do6cKMc+zVj33O1ve
         2qsGsfuf8zYa7RIsdGKGnyajJ1ur8BBtdih2PmLEoTFZyzF8YIOaK6UDX+rR5x4fmeHt
         11ag==
X-Gm-Message-State: AOJu0YwJL3hciAQkpRae5+coqdw3Wfz6ZulYhkwa7IuLWjv9wfuLE8uF
	pW8zALl/utm0qfuMfi55+6JpSuKVWdwsdqODnd0+fSpWSbu9EJHLeomjZ3dOEQ==
X-Gm-Gg: ASbGnctLLA8Zu3KnKFTG8kt2pjhjCbs+fDYQCTiZ87h/QZVyWxvLVOukIssG6kk/idI
	HK5GLxyrEVklzEbWEzUjtKDr9S+0DVwHrGegAGcZXiwmUv+LbO7I3i7Gpg/Qmf2VQKf+5Ayolxy
	UjgWy2Knf14Dg6fj59Lj0BZ9ujIP9peH0h7F3UeXGw8l2UFF8+/0dJz3A7nP2Xs0bKBRG6IAHNV
	S8UihSZYMKXi4PkWepfhgsf057Mngjf7MTPY4J++Ddipg26okrnqIqOwxcPJcURqf690wzi8Tkw
	km1YS6s/7adN2+yaDqDRAiRKXCMRzxR4lNAg1kvk+8HBqRQ2aWBUuh5E1tJqQbHVkvlrAfrJnGt
	cCu4cAkGC7gjb1SEnMiirF4o=
X-Google-Smtp-Source: AGHT+IEUePmqOcj7gEhaCnyjBa79TEencQYy2SJQlNthsiFIlUNWUMmQXRcdohFm0wjfXIjFGYGPRw==
X-Received: by 2002:a05:6000:4716:b0:3a4:d452:fff with SMTP id ffacd0b85a97d-3a6d12a077dmr9989822f8f.17.1750682585048;
        Mon, 23 Jun 2025 05:43:05 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190b00sm9157170f8f.87.2025.06.23.05.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 05:43:04 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 3/6] dev-manual: replace WORKDIR with UNPACKDIR where appropriate
Date: Mon, 23 Jun 2025 14:42:54 +0200
Message-Id: <20250623124257.1544615-3-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250623124257.1544615-1-alex.kanavin@gmail.com>
References: <20250623124257.1544615-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 12:43:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7147

From: Alexander Kanavin <alex@linutronix.de>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/dev-manual/layers.rst               | 12 ++++++------
 documentation/dev-manual/licenses.rst             |  4 ++--
 documentation/dev-manual/new-recipe.rst           | 12 ++++--------
 documentation/dev-manual/packages.rst             |  2 +-
 documentation/dev-manual/prebuilt-libraries.rst   |  4 ++--
 .../dev-manual/temporary-source-code.rst          | 15 +++++++++++----
 6 files changed, 26 insertions(+), 23 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index c649e2bd60f..454c72bcd21 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -507,7 +507,7 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``::
    PR = "r45"
 
    SRC_URI = "file://config file://machconfig"
-   S = "${WORKDIR}"
+   S = "${UNPACKDIR}"
 
    PACKAGE_ARCH = "${MACHINE_ARCH}"
    INHIBIT_DEFAULT_DEPS = "1"
@@ -586,7 +586,7 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 
    SRC_URI = "file://xorg.conf"
 
-   S = "${WORKDIR}"
+   S = "${UNPACKDIR}"
 
    CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
 
@@ -594,9 +594,9 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
    ALLOW_EMPTY:${PN} = "1"
 
    do_install () {
-        if test -s ${WORKDIR}/xorg.conf; then
+        if test -s ${UNPACKDIR}/xorg.conf; then
                 install -d ${D}/${sysconfdir}/X11
-                install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+                install -m 0644 ${UNPACKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
         fi
    }
 
@@ -614,8 +614,8 @@ file is in the layer at ``recipes-graphics/xorg-xserver``::
        PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
        if [ "${PITFT}" = "1" ]; then
            install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
-           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
-           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+           install -m 0644 ${UNPACKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+           install -m 0644 ${UNPACKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
        fi
    }
 
diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index bffff3675f3..7d6636eeff2 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -55,11 +55,11 @@ Consider this next example::
 
    LIC_FILES_CHKSUM = "file://src/ls.c;beginline=5;endline=16;\
                                        md5=bb14ed3c4cda583abc85401304b5cd4e"
-   LIC_FILES_CHKSUM = "file://${WORKDIR}/license.html;md5=5c94767cedb5d6987c902ac850ded2c6"
+   LIC_FILES_CHKSUM = "file://${UNPACKDIR}/license.html;md5=5c94767cedb5d6987c902ac850ded2c6"
 
 The first line locates a file in ``${S}/src/ls.c`` and isolates lines
 five through 16 as license text. The second line refers to a file in
-:term:`WORKDIR`.
+:term:`UNPACKDIR`.
 
 Note that :term:`LIC_FILES_CHKSUM` variable is mandatory for all recipes,
 unless the :term:`LICENSE` variable is set to "CLOSED".
diff --git a/documentation/dev-manual/new-recipe.rst b/documentation/dev-manual/new-recipe.rst
index c49881efe63..7b39b9984e2 100644
--- a/documentation/dev-manual/new-recipe.rst
+++ b/documentation/dev-manual/new-recipe.rst
@@ -706,7 +706,7 @@ hierarchy to locations that would mirror their locations on the target
 device. The installation process copies files from the
 ``${``\ :term:`S`\ ``}``,
 ``${``\ :term:`B`\ ``}``, and
-``${``\ :term:`WORKDIR`\ ``}``
+``${``\ :term:`UNPACKDIR`\ ``}``
 directories to the ``${``\ :term:`D`\ ``}``
 directory to create the structure as it should appear on the target
 system.
@@ -1145,7 +1145,7 @@ Building an application from a single file that is stored locally (e.g. under
 ``files``) requires a recipe that has the file listed in the :term:`SRC_URI`
 variable. Additionally, you need to manually write the :ref:`ref-tasks-compile`
 and :ref:`ref-tasks-install` tasks. The :term:`S` variable defines the
-directory containing the source code, which is set to :term:`WORKDIR` in this
+directory containing the source code, which is set to :term:`UNPACKDIR` in this
 case --- the directory BitBake uses for the build::
 
    SUMMARY = "Simple helloworld application"
@@ -1155,7 +1155,7 @@ case --- the directory BitBake uses for the build::
 
    SRC_URI = "file://helloworld.c"
 
-   S = "${WORKDIR}"
+   S = "${UNPACKDIR}"
 
    do_compile() {
        ${CC} ${LDFLAGS} helloworld.c -o helloworld
@@ -1211,8 +1211,6 @@ In the following example, ``lz4`` is a makefile-based package::
               "
    UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>.*)"
 
-   S = "${WORKDIR}/git"
-
    CVE_STATUS[CVE-2014-4715] = "fixed-version: Fixed in r118, which is larger than the current version"
 
    EXTRA_OEMAKE = "PREFIX=${prefix} CC='${CC}' CFLAGS='${CFLAGS}' DESTDIR=${D} LIBDIR=${libdir} INCLUDEDIR=${includedir} BUILD_STATIC=no"
@@ -1271,8 +1269,6 @@ is a simple example of an application without dependencies::
    SRC_URI = "git://gitlab.com/ipcalc/ipcalc.git;protocol=https;branch=master"
    SRCREV = "4c4261a47f355946ee74013d4f5d0494487cc2d6"
 
-   S = "${WORKDIR}/git"
-
    inherit meson
 
 Applications with dependencies are likely to inherit the
@@ -1428,7 +1424,7 @@ chapter of the BitBake User Manual.
    The following example shows some of the ways you can use variables in
    recipes::
 
-      S = "${WORKDIR}/postfix-${PV}"
+      S = "${UNPACKDIR}/postfix-${PV}"
       CFLAGS += "-DNO_ASM"
       CFLAGS:append = " --enable-important-feature"
 
diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8845bf2fab5..8bd48c8e8f2 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -1024,7 +1024,7 @@ The ``devtool edit-recipe`` command lets you take a look at the recipe::
        npmsw://${THISDIR}/${BPN}/npm-shrinkwrap.json \
        "
 
-   S = "${WORKDIR}/npm"
+   S = "${UNPACKDIR}/npm"
 
    inherit npm
 
diff --git a/documentation/dev-manual/prebuilt-libraries.rst b/documentation/dev-manual/prebuilt-libraries.rst
index a05f39ca1e2..d138358eae5 100644
--- a/documentation/dev-manual/prebuilt-libraries.rst
+++ b/documentation/dev-manual/prebuilt-libraries.rst
@@ -97,7 +97,7 @@ The complete recipe would look like this::
    # we use a local link.
    SRC_URI = "file://libft4222-linux-${PV}.tgz"
 
-   S = "${WORKDIR}"
+   S = "${UNPACKDIR}"
 
    ARCH_DIR:x86-64 = "build-x86_64"
    ARCH_DIR:i586 = "build-i386"
@@ -204,6 +204,6 @@ versioned library example. The "magic" is setting the :term:`SOLIBS` and
 
    do_install () {
            install -d ${D}${libdir}
-           install -m 0755 ${WORKDIR}/libfoo.so ${D}${libdir}
+           install -m 0755 ${UNPACKDIR}/libfoo.so ${D}${libdir}
    }
 
diff --git a/documentation/dev-manual/temporary-source-code.rst b/documentation/dev-manual/temporary-source-code.rst
index 08bf68d9826..de7140abe26 100644
--- a/documentation/dev-manual/temporary-source-code.rst
+++ b/documentation/dev-manual/temporary-source-code.rst
@@ -18,11 +18,10 @@ build packages is available in the :term:`Build Directory` as defined by the
 defined in the ``meta/conf/bitbake.conf`` configuration file in the
 :term:`Source Directory`::
 
-   S = "${WORKDIR}/${BP}"
+   S = "${UNPACKDIR}/${BP}"
 
 You should be aware that many recipes override the
-:term:`S` variable. For example, recipes that fetch their source from Git
-usually set :term:`S` to ``${WORKDIR}/git``.
+:term:`S` variable when the default isn't accurate.
 
 .. note::
 
@@ -31,8 +30,16 @@ usually set :term:`S` to ``${WORKDIR}/git``.
 
            BP = "${BPN}-${PV}"
 
+   This matches the location that the git fetcher unpacks to, and usually
+   matches unpacked content of release tarballs (e.g. they contain a single
+   directory which matches value of ${BP} exactly).
 
-The path to the work directory for the recipe
+The path to the unpack directory for the recipe
+(:term:`UNPACKDIR) is defined as follows::
+
+   ${WORKDIR}/sources
+
+In turn, the path to the work directory for the recipe
 (:term:`WORKDIR`) is defined as
 follows::
 
-- 
2.39.5


