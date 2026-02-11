Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45C2CE9E30A
	for <webhook@archiver.kernel.org>; Wed, 11 Feb 2026 13:54:07 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19263.1770818046005563110
 for <docs@lists.yoctoproject.org>;
 Wed, 11 Feb 2026 05:54:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=seXKhHRp;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A08531A0DFF
	for <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 13:54:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 75D9C606B1;
	Wed, 11 Feb 2026 13:54:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 60F1C11948DFE;
	Wed, 11 Feb 2026 14:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1770818043; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=UIIpkKfRbq9cZx6BszWvhgr4AdUwV+fPvdSc7HzotZo=;
	b=seXKhHRpuv3qLJuIcn9ipIqrS8O1IgQx/Cg60alvELzevnYYPhoZFE/VgVm/tuhHdbE7Ay
	nYG8D7T0MQMZtGHIlaVvRCOmE/jledQnOUXULA42ZJnA578kvO3BTrGJOhUH3DS3Qeln5E
	1zmmGPsTYEq73pWCzh1gHvylYnTYLHSJm3tigDsnEzGdyb2J6tKnVrjAchf5qI1XU0wUxY
	b7jGZ3X87o/ScqcJQNUYXEU2hgq9gq2TCndXRn8M1TVbaqddtJCql0OVuASQom09VTMKxx
	OsNgD/tV2VFZHW7ajUJsmTLi2mZtYW+xwTJwDBvMzY6zgf/HH6CNkvC7SfH6pQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 11 Feb 2026 14:53:56 +0100
Subject: [PATCH] migration-guides/migration-5.3.rst: add note on *FLAGS
 behavior change
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260211-note-on-flags-var-v1-1-81bdce729333@bootlin.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqDMBBA0avIrB1IIhTiVYqLmEzsSEkkoyKId
 ze2y7f4/wShwiTQNycU2lk4pwrdNuA/Lk2EHKrBKPNSRmtMeSXMCePXTYK7KxhoDJ23zhqroXZ
 LocjH7/ke/pZtnMmvzwiu6wb0yVEQdQAAAA==
X-Change-ID: 20260211-note-on-flags-var-debd3c9a9291
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Richard Purdie <richard.purdie@linuxfoundation.org>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2632;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=ZGGLiz7tw8wvCW/wIYfao/TkK1333J35CgBkKnBJSaU=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpjIn5z7KJ9B6SSVd0LDBTJRr6Ol9i//i8fn4iw
 Q1MKpAdzcWJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaYyJ+QAKCRDRgEFAKaOo
 Nie9EACJFRo3oSdp1roJKU0y69S5ESNOXCE9ZIHA8qltz3r5oM9ofBqSTB7P8CgxQwIT0lnJOQX
 +/qcrD6qb/s3Dy/rVdqNehb04/s8MBaU54IBic/7VgrhGoBwttqIlAQpVSPnyjvmOUdAAinqom8
 Mm+KA3PsjoSDfIue5LPwfwv1/4J740p7tdH5K0TndeiuVF160w+ke9PzxUfw98xzJfk2B/AjDe/
 CifARyArSxq/47PcwkjyvzmRSATYMiTB78ym4xVukpH+b2Td4D7zLnpiZcIqN7+9sNXALr1UzV0
 11My1pfZG/jps/b0jIvZSjGE9+u25vRhntp2kO7SNVqqAeSWsgLbU/zzrTz05OGELlDoC54XHRT
 62CwjYYUC8T/VKajYsBG9hb9DpWWy8SIVezOw/TMksyq7N34ZTY/OD8I8Ewbhv6YyJr4bxZZzt3
 IWAYQXnHIm9R5OOv3PoMBh3u7abwKIeCRhgD434WVEoO19PKi9ryKwzNDeLZnywd+34B2+Q7Cq1
 BBal49fhqIbLSFDoE35xasqSRvQ8M0G95CiETbH0mZEkSuWi9fNMJK3/cdier60ve8o6xxO6K9z
 Fer7ckDxPzoT0UdTSJoiPBUiPQqEExhw9TEPDPXL8eCjIsRNBn1M7vHeCSyW98KmXBCDMxC2i7k
 GOXm0xKG9ABXVXw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 11 Feb 2026 13:54:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8880

Add a note on how existing *FLAGS += assignments can lead to unexpected
behavior in the 5.3 release notes.

Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/migration-guides/migration-5.3.rst | 42 ++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
index a1586fba6..464006aaa 100644
--- a/documentation/migration-guides/migration-5.3.rst
+++ b/documentation/migration-guides/migration-5.3.rst
@@ -172,6 +172,48 @@ overridden if unlicensed firmware is needed. See :oe_git:`the recipe
 </openembedded-core/tree/meta/recipes-kernel/linux-firmware>` for a complete
 overview of the removed firmware.
 
+``*FLAGS`` variables behavior change for :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk` classes
+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+The :term:`CPPFLAGS`, :term:`CFLAGS`, :term:`CXXFLAGS` and :term:`LDFLAGS`
+variables used to have hard assignments in the :ref:`ref-classes-native` and
+:ref:`ref-classes-nativesdk` classes, respectively::
+
+   CPPFLAGS = "${BUILD_CPPFLAGS}"
+   CFLAGS = "${BUILD_CFLAGS}"
+   CXXFLAGS = "${BUILD_CXXFLAGS}"
+   LDFLAGS = "${BUILD_LDFLAGS}"
+
+and::
+
+   CPPFLAGS = "${BUILDSDK_CPPFLAGS}"
+   CFLAGS = "${BUILDSDK_CFLAGS}"
+   CXXFLAGS = "${BUILDSDK_CXXFLAGS}"
+   LDFLAGS = "${BUILDSDK_LDFLAGS}"
+
+This caused races when recipes tried to append to any of these variables using
+the ``+=`` operator, so recipes could use ``:append`` instead if they wanted the
+change to apply to the target, :ref:`ref-classes-native` and
+:ref:`ref-classes-nativesdk` contexts.
+
+Recipes can now safely use the ``+=`` operator to achieve this.
+
+What this change also means is that previous assignments using the ``+=``
+operator, which only used to apply to the target context, **now apply to all
+three**: target, :ref:`ref-classes-native` and :ref:`ref-classes-nativesdk`
+contexts.
+
+Recipes that unknowingly relied on this behavior should change these assignments
+to use ``TARGET_`` variables instead, for example::
+
+   CFLAGS += "something"
+
+to::
+
+   TARGET_CFLAGS += "something"
+
+See :oe_git:`/openembedded-core/commit/?id=a157b2f9d93428ca21265cc860a3b58b3698b3aa`.
+
 Supported kernel versions
 ~~~~~~~~~~~~~~~~~~~~~~~~~
 

---
base-commit: 3ec23e9fb7ddc294bac6f68300591239c9cedf4b
change-id: 20260211-note-on-flags-var-debd3c9a9291


