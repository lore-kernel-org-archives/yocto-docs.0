Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3CC5ACCF9F8
	for <webhook@archiver.kernel.org>; Thu, 30 Oct 2025 16:29:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.2032.1761841754063713122
 for <docs@lists.yoctoproject.org>;
 Thu, 30 Oct 2025 09:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=ChDO4PZj;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id B2FD5C0DABA
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:28:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2E2C660331
	for <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9C66E11808C70;
	Thu, 30 Oct 2025 17:29:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761841751; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=KLkCBseW9aS627RRW7sVZzYAWtryzereAir6l2l/nh4=;
	b=ChDO4PZjUVC0m4gTdvcjpi0609xglN2q4wLoBDqmoX+Ot9ni/aGEg4fEYvLpHQ7ABTZrXp
	1t3KGEWA0M81x3+lcv8OLDxARH3q1Q8nZlcl4FHYmEx8L/WcW0jycwM4l413aXBxG5lgLH
	uXs8SjCKV1DFgoWGnk2PPHiHYIwt7oUWju21eXcQ8Nbvs9UhyekdamZrjVlMVxGkDu2TNn
	yM6gjQgXvvI0a5e7oKNW4YbDUS/6veGnVCtPUwMnX+q1CZeGCOZnU4odTd8i3o/N5BxPHT
	Sm/5Tc99K1VZc4Iw0lgi3MJFZx/fOPkJt8AqR++7vl9EVwY5/ta8j4U2TSXurQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 30 Oct 2025 17:28:30 +0100
Subject: [PATCH 1/6] ref-manual/structure.rst: update the description of
 local.conf and bblayers.conf
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-bitbake-setup-v1-1-f44a8a2b7c0b@bootlin.com>
References: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
In-Reply-To: <20251030-bitbake-setup-v1-0-f44a8a2b7c0b@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3543;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=AhBjTKnHovf0ExX7b7Tg8YbYXWUKc75dq+6kRLYo2Ro=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpA5JVVaUIlQWp97slWvLbJEBD7toGSmrMTerSS
 V+C9r4W9zmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaQOSVQAKCRDRgEFAKaOo
 NnBLD/94syQwLYPnOKQOJUJAXiptSoxe6iRuUZwUxbktWgudgp4Dx9wQRPJzIDKpCf7Q6PdNVKG
 081cpImD8/u2Nk+5aFPIlOGR3tNuVXo+zQQbRwVxRAiyb1Ei2dN573o6YhBNQcOlGmz3Fb2RfZT
 PEjhXWaK0B53NiexqTCuO1oE67qbhL+87cNjoVHqfXdzvBpePYMM7HreZ99rDtvTTy3vXkKeT1o
 +DwiWkzFFMlOjnn6bS/6i5unORccsWw+3r1rq3m2HbVvYbYxYzNuBQzZvKbQlImu/WYohds5ZZr
 kQNGJdK82g5cRBJZleGtczlPeejBdyrN5SvSVYj/WZHRAhbvxL5cX++PYYRjdTznJSqaf+0ZjAg
 O4EBAd4+qgXdCow2gPE0BdnAw+d+8PHjOmRICW9TV9YqlOhwQlxuNoiMvYlzHsblwkBPpHzY6gS
 9UVXIhgLzSG5gB7kr+SiY42mLWxLmVAfLvHYAB72+6x5gAKgeEIeH9stjmRI/eBa9613lCfh7Ys
 gHa6HP3vqxvZbh7bl4pU7MQRby2YnTOPGN+Z0v5Mw3esu8RT8wl0KkcNerzyrTCsG5DLAmomGAV
 G9wO9dTAhumweEjbaWjDHAxDVdNf4S0RLoHywPLk+idxqgL+eHovF8KPB9hVR2JFkKjd+k/HTsi
 DkHL2TeCe03dRCg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 30 Oct 2025 16:29:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7926

The local.conf file is now mostly empty with the default way of setting
up the environment (with bitbake-setup), and this file is meant to hold
local user configurations, rather than an extensive list of variables.
Adjust the description to reflect the intended way of using this
configuration file.

Also, for both local.conf and bblayers.conf, rephrase the current
usage of the template files (.sample files) to _not_ imply that it is
the default way the OpenEmbedded build system sets things up.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/structure.rst | 32 ++++++++++++--------------------
 1 file changed, 12 insertions(+), 20 deletions(-)

diff --git a/documentation/ref-manual/structure.rst b/documentation/ref-manual/structure.rst
index 2640f461d..f7d7a819d 100644
--- a/documentation/ref-manual/structure.rst
+++ b/documentation/ref-manual/structure.rst
@@ -269,22 +269,15 @@ This directory should not be shared between builds.
 ``build/conf/local.conf``
 -------------------------
 
-This configuration file contains all the local user configurations for
-your build environment. The ``local.conf`` file contains documentation
-on the various configuration options. Any variable set here overrides
-any variable set elsewhere within the environment unless that variable
-is hard-coded within a file (e.g. by using '=' instead of '?='). Some
-variables are hard-coded for various reasons but such variables are
-relatively rare.
-
-At a minimum, you would normally edit this file to select the target
-:term:`MACHINE`, which package types you wish to use
-(:term:`PACKAGE_CLASSES`), and the location from
-which you want to access downloaded files (:term:`DL_DIR`).
-
-If ``local.conf`` is not present when you start the build, the
-OpenEmbedded build system creates it from ``local.conf.sample`` when you
-``source`` the top-level build environment setup script
+This configuration file contains the local user configurations for the build
+environment.
+
+You could for example edit this file to limit the number of threads used by
+:term:`BitBake` (:term:`BB_NUMBER_THREADS`) or set the location from which you
+want to access downloaded files (:term:`DL_DIR`).
+
+The :term:`OpenEmbedded Build System` can create it from a ``local.conf.sample``
+file when you ``source`` the top-level build environment setup script
 :ref:`structure-core-script`.
 
 The source ``local.conf.sample`` file used depends on the
@@ -321,12 +314,11 @@ which are directory trees, traversed (or walked) by BitBake. The
 ``bblayers.conf`` file uses the :term:`BBLAYERS`
 variable to list the layers BitBake tries to find.
 
-If ``bblayers.conf`` is not present when you start the build, the
-OpenEmbedded build system creates it from ``bblayers.conf.sample`` when
-you ``source`` the top-level build environment setup script (i.e.
+The OpenEmbedded build system can create it from a ``bblayers.conf.sample`` file
+when you ``source`` the top-level build environment setup script (i.e.
 :ref:`structure-core-script`).
 
-As with the ``local.conf`` file, the source ``bblayers.conf.sample``
+As with the :ref:`structure-build-conf-local.conf` file, the source ``bblayers.conf.sample``
 file used depends on the :term:`TEMPLATECONF` script variable, which
 defaults to ``meta-poky/conf/templates/default`` when you are building from the Yocto
 Project development environment, and to ``meta/conf/templates/default`` when you are

-- 
2.51.0


