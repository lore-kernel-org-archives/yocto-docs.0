Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.70306.1629385959006538812
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Aug 2021 08:12:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: tom.rini@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id l3so4805840qtk.10
        for <docs@lists.yoctoproject.org>; Thu, 19 Aug 2021 08:12:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=FdtB0xhwqwDCVXMan5zUZZQwCewc86Bv5v1Ykon+gRk=;
        b=qeLct4HDsR8BhHTqdn413ET/Lu6/VGxIS/zl9mlXgF3haWR6LTImkVuIfG4KWbTynm
         sX9Od/8Z1NtoSrpkbaLQuvx8YLTEV81N50r3ET9Wu2bk8i2jn/wkfu9fZiPaB1RwAjhj
         0+z0jE8BwaxU33Arj7W2r9DWaAW7HqxtZ6Yhpoz6izEnQv8dBBbKBiFdCVHrMNV7TxqS
         UDDdnFwrXKymp4i9bxD+FOo48eF9ELdc0KSYyVDnC5vwyV+L38MXDvxO12I0txCmMr4K
         lNutRtvHzwk4fOqqsHMTjjwZCVrl6AZd0HrMMyVimDihx16bXYhajF/MrgiuwOYhrqiw
         ttYg==
X-Gm-Message-State: AOAM530HU/gvX2NeYBdr8Db8++YNjyZc7BeVyF3PWkVKbfvkhRp0c/o0
	IlM45F6lBhDJh9W4tD1q+EYLLUvOSfi/
X-Google-Smtp-Source: ABdhPJxrUuYiNZPWkx2Ez5cXI1ngWZ08qBY3/2qwlQ670ascFnEPUc9QB+Xk4EmuOUVwjEkXkTTBpg==
X-Received: by 2002:a05:622a:1711:: with SMTP id h17mr1108962qtk.42.1629385957657;
        Thu, 19 Aug 2021 08:12:37 -0700 (PDT)
Return-Path: <tom.rini@gmail.com>
Received: from bill-the-cat.lan (2603-6081-7b01-cbda-599d-dbbd-fe12-cbbd.res6.spectrum.com. [2603:6081:7b01:cbda:599d:dbbd:fe12:cbbd])
        by smtp.gmail.com with ESMTPSA id k9sm1328047qtj.12.2021.08.19.08.12.36
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 08:12:36 -0700 (PDT)
From: "Tom Rini" <tom.rini@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCHv2] common-tasks: Add an example of using bbappends to add a file
Date: Thu, 19 Aug 2021 11:12:33 -0400
Message-Id: <20210819151233.10066-1-trini@konsulko.com>
X-Mailer: git-send-email 2.17.1

Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
an example of having a bbappend file add files to an existing recipe.

Signed-off-by: Tom Rini <trini@konsulko.com>
---
Changes in v2:
- Based on Quentin's feedback, submit a fix upstream to meta-raspberrypi
  for their FILES append usage.  Incorporate that now that the fix is
  merged upstream.
- Incorporate Quentin's syntax suggestions.
- Based on Quentin's feedback in the summary paragraph of the new
  section, reword to be more precise about when things change.
---
 documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
index 4a5011ea749a..5a0443c8ee5f 100644
--- a/documentation/dev-manual/common-tasks.rst
+++ b/documentation/dev-manual/common-tasks.rst
@@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
 used during :ref:`ref-tasks-fetch` and the test for a non-zero file size in
 :ref:`ref-tasks-install` will return true, and the file will be installed.
 
+Installing Additional Files Using Your Layer
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+As another example, consider the main ``xserver-xf86-config`` recipe and a
+corresponding ``xserver-xf86-config`` append file both from the :term:`Source
+Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
+``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
+``meta/recipes-graphics/xorg-xserver``::
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
+   FILES:${PN}:append:rpi = " ${sysconfdir}/X11/xorg.conf.d/*"
+
+Building off of the previous example, we once again are setting the
+:term:`FILESEXTRAPATHS` variable.  In this case we are also using
+:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
+the list of :term:`OVERRIDES`.  The :ref:`ref-tasks-install` task will then perform a
+check for an additional :term:`MACHINE_FEATURES` that if set will cause these
+additional files to be installed.  These additional files are listed in
+:term:`FILES` so that they will be packaged.
+
 Prioritizing Your Layer
 -----------------------
 
-- 
2.17.1

