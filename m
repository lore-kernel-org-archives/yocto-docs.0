Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web08.24371.1628784634812209033
 for <docs@lists.yoctoproject.org>;
 Thu, 12 Aug 2021 09:10:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: tom.rini@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id dk2so3437718qvb.3
        for <docs@lists.yoctoproject.org>; Thu, 12 Aug 2021 09:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references;
        bh=ZVPjAS8E5gvnn9Z/AsMVv2auSd89VRssVHOSgkvoDFo=;
        b=b2Q8OdytCfwEA1UYbsVh/EcPsvPLWk2AFEvw+l2gURUSBgi/RqjFEgMl9tE9DVSy5X
         UWhOs48a3/Thvnpeyb8iE0aonut6asz6QVtT726FNaCqyWwtF9x69S9rG0cyTPTT6K2X
         V9YUzKAnPIRtRbgM5LFjiSkgYmNq3pxI6kZeoPWDEBErW0t0bhnFMpgssmMUvXrqKCWB
         wgvSgeX6s0sZv/ctbfbWo1bv3Qd3hQsfkvoFiE1PrpYf5OFpNaphXIL3FHhI48cNcrbb
         0VpsIR7CMkbtX5eavVRw6V2+5n/1H+qmB1XrNyPrjb6xgSinYRFhLjF2xIB2pvZrmmYA
         0ItQ==
X-Gm-Message-State: AOAM532tVRMIgQALG9tXy7E4OC0rOPFn3r9wOJ9A+U7L5wMk5ses45eW
	h511tN0G7KYEVRaKZFf6pOLLw56rTYfi
X-Google-Smtp-Source: ABdhPJxS8rSM6D7iPtePDYVfvLD5CkFDPiGet56l+ctdJ3JndYtmoCAg8XLu4XUW2LGoYmuig89nQw==
X-Received: by 2002:a0c:b450:: with SMTP id e16mr4600469qvf.25.1628784633628;
        Thu, 12 Aug 2021 09:10:33 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-04e3-07fe-0933-9252.res6.spectrum.com. [2603:6081:7b01:cbda:4e3:7fe:933:9252])
        by smtp.gmail.com with ESMTPSA id h2sm1549773qko.127.2021.08.12.09.10.32
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Aug 2021 09:10:32 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 3/3] common-tasks: Add an example of using bbappends to add a file
Date: Thu, 12 Aug 2021 12:10:27 -0400
Message-Id: <20210812161027.580-3-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210812161027.580-1-trini@konsulko.com>
References: <20210812161027.580-1-trini@konsulko.com>

Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
an example of having a bbappend file add files to an existing recipe.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
 documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index f15e72887c04..87abef9ad52f 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
 used during ``do_fetch`` and the test for a non-zero file size in
 ``do_install`` will return true, and the file will be installed.
 
+Installing Additional Files Using Your Layer
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+As another example, consider the main xserver-xf86-config recipe and a corresponding
+xserver-xf86-config append file both from the :term:`Source Directory`.
+Here is the main
+xserver-xf86-config recipe, which is named ``xserver-xf86-config_0.1.bb`` and located in
+the "meta" layer at ``meta/recipes-graphics/xorg-xserver``::
+
+   SUMMARY = "X.Org X server configuration file"
+   HOMEPAGE = "http://www.x.org"
+   SECTION = "x11/base"
+   LICENSE = "MIT-X"
+   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
+   PR = "r33"
+
+   SRC_URI = "file://xorg.conf"
+
+   S = "${WORKDIR}"
+
+   CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
+
+   PACKAGE_ARCH = "${MACHINE_ARCH}"
+   ALLOW_EMPTY:${PN} = "1"
+
+   do_install () {
+	if test -s ${WORKDIR}/xorg.conf; then
+		install -d ${D}/${sysconfdir}/X11
+		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
+	fi
+   }
+
+Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
+and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
+file is in the layer at ``recipes-graphics/xorg-xserver``::
+
+   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
+
+   SRC_URI:append:rpi = " \
+       file://xorg.conf.d/98-pitft.conf \
+       file://xorg.conf.d/99-calibration.conf \
+   "
+   do_install:append:rpi () {
+       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
+       if [ "${PITFT}" = "1" ]; then
+           install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
+           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+       fi
+   }
+
+   FILES:${PN}:rpi += "${sysconfdir}/X11/xorg.conf ${sysconfdir}/X11/xorg.conf.d/*"
+
+Building off of the previous example, we once again are setting the
+:term:`FILESEXTRAPATHS` variable.  In this case we are also usine the
+:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
+the list of :term:`OVERRIDES`.  The ``do_install`` task will then perform a
+check for an additional :term:`MACHINE_FEATURES` that if set will cause these
+additional files to be installed.  These additional files are listed in
+:term:`FILES` so that they will be packaged.
+
 Prioritizing Your Layer
 -----------------------
 
-- 
2.17.1

