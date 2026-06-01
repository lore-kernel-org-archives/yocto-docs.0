Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F928CD5BD1
	for <webhook@archiver.kernel.org>; Mon,  1 Jun 2026 13:29:40 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.28560.1780320578162443775
 for <docs@lists.yoctoproject.org>;
 Mon, 01 Jun 2026 06:29:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=mUwdMSnD;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 35E0D4E42DE1
	for <docs@lists.yoctoproject.org>; Mon,  1 Jun 2026 13:29:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BD4C6026B
	for <docs@lists.yoctoproject.org>; Mon,  1 Jun 2026 13:29:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6ECF11088822D;
	Mon,  1 Jun 2026 15:29:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1780320575; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=KUpqut0/XCBsW3+O36jAA8h2k5oudg52JtMUMg4U7f8=;
	b=mUwdMSnDZhbnij2M8bHdebW1RbTEevZl6oZzkW79ZVGdRA1RPvFgFadwhmFITASQ2vrWfL
	GEeDNOk2XE6yWjjg4xKoJ8W4IuLcItOLmUchK8m1wuS+xKFi0GHxOIrROTvj7hsPOVrZvc
	NnaARcjp6yiAReJ3YUL5TtXCJDZdLZ+4wBlOHEkqB/dUtwLzIlVzn6F4/FNxL6ltIcLGZG
	39qoqkLPt2m90V7W0bLh4lRCWZpXSFh/5Y4yCI/JHVGR0xGjMIF89V5DUom3fKoyQvXSog
	j4UZ4VKcKpWJ4vLvil43G1IE9EvfH5RiZTgna5NcBqpqzDs2Y9s5DtejPelPvg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 01 Jun 2026 15:29:28 +0200
Subject: [PATCH] ref-manual/variables.rst: link *MIRRORS definitions to the
 BitBake manual
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260601-link-mirrors-def-bitbake-v1-1-fa69ec343eac@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMwQ6CMAyA4VchPdtkjGQGXsV4WFmRgg7TgjEhv
 LtTj9/h/3cwVmGDrtpB+SUmSy6oTxX0Y8w3RknF4J0PLrga75JnfIjqooaJByRZKc6M59RECg2
 l2Hoo+VN5kPdvfbn+bRtN3K/fHxzHB/hWEaJ8AAAA
X-Change-ID: 20260601-link-mirrors-def-bitbake-7d3ab63bda92
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1524;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZqEEqU0yGO2+sj0KSiy8rNhBaGXc8l42i0X66hFwE/c=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqHYk+9ESY5ryMX2Q9PvGu1+vHgSARyOV5FMCIZ
 fC4jHcqq0yJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCah2JPgAKCRDRgEFAKaOo
 Nn47EACvx6aG7KR/6zoKQnUyoPVhjNn+PiNNVMtEnK5gU4XzngPHNvkNa3jDq3Y56Feg7wUp/dl
 Af1kO1JDkHrB3TN8ptJ3ni5BTGCaNpuX93CydO1BPk0pwVs5GLZ5tyX45IpCxzqGR8gS4EIDOx/
 whR0APAp3DG3cWdsE1bgrH9KXast9K/3+eNaN1bjUsohqWiXpyvaIAihaSOzSIcM3eEKrdX+C91
 Opj9sElfJUAdDqNlrWcO9XkWCafFFqibr62NChSthIjYQD/f0Mfe/3gDWFFXZbv523j9iIrRgR9
 2TRKf3zCQkf/NLxuhUhZxIccqlkp4+nNi3jyy6QVzUEvMjWJLWNziVRtDXfRUSbwHCBIbeOxg67
 bbICLBbtQ4ZRBqyYEW7PdjFE6DBebN+HfymgTiPOM1hMUGptVPnIdcnvQvPKfoGka+D/ApO7OIi
 44JPelyDy44HH3MmgIKh6/tcBdJ3S8GszNwvjetSrYjJWhqjJI3EzsCJGiyTRiSC798qNbXJrkn
 s6EXVsYO3Tp3YqYeh4VymTAgLCz5NBwKL0bUkC2lWzRls/1WPYOi+nSK2ixTJqOAPSWf6+hl4hZ
 7GFe+wotLLL1J//NlpUUKxZ/k+HL8NcC/8sjaFPwZ90LHR0Z9M7ZEbelyjXem8VGPOl0Pg+AHvt
 W3We6MTPqZ4/O2w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 01 Jun 2026 13:29:40 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9550

Those are defined in BitBake documented, and would be better documented
there. Add a link to the BitBake manual for these variables.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index c65794229..fe3d5a999 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -6303,6 +6303,9 @@ system and gives an overview of their function and contents.
       The default value for :term:`MIRRORS` is defined in the
       ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
+      See the definition of this variable in the BitBake Manual for more
+      details: :term:`bitbake:MIRRORS`.
+
    :term:`MLPREFIX`
       Specifies a prefix has been added to :term:`PN` to create a
       special version of a recipe or package (i.e. a Multilib version). The
@@ -7757,6 +7760,9 @@ system and gives an overview of their function and contents.
       ``file://`` URLs to point to local directories or network shares as
       well.
 
+      See the definition of this variable in the BitBake Manual for more
+      details: :term:`bitbake:PREMIRRORS`.
+
    :term:`PRIORITY`
       Indicates the importance of a package.
 

---
base-commit: d7376cca64a0784e59d4fd60b9baefb4da2ce289
change-id: 20260601-link-mirrors-def-bitbake-7d3ab63bda92


