Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62184C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 13:07:47 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.web11.7391.1750424866712565175
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 06:07:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=Bmb0ZR+1;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ibtqc0outeSNn9YmbXmfTsV+DS8a+ro8/6wJYNGdZrg=; b=Bmb0ZR+1nNtozo43ThRLoArYfa
	5wECuXUHDptktVLuQTOIsa8weQ4liymFIMUQPjHX9jyC0WgP90UXVVsVZvrTogFmB6S027Uk/xv6D
	e6B+CIGnfy3RvLOOy4T4oQZkGYt9IaBwhBf3lquzZDi7Afu70nHEmHtVoLW31vNE6nrn/KX7s/3Sv
	CJCVI4/13AiB5/q61lBDRk8cnMBBETLR5tQvJU3J8SOSmpFUkFYkjAxkuYpsSuFlsSeGZTnG4Jwsn
	0m1i6wqDby1RxeE1T8ziEWofCCPkmCTY00FQwhxyng7SdJN8CaSMnYwzAoRxK4RsZ7w+9yMWOc9CZ
	dQcB2qkQ==;
Received: from pool-174-114-102-5.cpe.net.cable.rogers.com ([174.114.102.5]:40460 helo=asus)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1uSbT5-0000000GkHf-0eiL
	for docs@lists.yoctoproject.org;
	Fri, 20 Jun 2025 09:07:45 -0400
Date: Fri, 20 Jun 2025 09:07:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] dev manual, CH 3: update code snippets to be more current
Message-ID: <b07d165d-2163-3893-43cb-0700a7fac3a1@crashcourse.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 13:07:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7125


Nothing major, just copy-and-paste from master branch to replace aging
code examples, and a little grammmar cleanup.

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index c649e2bd6..5f53e4bc6 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -80,7 +80,7 @@ Follow these general steps to create your layer without using tools:
       BBFILE_PATTERN_yoctobsp = "^${LAYERDIR}/"
       BBFILE_PRIORITY_yoctobsp = "5"
       LAYERVERSION_yoctobsp = "4"
-      LAYERSERIES_COMPAT_yoctobsp = "dunfell"
+      LAYERSERIES_COMPAT_yoctobsp = "walnascar"

    Here is an explanation of the layer configuration file:

@@ -306,7 +306,7 @@ The Yocto Project Compatibility Program consists of a layer application
 process that requests permission to use the Yocto Project Compatibility
 Logo for your layer and application. The process consists of two parts:

-#. Successfully passing a script (``yocto-check-layer``) that when run
+#. Successfully passing a script (``yocto-check-layer``) that, when run
    against your layer, tests it against constraints based on experiences
    of how layers have worked in the real world and where pitfalls have
    been found. Getting a "PASS" result from the script is required for
@@ -478,7 +478,7 @@ name. To handle these errors, the best practice is to rename the ``.bbappend``
 to match the original recipe version. This also gives you the opportunity to see
 if the ``.bbappend`` is still relevant for the new version of the recipe.

-Another method it to use the character ``%`` in the ``.bbappend`` filename. For
+Another method is to use the character ``%`` in the ``.bbappend`` filename. For
 example, to append information to every ``6.*`` minor versions of the recipe
 ``someapp``, the ``someapp_6.%.bbappend`` file can be created. This way, an
 error will only be triggered if the ``someapp`` recipe has a major version
@@ -504,10 +504,11 @@ the "meta" layer at ``meta/recipes-bsp/formfactor``::
    SECTION = "base"
    LICENSE = "MIT"
    LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-   PR = "r45"

    SRC_URI = "file://config file://machconfig"
-   S = "${WORKDIR}"
+
+   S = "${WORKDIR}/sources"
+   UNPACKDIR = "${S}"

    PACKAGE_ARCH = "${MACHINE_ARCH}"
    INHIBIT_DEFAULT_DEPS = "1"
@@ -582,11 +583,11 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
    SECTION = "x11/base"
    LICENSE = "MIT"
    LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
-   PR = "r33"

    SRC_URI = "file://xorg.conf"
+   SRC_URI:append:qemuall = " file://noblank.conf"

-   S = "${WORKDIR}"
+   S = "${UNPACKDIR}"

    CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"

@@ -594,10 +595,15 @@ Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
    ALLOW_EMPTY:${PN} = "1"

    do_install () {
-        if test -s ${WORKDIR}/xorg.conf; then
-                install -d ${D}/${sysconfdir}/X11
-                install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
-        fi
+           if test -s ${S}/xorg.conf; then
+                   install -d ${D}/${sysconfdir}/X11
+                   install -m 0644 ${S}/xorg.conf ${D}/${sysconfdir}/X11/
+           fi
+
+           if test -s ${S}/noblank.conf; then
+                   install -d ${D}/${sysconfdir}/X11/xorg.conf.d
+                   install -m 0644 ${S}/noblank.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
+           fi
    }

 Here is the append file, which is named ``xserver-xf86-config_%.bbappend``

