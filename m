Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3D71C54F54
	for <webhook@archiver.kernel.org>; Fri, 31 Jul 2026 09:19:58 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2768.1785489590517658533
 for <docs@lists.yoctoproject.org>;
 Fri, 31 Jul 2026 02:19:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NVBYLhjA;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D1F574E41046
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A73E66039A
	for <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CE5E511C165F0;
	Fri, 31 Jul 2026 11:19:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1785489583; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=939gnGI4atLQyC2LDSUVECDkEVZTz7018SqVEPFGyik=;
	b=NVBYLhjAUsgbnpQeNaitybusbAeKgnvMtNhM/tkoEceRyRN8ornr4mCkwIn/cNK4J0pqdG
	Hk+NRu0L8ogcUzy7KGoFq/yQUzyYyfihe+D746/SY3ew7bZuPOuY6Lztuza5j70NJdxbHn
	N39OeljnQE3Pw4ZxAT9iAPkxua6lMJfDiLy1sAaGZQjG7UQ0y7Yn9FQihHbZ58taMzrPN/
	nvHF0SHefmm+QjarVEoGoqpgnynL+CZVJ9NqIaY6rv1XiXITWHWEmNxwlwA6BlHvHBlla2
	4pCw++Slc12rDpr2gt6AyXLpcRRpBj0F6xACTNAT56/yzN5DaisY1/YMCqKtww==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 31 Jul 2026 11:19:26 +0200
Subject: [PATCH v2 3/5] sdk-manual/intro.rst: link to sysroot term
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-sdk-clarifications-v2-3-b34f797492b1@bootlin.com>
References: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
In-Reply-To: <20260731-sdk-clarifications-v2-0-b34f797492b1@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1438;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A2/kinPAH6S0ZFgEdtAVxUyXE+SE8RZJxizs9e4LqJ4=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqbGihMReLkNqulgtiR6IqlaqcHtJs3oznCyl8H
 uZIxQYcqyCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCamxooQAKCRDRgEFAKaOo
 Nj9LEACGlI6LK0+hLFkqn/75QZQyWwMFTwL/iHIC4JvsVKbU5sbkANkC6TA7t8gfRrAOK6LmzFw
 Iy4aqkYTJCPjTmoh5HNzBXhv97Xwzfh/pzVLV4J01XuOtYbPpecKAjq5oLySA25IOF8shdJZXH2
 lKl6HLZElk7Z7yag89Eia10A2hsWXsU59PiNrfi3PSu+GvRc26Ck3puFEayiHVq5ZsQrpFlrgQ2
 b7lQchFhIDzO2v2YZsstX5Vm7yuHJvDcP0TvOaVDEvZeyZTvJooKu9e56lmSVamPH1Oq/ppWWxY
 yvR+F0tk7hPKa0ParPAKvj6qmp67EJCDddCvyYsMHAituKGKjHA8/ntW8BeHzhjgKh6OXhg5scs
 oUHP1uZESyv4qtj1ajRMMCWY1/QLqGEWWZvGDQj1zQwsyXe+GZOoOMvZ9jb6rG+aTEAlrNlTrbp
 RZhM23VZ58SxUpACetE1veNaV0e/QeN9DkKZ3hl+CVmrlc9TAL+p3mZUgb0de7arYFSjREG43bh
 TdnjMRlQFw+ajK1YlWEgYnvPGBmxQ0TSAWBJY0ioiopjdWJ23Utn3sstEnKxdbUi0kYDgU+XMGN
 VtFf1Nl1irqWIeGEhI7btau4QKsACffZ8i8NDoUx5VZ2rCW+MCJUF9xxFf05WxfPFdlkTL64t0F
 JY6u1fYfXkaxpmw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 31 Jul 2026 09:19:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10209

Link to the definition of a sysroot (from our glossary) when it is first
introduced and later in the "Sysroots" section.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/sdk-manual/intro.rst b/documentation/sdk-manual/intro.rst
index 3e78219fc..53246bd9a 100644
--- a/documentation/sdk-manual/intro.rst
+++ b/documentation/sdk-manual/intro.rst
@@ -45,7 +45,7 @@ environment script and contained in variables such as
 :term:`CC` and
 :term:`LD`. This reduces the space needed
 for the tools. Understand, however, that every target still needs its own
-sysroot because those binaries are target-specific.
+:term:`sysroot` because those binaries are target-specific.
 
 The SDK development environment consists of the following:
 
@@ -117,7 +117,7 @@ cross-toolchain works with a matching target sysroot.
 Sysroots
 --------
 
-The native and target sysroots contain needed headers and libraries for
+The native and target :term:`sysroots <Sysroot>` contain needed headers and libraries for
 generating binaries that run on the target architecture. The target
 sysroot is based on the target root filesystem image that is built by
 the OpenEmbedded build system and uses the same metadata configuration

-- 
2.55.0


