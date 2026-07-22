Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366CFC531BC
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 12:58:35 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.47564.1784725109780995732
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 05:58:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=KMCA4Ldf;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1BE6C4E40ECF
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E1D8760388
	for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 02BCC11BD3D0C;
	Wed, 22 Jul 2026 14:58:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784725107; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0OZysO7RvypX10rqayIycr7HrN11fRitm9YkTxRfaV4=;
	b=KMCA4LdffD9LU6KgXjASkyN6j918AVWb/AX7wGyjpTLmoxndYDgFhxihcantBNd8xmQQxr
	VgBfQfgAJRUCyCcKqEMv1Z9VRQTCsprM2vwDQX3r4DD/QDVaE18ukDs7yVuLX95zDp2L8e
	3nJAfIUZK2qG1NcvBjbr31c8FmA0jpoesgGjyWW7jW4xs7VeOKe/UTfgMn3DQRmZQHsxPo
	g3RsEeJFMGl/NDoKlAH8OMOC/tvMjP4SjPXe/aqiC2beZFFglnaEd2+JHJptau0fOh+jcz
	UQ5KpZ92N5B0GMWJ3w8LD4RSYX19DAbSEoLWFF3HO1pGSaA57FBrNDV0VBrRWw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 22 Jul 2026 14:58:13 +0200
Subject: [PATCH 4/5] ref-manual/variables.rst: SSTATE_MIRRORS: move
 password note to shared state mirror document
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-sstate-mirrors-doc-v1-4-570baeb41c32@bootlin.com>
References: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
In-Reply-To: <20260722-sstate-mirrors-doc-v1-0-570baeb41c32@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3839;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=K4QnNEAxjqhCrhN4rZJ5q4eLFri+hYmAhekCJmOnuOs=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqYL5vCVMQKSHi/Q+o3QHjVFpCx2mKy4CQNR5Xq
 qe0/4TIbqCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamC+bwAKCRDRgEFAKaOo
 NnSwD/9213guXKowX6aUyAShykNDKj2q4UzmbOeLQbjIwopSzeh7iVL2gudECvl5yjwljSRY/CE
 Ip+2eIOhZD6PgauRTtYkguSDCL6sFallIGKYsCKBFnXPkYwwG0x4EvpM2CHCmk4yJOtw1r/Gfkc
 g93dQ/iTbq+zOVkYCGJU+kjQ7mHHO8SFnHJJ2ebqBsMsMxRl9xqX1btp+MIq7bv1/wjbcRZDhSt
 6ipmSM1JtHUiC4+MvqlhiibWctcb9ePIuSr1+GufNRtYyxTUwe0uaiGvOU2nHYhbLKrQ/NLAXYz
 J5IAcN33axTgVGcThmbJWCkzFreDTPTSfervmsxmxBhN849DYyT1ZRQlPvK77b6lHMwbxSdbyA/
 svYXlD/QfCx+XrCaLPRbz45yUnWDz07XO4kWZ2vXZx7vc47m8bm8XNdtysB5AH8RVs8LURkc4oX
 8i08zxyMkli47eWztGtRtLS5soBDsBaxoaeevaRZEA0RVNhN/jkk4F73xdAMLEKrRYDphC9xM2p
 nFGeQa0sapVgMxebX+FPJuNu2n6zlI3/jKBY0gtCFtwRXqlVmuLdapzlFZSYFDS1WvcWMrPr5YC
 QcWw9bh+KnHF/inte0th5H7CNuL2ZL+9HwFzTf9BI70b0H5jA8tlCIW738PV7WpuTPd0SctRlbV
 aK5m631C6nF8RBQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 12:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10112

Let's gather the different tips on setting up a shared state mirror in
the same document, so move the user/password note from the
SSTATE_MIRRORS variable definition to the sstate-mirrors-setup.rst doc.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/sstate-mirrors-setup.rst | 28 +++++++++++++++++++++++
 documentation/ref-manual/variables.rst            | 28 -----------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/documentation/dev-manual/sstate-mirrors-setup.rst b/documentation/dev-manual/sstate-mirrors-setup.rst
index 6c369ff4e..e69aa00d1 100644
--- a/documentation/dev-manual/sstate-mirrors-setup.rst
+++ b/documentation/dev-manual/sstate-mirrors-setup.rst
@@ -112,6 +112,34 @@ Going Further
    :doc:`/dev-manual/hashequivserver` section of the Yocto Project Development
    Tasks Manual for more information.
 
+-  If the mirror is protected behind a username and password, the
+   :term:`build host` needs to be configured so the :term:`build system
+   <OpenEmbedded Build System>` is able to download the shared state cache using
+   authentication.
+
+   The recommended way to do that is by setting the following parameters
+   in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
+   directory)::
+
+      machine someserver.tld
+      login <user>
+      password <password>
+
+   This file requires permissions set to ``400`` or ``600`` to prevent
+   other users from reading the file:
+
+   .. code-block:: console
+
+      $ chmod 600 "$HOME/.netrc"
+
+   Another method to configure the username and password is from the
+   URL in :term:`SSTATE_MIRRORS` directly, with the ``user`` and ``pswd``
+   parameters::
+
+      SSTATE_MIRRORS ?= "\
+          file://.* https://someserver.tld/share/sstate/PATH;user=<user>;pswd=<password>;downloadfilename=PATH \
+      "
+
 -  If the :term:`BB_NO_NETWORK` variable is set to "1" on clients as a means to
    disable any accesses to the network, the :term:`SSTATE_MIRROR_ALLOW_NETWORK`
    variable may be used to allow the clients to fetch from the shared state
diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index e650fecda..3f4788648 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10100,34 +10100,6 @@ system and gives an overview of their function and contents.
       cache (sstate-cache) results from previous builds. The sstate-cache
       you point to can also be from builds on other machines.
 
-      .. note::
-
-         If the mirror is protected behind a username and password, the
-         :term:`build host` needs to be configured so the :term:`build system
-         <OpenEmbedded Build System>` is able to download the sstate cache using
-         authentication.
-
-         The recommended way to do that is by setting the following parameters
-         in ``$HOME/.netrc`` (``$HOME`` being the :term:`build host` home
-         directory)::
-
-            machine someserver.tld
-            login <user>
-            password <password>
-
-         This file requires permissions set to ``400`` or ``600`` to prevent
-         other users from reading the file::
-
-            chmod 600 "$HOME/.netrc"
-
-         Another method to configure the username and password is from the
-         URL in :term:`SSTATE_MIRRORS` directly, with the ``user`` and ``pswd``
-         parameters::
-
-            SSTATE_MIRRORS ?= "\
-                file://.* https://someserver.tld/share/sstate/PATH;user=<user>;pswd=<password>;downloadfilename=PATH \
-            "
-
       The Yocto Project actually shares the cache data objects built by its
       autobuilder::
 

-- 
2.55.0


