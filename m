Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA75FFD5312
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 08:55:49 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.91389.1772182547091658656
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 00:55:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Pws0IFlY;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 1FA994E418B8
	for <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 08:55:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EA0435FE46;
	Fri, 27 Feb 2026 08:55:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 69089103682A1;
	Fri, 27 Feb 2026 09:55:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1772182544; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OxHnsEHJjOYgcMoAqTdoWc2RqReRTUH5Fsv8T/F43Mc=;
	b=Pws0IFlYxeYqJGvFqhHuw3O9lP4Jv1ehF6bsTAPNvLrel9A+Y7JmbpGxBmdVbf1eXnd4Om
	vtFexV5X7H4n7u9dyEaq+lFO28u77I8j6Ml4kaNTRJy8BB1rUfivXn8dLqZJTpgUv8DNG0
	MBvBd3HBVgHx2Dt2ea1QbZ2Z2UPdLdLB3QVJvVqKGLmdQNnWOwDOV73UcwOwptOrjxLC00
	YQVOsR85HSBobB6ciBFxl5vhKQXH04wpqeX3/VXf4kz1jtcL+0GfZEXp22U9ngtbWcbU4K
	e6evh8yi1PHa+hAXc9vitmfrOPJ33QP5CvUOVEyxafYzHWBdB4U7qpqvUx8LuA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 27 Feb 2026 09:55:31 +0100
Subject: [PATCH] tools/containerfiles: fix docker warning
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-fix-docker-build-warning-v1-1-5557689ebc3e@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBCF4avIrDuQjGCKVyldmGS0U0ssk1oF8
 e6mdvnBe/8GmVU4Q1ttoPyVLFMqsJcKwqNLA6PEYiBDjSFy2MuKcQojK/pZXhGXTpOkAa+WrHM
 +1rUhKPe3ctme6dv97zz7J4fPrwf7fgDSAPOgfAAAAA==
X-Change-ID: 20260227-fix-docker-build-warning-812177bd3302
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3306;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JiZ+P1UmQIbHscmNQYf0p8cbHPNljqDvLR0Px7RyJg8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpoVwPlLoXgM1jOgVcwUkRDhUU3Hwuk00rF2QV7
 Vi0Lg5XZFeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaaFcDwAKCRDRgEFAKaOo
 NuKdD/9IIjjlaUzG4Zy8pZnTrN4PHiO662tkCptNXh/ZjthjTze38dFo3qONnL/H27ljZ8irTph
 erllVz0rLf30+3z5cRKRhQqpbcUstnwpNWQZzAzzpfDN1biCtp1khZlAbUCft0NLkyPxj49moi1
 M6D2GGL/Gtg1Z+Y3zzkIwCkT2Gtu08M5rhsuBBBg1zSAIV7jVQlGs5bgeYat9eVVzg/EgoweLZF
 PPJdmMIngSiZYv+gzo0n8iml+5Ytyxam5f4EI6Kg3uLzStPDKqpSN7TQW1+ZwJkqGadffMw2MN9
 5GTUnIGyuW1FFZlxsyQT9I+xoFJmtBNU8AgbqDpVaok+74gzRCbBtHY2Y4wQzWV3R7im+3YlXUQ
 N5gScMLPLtk/pS9z0UlxqZeNerKfCBVI6Vu09t7SUgkcD1d98jkSTIAzk5IQzAEARz1rTDjX2Bc
 wkLns0yfZLxIwm5FU4IIZ/Y572/6KMUlWYYiPQFKP8USnvp8UnY3dc27qiRiZLfBg4sXFP6j6iY
 99vhP+HA/KVHZq7UEwsrtmT38PE+AcirxsT20ZKKVw3tICycLCEUcf0DLI3sYMGLhM76N5nDtxM
 EoxOO3EqWWUxiXUEw89IIx4VMWCkDfz47dj5lLnSQJAhxnruR9PBLiUy0VTv9RhQ1M+sIvp1xk6
 LAYdY4iNVPoKkXA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 08:55:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9001

The current Containerfiles produce the following warning with docker:

  1 warning found (use docker --debug to expand):
  - UndefinedVar: Usage of undefined variable '$PWD' (line 12)

Remove $PWD and set the WORKDIR so that our pip3_docs.sh script finds
the virtual env.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/tools/containerfiles/Containerfile.apt    | 6 +++++-
 documentation/tools/containerfiles/Containerfile.dnf    | 6 +++++-
 documentation/tools/containerfiles/Containerfile.zypper | 6 +++++-
 3 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/documentation/tools/containerfiles/Containerfile.apt b/documentation/tools/containerfiles/Containerfile.apt
index 7ee168be1..0f480a79f 100644
--- a/documentation/tools/containerfiles/Containerfile.apt
+++ b/documentation/tools/containerfiles/Containerfile.apt
@@ -9,9 +9,13 @@ FROM $ARG_FROM
 # container, and it must match the pwd when pip3_docs.sh is run in a later
 # layer. This *must* be outside of any mount point otherwise it won't be
 # available within the container.
-ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
+ENV VIRTUAL_ENV=/yocto-docs-venv
 ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
+# Set the WORKDIR to / so the pip3_docs.sh script will find our virtual env
+# when calling '. ./yocto-docs-venv/bin/activate'.
+WORKDIR /
+
 ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=ubuntu_essential.sh
 ARG DOCS=ubuntu_docs.sh
diff --git a/documentation/tools/containerfiles/Containerfile.dnf b/documentation/tools/containerfiles/Containerfile.dnf
index 12d97ef6c..d93ac7e65 100644
--- a/documentation/tools/containerfiles/Containerfile.dnf
+++ b/documentation/tools/containerfiles/Containerfile.dnf
@@ -9,9 +9,13 @@ FROM $ARG_FROM
 # container, and it must match the pwd when pip3_docs.sh is run in a later
 # layer. This *must* be outside of any mount point otherwise it won't be
 # available within the container.
-ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
+ENV VIRTUAL_ENV=/yocto-docs-venv
 ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
+# Set the WORKDIR to / so the pip3_docs.sh script will find our virtual env
+# when calling '. ./yocto-docs-venv/bin/activate'.
+WORKDIR /
+
 ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=fedora_essential.sh
 ARG DOCS=fedora_docs.sh
diff --git a/documentation/tools/containerfiles/Containerfile.zypper b/documentation/tools/containerfiles/Containerfile.zypper
index 6e667967c..2e49311b0 100644
--- a/documentation/tools/containerfiles/Containerfile.zypper
+++ b/documentation/tools/containerfiles/Containerfile.zypper
@@ -9,9 +9,13 @@ FROM $ARG_FROM
 # container, and it must match the pwd when pip3_docs.sh is run in a later
 # layer. This *must* be outside of any mount point otherwise it won't be
 # available within the container.
-ENV VIRTUAL_ENV=$PWD/yocto-docs-venv
+ENV VIRTUAL_ENV=/yocto-docs-venv
 ENV PATH="$VIRTUAL_ENV/bin:$PATH"
 
+# Set the WORKDIR to / so the pip3_docs.sh script will find our virtual env
+# when calling '. ./yocto-docs-venv/bin/activate'.
+WORKDIR /
+
 ARG INCLUDE_ESSENTIAL_PACKAGES=0
 ARG ESSENTIAL=opensuse_essential.sh
 ARG DOCS=opensuse_docs.sh

---
base-commit: ba351b35480d9c06c870a6f34d8bdbc1856b9511
change-id: 20260227-fix-docker-build-warning-812177bd3302


