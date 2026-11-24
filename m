Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17491.1795526299977994360
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Nov 2026 05:18:20 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=rGyr5kX+;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 483D94E4175D
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 18CCC601E1
	for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 53D0411E69945;
	Tue, 24 Nov 2026 14:18:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795526293; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X0ZytRwdfuBjhXsjqGGOIjhCfzb6vK9XDLhxfo97cYI=;
	b=rGyr5kX+bRV9VCU/Bud2kPhLou7lwIf6N+10c1PZNxE2OsRO39msqQ1UKnNKbX9ZxJMRm3
	OrNNayxw+sxr4ltqhEEY59ZshhzaYEnjM9wLKf18RlSJ6kC3H+40X2PRNVcmL7y3IKGi9B
	0y5AwQMGpxjRUN6t59wMWJ/h9Y6rvFGnPZsKgaRmnNm+M+UN3Zf9Axxx+ByQuUlCdd/uIX
	UTb13xRsXOoPQwGkzomj3FUcJJpgmSVd9qRBwS9+lrfryzWA/YB34Qmb5CoJpwgOqPVZZF
	f2QNR7W8QNSESZr5pzy7K/+n/FXk+PJ1Y7gZoO5KLTt4PUd8mMPKaoWeV/L7Ew==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 24 Nov 2026 14:17:56 +0100
Subject: [PATCH 3/3] ref-manual: add a Library Functions section
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261124-oe-utils-docs-v1-3-5fafbf6cb01c@bootlin.com>
References: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
In-Reply-To: <20261124-oe-utils-docs-v1-0-5fafbf6cb01c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2511;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=CG+rJ5o8ogfInOhzbkZ6bnxJOzbvGSo9ncQhcfw3058=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBrBY6ETmvvHqnif3Lms/c/UBFcoqYtiMyC74QZN
 qnCE82pOHWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCawWOhAAKCRDRgEFAKaOo
 Nm4CD/4lWD5WmQluMKS4l2U/Xx6lyb5j/YwuurCIl+N76V8xarIQCHC236CYPQ6RZUJIv2VC9Oy
 gIC6lq5Hi+AEmSCcZP6Mf1IbAt5KMYPAn4BIW+UGgf4TvDZvG0fjq1NFhMVpqa9Dx/rpTTCVikD
 EgeH107gXUP+/qL1ai+oHWI+pwgZfBteYxqyCpFAy/4jtgDVdwm5L5POND/ZSkPcerlE9k3Qxez
 fzcFbWtWFs+ajndhXwGQlsRZ24DN3wOGSJ0llKooivpAuXVPlxuupXz5dVwCCxmx2+SPUZrvioA
 /eDX5HdhI86ISrwb8TEJFOmUcLU3rpcloz6bJXJtaN1dnPamRlAxId18XxaXY/GaSRDyNrVoX4N
 fAhhmSmr9mzYMJInUaSkw648hXeJChLrX92rpSQgiwg1t2/EfnLRGrX2gFkIub2WXwrSrQ5rSij
 h/dc4eQb+uVUsrcF6ukgqcVOkEVPZwOv5OiF2ULikmBy3kkGttodzAfbAqrFFql2yUZXS1qVVrh
 fq6HUPWBdh9Tv5WgaA/y9p+MTKl9/YJ4zWb5juyBQPn+7OAJK3uz9aGIgDktI0pBeH073ie74AC
 tbL58wqds9npjzuA5RRSZSls+Hqw/iGqnG9LvKecG2UtVWWA9n1ujcgHdwYyLP+4d1/1S/Zif7F
 JwklzPZ0UAQV/Lw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <docs@lists.yoctoproject.org>; Tue, 24 Nov 2026 13:18:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10834

Like the BitBake User Manual[1], add a "Library Functions" section in
the documentation which uses the autodoc Sphinx extention to
auto-document useful modules of the oe library.

[1]: https://git.openembedded.org/bitbake/tree/doc/bitbake-user-manual/bitbake-user-manual-library-functions.rst

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/index.rst             |  1 +
 documentation/ref-manual/library-functions.rst | 72 ++++++++++++++++++++++++++
 2 files changed, 73 insertions(+)

diff --git a/documentation/ref-manual/index.rst b/documentation/ref-manual/index.rst
index aa1a63e05..6f02b0fc9 100644
--- a/documentation/ref-manual/index.rst
+++ b/documentation/ref-manual/index.rst
@@ -17,6 +17,7 @@ Yocto Project Reference Manual
    structure
    classes
    tasks
+   library-functions
    fragments
    devtool-reference
    kickstart
diff --git a/documentation/ref-manual/library-functions.rst b/documentation/ref-manual/library-functions.rst
new file mode 100644
index 000000000..6b075c55d
--- /dev/null
+++ b/documentation/ref-manual/library-functions.rst
@@ -0,0 +1,72 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=================
+Library Functions
+=================
+
+This chapter lists common library functions available under the
+:oecore_path:`meta/lib` directory in :term:`OpenEmbedded-Core (OE-Core)`.
+
+These functions can be used in recipes or configuration files with
+:ref:`inline-Python <bitbake:bitbake-user-manual/bitbake-user-manual-metadata:Inline
+Python Variable Expansion>` or :ref:`Python
+<bitbake:bitbake-user-manual/bitbake-user-manual-metadata:BitBake-Style Python
+Functions>` functions.
+
+``oe``
+======
+
+Reference documentation for modules in :oecore_path:`meta/lib/oe`.
+
+``oe.data``
+-----------
+
+.. automodule:: oe.data
+   :members:
+
+``oe.go``
+---------
+
+.. automodule:: oe.go
+   :members:
+
+``oe.kernel``
+-------------
+
+.. automodule:: oe.kernel
+   :members:
+
+``oe.lsb``
+----------
+
+.. automodule:: oe.lsb
+   :members:
+
+``oe.path``
+-----------
+
+.. automodule:: oe.path
+   :members:
+
+``oe.purl``
+-----------
+
+.. automodule:: oe.purl
+   :members:
+
+``oe.utils``
+------------
+
+.. automodule:: oe.utils
+   :members:
+
+``oe.types``
+------------
+
+.. automodule:: oe.types
+   :members:
+      boolean,
+      float,
+      integer,
+      path,
+      regex,

-- 
2.56.0

