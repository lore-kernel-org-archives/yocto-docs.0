Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F02CCE9D65
	for <webhook@archiver.kernel.org>; Tue,  6 Jan 2026 15:34:51 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.92536.1767713682754160576
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Jan 2026 07:34:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=E2n5xewa;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 192AFC1E4B6
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:15 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 272E760739
	for <docs@lists.yoctoproject.org>; Tue,  6 Jan 2026 15:34:41 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9180C103C84A4;
	Tue,  6 Jan 2026 16:34:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767713680; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tUr1BgkDHNEjHInusSWasFsqcm4sY47hVWkkbdzza10=;
	b=E2n5xewag/O7tjdOicHmPOZhJHV7JOtPj+x8TtMs5VZa37YXIQ23wAPL6e2HTMEyCJrbq5
	eqjkXLO93mIpovwgTSh/6CT5Tto5s7A1D+uEj8s9PWWtrG9XKz+1Q66+jRmu3aYJEwhYN6
	zy9TK/c1mJmuhFmzeKYjswlJ7Tfv+rBK8yFCilEeIon6VjtgY19+455SGY6iJWPadEqa2G
	eVXYh1sy+Jtqzhh9uAQSDCfkyGl9uQaCWkwMQl9I7mUIBDiRm3En+Oz1UWzzQ+U7WpIhS9
	ey8qeF+avM4IUxvT2BpuEP4sywgNdeTE3g6GWcpnylyIYfo7jqaFTpPhja7sFw==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 06 Jan 2026 16:34:31 +0100
Subject: [PATCH 1/3] Add a security manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260106-security-manual-v1-1-500fe611a4d0@bootlin.com>
References: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
In-Reply-To: <20260106-security-manual-v1-0-500fe611a4d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3183;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=48yxQHadZNtM9hg43eFG62xzEUvOLV/nPnR5NZIaSmQ=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpXSuOC4ey/Lsddil+Rjn3jbuWIY1pHlBhsytfF
 7uIwU+KKDqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaV0rjgAKCRDRgEFAKaOo
 NsYMEACBqJvSflKazzoxJcPu+uSxGi61Tad0P1OWVd7hIiWffyptVRoX7n/FdvOAyZMKEOMkunn
 R1OcMgwvzB8OuEG399E57JcMEJZwCKrwpo5Nax8E3kgSIkSN/xKqqDR7QUeo2D4FVY0NSA0fsvZ
 rMf8faVFx1t/y1P3PM6YcM45SAIkXjVg2j+v3xkZtqOMT7Jeg3Zx1ybYOQu+9z9SvGTUy4JMcEf
 43qxQNpXm6DfK+GyJ3Xi9+GdavmOb3RWlNBvk8fXcVn3WgmWTuDjNdvl9DnWvbtFRjz71Ml0j72
 ya68WGuy7yekJnxKUbJtxBUfvep2x69uVqu5CmC9RqC6pUh2bz0eKZXkUn2Z+flSK6J8JLKjtkL
 4/wqrnNEm0Nq1RT4tyhB8RwDuAO/Y0l61UBO1g0Cx9p2gdsAIrX/uKKsl+lLJ0/pWrntE3knkiy
 zcp47L2M1ymjbyF34tJkpTcgga5Cj6aiNFaH1YiNLA21JeifgTq/NWpjG8oumpi2gRnnc3ku1Cg
 5Jd+QFTpIL3HVRCI9I6496Kmjfg+nM8zrFKv3t/zQT1yIyA/MXVMPt1+5HvnZNXfaZiRKDiXs0s
 x42wUEtQbZZo1lYE7q9wy6Uff9gXRGiD3eH4FJODdtBoVCKeqIqbsBYId1cmrO3hrrWfNUq4qgf
 9zpbqq+VxJH+F2Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 06 Jan 2026 15:34:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8398

A new manual in the documentation, to separate out security-oriented
tasks from other ones. The end-goal of this manual is to be a place
where users can add security tutorials/tips to harden images, or
document ways to deal with vulnerabilities, as long as it's supported by
the Yocto Project.

Add an intro document stating what this manual is for and what it's not
for.

[YOCTO #14509]

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/index.rst                 |  1 +
 documentation/security-manual/index.rst | 16 ++++++++++++++++
 documentation/security-manual/intro.rst | 28 ++++++++++++++++++++++++++++
 3 files changed, 45 insertions(+)

diff --git a/documentation/index.rst b/documentation/index.rst
index 037edcee6..7d933acc0 100644
--- a/documentation/index.rst
+++ b/documentation/index.rst
@@ -30,6 +30,7 @@ Welcome to the Yocto Project Documentation
    Board Support Package (BSP) Developer's guide <bsp-guide/index>
    Development Tasks Manual <dev-manual/index>
    Linux Kernel Development Manual <kernel-dev/index>
+   Security Manual <security-manual/index>
    Profile and Tracing Manual <profile-manual/index>
    Application Development and the Extensible SDK (eSDK) <sdk-manual/index>
    Toaster Manual <toaster-manual/index>
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
new file mode 100644
index 000000000..92a883f00
--- /dev/null
+++ b/documentation/security-manual/index.rst
@@ -0,0 +1,16 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+=============================
+Yocto Project Security Manual
+=============================
+
+|
+
+.. toctree::
+   :caption: Table of Contents
+   :numbered:
+
+   intro
+
+.. include:: /boilerplate.rst
+
diff --git a/documentation/security-manual/intro.rst b/documentation/security-manual/intro.rst
new file mode 100644
index 000000000..03a8ed1ca
--- /dev/null
+++ b/documentation/security-manual/intro.rst
@@ -0,0 +1,28 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+************
+Introduction
+************
+
+Welcome to the Yocto Project Security Manual. This manual provides relevant
+procedures necessary for dealing with security-related tasks supported in the
+Yocto Project environment. This manual groups related procedures into
+higher-level sections. Procedures can consist of high-level steps or low-level
+steps depending on the topic.
+
+This manual provides the following:
+
+-  Procedures that help you securing an image with features supported by the
+   Yocto Project; for example making a root filesystem read-only.
+
+-  Procedures related to processes outside of the target images; for example how
+   to deal with vulnerabilities.
+
+This manual does not provide the following:
+
+-  Procedures on security features implemented outside of
+   :term:`OpenEmbedded-Core (OE-Core)`.
+
+-  Documentation on the security mechanisms themselves, which can often be found
+   in the documentation of the feature itself. This manual focuses on how to
+   integrate the security mechanism within the Yocto Project.

-- 
2.52.0


