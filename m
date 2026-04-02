Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81C5ACC6B2F
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 08:22:27 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11109.1775118143114016953
 for <docs@lists.yoctoproject.org>;
 Thu, 02 Apr 2026 01:22:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Nr4l1blu;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 9F8481A30E9
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:22:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 707655FDEB
	for <docs@lists.yoctoproject.org>; Thu,  2 Apr 2026 08:22:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 507A310450221;
	Thu,  2 Apr 2026 10:22:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775118140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=FGmOL41CYUmVq1pg6B29pRoHbRQw+f0nKsoTEiXsHEo=;
	b=Nr4l1bluVHLgcapfOyEFePmfEq/u5U+qdgWquePaVBpIegLjGw+dSigHppNj097MbIAkxy
	xuX3YkVnutRLtD4yVRNNC4rFhKy3yMbxixRE1RG9E6DnkoHLCtKgSvM97pgTOGsApk8vE6
	Wsb5zc6KA/9Ni9zhJKnT/soUxvMUXnoU3uA2CVsOUEmq/RR7F2bKs9VicAbR0vyKlK2pIB
	puMOy/cEPYMa5/H4X+TAteJaHM/cw0RGApynh0mt3oRsImebOuxFJlR3DBNjR+GkbAMysZ
	5p423GZRu38tK7HHhb8Ryfe+PkUTZGj/dJ3IUs9Gqd8aaMrCkuAMIqb/Sw6JxQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 02 Apr 2026 10:21:59 +0200
Subject: [PATCH] ref-manual/system-requirements: add buildtools note for
 Alma/CentOS/Rocky 9
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-alma-centos-rocky-builtools-v1-1-447c92372100@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMOw7CMAwA0KtUnrGUhI8EV0EMqTFgCDGKU9Sq6
 t0JML7lzWBchA0O3QyF32KiucGvOqBbzFdGOTdDcGHnNi5gTM+IxLmqYVF6TNgPkqpqMlyHLXm
 mvY+BoA2vwhcZf/vx9LcN/Z2pfktYlg/cXoTKfwAAAA==
X-Change-ID: 20260402-alma-centos-rocky-builtools-325c1ec91a2c
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iqR1kfFsKVsevZyn3hZj27ShPRPZVy7QabiCgF8lZ+8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpzic8CRpj1OWE6uHdjEA+gtcGYuz4c6kC3yS15
 KIb1V0E+ruJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCac4nPAAKCRDRgEFAKaOo
 NoGVEACpcOG0S9jcDtpXRx2t+AaaF4Whu579gD+XeceCmmrhxemNz1sdPgD8RSgBDTOqlf7dCrZ
 UzMqvZ8igeYYuqob/85lRqN/qc8DEDSCyNyf5w59k7G3OtoixszTGLMSCehlmOBQN+fuUaJBvwc
 Hv6a/y5M0id4eZu96TamscZmixtQS5+CTt2wyivqSEjpn7Cr0syA2wn/RMvNdjKF8Nc4H+l9vN3
 3V0vAQiGUkXaVSpqCRdEKwKYmkVTi2VzKpwAPzZY/gTxxnxykE4yLljVBtN8+KufnTGeFkLDEiw
 ZCTAU54MQCgzLk57+ATuPKIln/DpUz5uoaVgehj/QM8Jkvh9cP6exR6edGWyhqXq+B5zEpP9bif
 +x+KzZF/ieKg9kH/mCkVmyxejSkdpk0+MX1WPVSrVI3x9EKNhDDcISC2SrUjePMERx/RYP7hLH3
 JJIYjHIgVUP1UPbzY88xI+xLXu57T8W87cLLkxD9JwvheIvDTBroKdt/A9WS8WTOHPWU/kv+FtA
 dWGku76p4cP9gLZyMQoE9H40S0dGH4T9vzirpG7lZIXV3oV/d+x6mglUdgtknF7Lzjjrcj7KZaZ
 X67HJZg9CGvsI8b+9mJ7oBKr3MDEPeY7PojzAkoLVWYsZsvoQTh9KWG9ngiqtii8aQ8L1WiE/Z3
 mSAxJLQY4pFzmFQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 02 Apr 2026 08:22:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9160

These distributions are affected by a bug with tar described in [1]. Add
a note for installing buildtools for these distros as described in the
bug comments.

[1]: https://bugzilla.yoctoproject.org/show_bug.cgi?id=16143

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/buildtools-alma-centos-rocky-9.rst | 11 +++++++++++
 documentation/ref-manual/system-requirements.rst            |  6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/documentation/ref-manual/buildtools-alma-centos-rocky-9.rst b/documentation/ref-manual/buildtools-alma-centos-rocky-9.rst
new file mode 100644
index 000000000..713b729a0
--- /dev/null
+++ b/documentation/ref-manual/buildtools-alma-centos-rocky-9.rst
@@ -0,0 +1,11 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+You will also need to use a :term:`buildtools` tarball which provides a set of
+basic host tools with fixed versions. Follow the :ref:`system-requirements-buildtools`
+section below to learn how to download and install this tarball.
+
+.. note::
+
+   The AlmaLinux 9, CentOS 9 and RockyLinux 9 distributions are affected by a
+   bug described in :yocto_bugs:`/show_bug.cgi?id=16143`, which is the reason why a
+   :term:`buildtools` tarball is required.
diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index b427e2c64..c4d8cb5e0 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -236,6 +236,8 @@ with a supported AlmaLinux distribution:
 .. literalinclude:: ../tools/host_packages_scripts/almalinux_essential.sh
    :language: shell
 
+.. include:: buildtools-alma-centos-rocky-9.rst
+
 .. note::
 
    -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is
@@ -285,6 +287,8 @@ with a supported CentOS Stream distribution:
 .. literalinclude:: ../tools/host_packages_scripts/centosstream_essential.sh
    :language: shell
 
+.. include:: buildtools-alma-centos-rocky-9.rst
+
 Here are the packages needed to build Project documentation manuals:
 
 .. literalinclude:: ../tools/host_packages_scripts/centosstream_docs.sh
@@ -321,6 +325,8 @@ with a supported RockyLinux distribution:
 .. literalinclude:: ../tools/host_packages_scripts/rockylinux_essential.sh
    :language: shell
 
+.. include:: buildtools-alma-centos-rocky-9.rst
+
 .. note::
 
    -  Extra Packages for Enterprise Linux (i.e. ``epel-release``) is

---
base-commit: c1c6eee66915b225a2efd5433fa1a9cf964f5abe
change-id: 20260402-alma-centos-rocky-builtools-325c1ec91a2c


