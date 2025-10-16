Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837DECCD1A1
	for <webhook@archiver.kernel.org>; Thu, 16 Oct 2025 08:55:01 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.web10.3552.1760604894217474440
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Oct 2025 01:54:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=Zfy2FCyA;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E99C71A1415
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C18F56062C
	for <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:54:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C78BA102F22F8;
	Thu, 16 Oct 2025 10:54:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760604892; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cNppFfdFXSEpdZ1lZZkVMsctJmmAbwUltuYWT700Czw=;
	b=Zfy2FCyAXpp0vDzXSCp6+moyVJH6NVRV5l+UGr4JgB3fk+WgjB4bpgJA+WLgjMZxORCAGd
	IaU90eetrxgzpBxZerbGIyg00bdrFQFPjgMOkccr8v2upnTdYMEHO1J9jQnboUvm0bdlPK
	lY2OH+sPeLRIKNHGf/FUHmDwrk97rQpNub5HkYYgYEnUuuE5az268PtMZfBqQ3/h8dOoPJ
	T4BK75wad2E4yqyiobHu1VpN+hELUGAhA/q9MkNL5vYKChEvcC9yxgSdIp/G081ICbE1cK
	lFgfdrbQW9irz/ouBhz5IrAKHAZmL6zd8au1Qf7atj8Mjep2uukJ7dWY715wVg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 16 Oct 2025 10:54:05 +0200
Subject: [PATCH 15/17] ref-manual/classes.rst: document the
 relative_symlinks class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251016-release-note-5-3-second-hunk-v1-15-20f21db1f93c@bootlin.com>
References: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
In-Reply-To: <20251016-release-note-5-3-second-hunk-v1-0-20f21db1f93c@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1467;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=1dUix0XHZTmtEGFY+30ppMsn7jHjtoogcS+Lj3ZhTwg=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo8LLRgdVdfCjgw0fWaIQ0W/FrgOXsCIuH2xJVO
 +MHn4E0NsyJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPCy0QAKCRDRgEFAKaOo
 Nm10EACavLv0BF++Is8ZkquiIWpN61tjKTmussMfD8Ho1TzpTodv5liboPxHgARck5befJ5e0Mw
 tQ94P2Rae82vdgz1jjCRj9iO3CmahoysfOvdg42S9xNuvWXVW13YoRIqwJlKEdaIf4VPFL+H5fK
 H3LYR3ev+NCm2KpmGawf/SZXG9c1vJiOgPDe5K7tAFV7xuIn/fX8x4fGt7jicR92gZuN2Jf33ma
 Dl2evagrT5eMxTIfkb+8/EQnQizPst5WPDIvghCeCwlgHKEzigSmS0HZ8j8zF3v9RF86qjZZQHc
 fmW01fwGNFIL96T6PrAPZAY8KK6upm7DhzKq56rHp65unXhMtfxdc39fSxJDKuH1GBaNfdGGw/6
 hwc591XX2J9M//eXhdw0LGda0Bw9yJ30f+Kk1ARyzmhTDIGN1ivPuhst4mZzGWiBSz5hY0Sc3XV
 OdII7Xr4oBYneF7irJEf+MtKTX5pmFhop0YFgtzCcxtpgNFRBDKf18tmxYvicViQE0bBUevTeB6
 89lz5iKbcFh0Sl4kry92RxJ3B4PyTXQZSVjo3O42qbC5iem/fkHs7+yWr9cDwnFqj5m/RLiTTLJ
 5x58oBkYE5b02Jn35l8OXYVOkLqxsZFHo2ubT87XgRPHRs/tp3WntXzkYOsKIvAYKv+dGGUseUP
 wyQelhdsIuZEbJQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 16 Oct 2025 08:55:01 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7725

Added by commit e478550c8cd8 ("openssl/fontconfig/bzip2: Use relative
symlinks instead of absolute ones (using a new class)") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index 9fbdb22e1..4d74563e1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2494,6 +2494,25 @@ The :ref:`ref-classes-recipe_sanity` class checks for the presence of any host s
 recipe prerequisites that might affect the build (e.g. variables that
 are set or software that is present).
 
+.. _ref-classes-relative_symlinks:
+
+``relative_symlinks``
+=====================
+
+The :ref:`ref-classes-relative_symlinks` class walks the symbolic links in the
+:term:`D` directory and replaces links pointing to absolute paths to relative
+paths. This is occasionally used in some recipes that create wrong symbolic
+links when their :ref:`ref-classes-native` version is built, and/or would cause
+breakage in in the :ref:`overview-manual/concepts:shared state cache`.
+
+For example, if the following symbolic link is found in :term:`D`::
+
+   /usr/bin/foo -> /sbin/bar
+
+It is replaced by::
+
+   /usr/bin/foo -> ../../sbin/bar
+
 .. _ref-classes-relocatable:
 
 ``relocatable``

-- 
2.51.0


