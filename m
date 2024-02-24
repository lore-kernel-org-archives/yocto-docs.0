Return-Path: <simone.p.weiss@posteo.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C85C5478C
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 17:22:44 +0000 (UTC)
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
 by mx.groups.io with SMTP id smtpd.web11.23481.1708795360493805389
 for <docs@lists.yoctoproject.org>;
 Sat, 24 Feb 2024 09:22:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@posteo.com header.s=2017 header.b=o9cHgLL1;
 spf=pass (domain: posteo.com, ip: 185.67.36.66, mailfrom: simone.p.weiss@posteo.com)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout02.posteo.de (Postfix) with ESMTPS id 4C25A240104
	for <docs@lists.yoctoproject.org>; Sat, 24 Feb 2024 18:22:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.com; s=2017;
	t=1708795358; bh=3GGakZtFpTuA3Bdiq0KfKUdiY1PTzAXg49ESbE2CxjI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:From;
	b=o9cHgLL1VK3P0h/Rnjfv/yCy0iC4x+T4UzF3eDty3P1WgqJ1LknNtu18qh80e+NbL
	 iB3yEYAsH22OwbeWN96G3NvPImzekh4xp8GqjNGHDzbdFzzOT2BLKpNs+UnE6wKJ7a
	 MyMrtPisl8Mgy20x9mOof6bCYiYJx9s/u8WdhN2oDBpvS4bIEesTlPgZRNv4/2AAEA
	 dbBe0z5QaOjSYYC6bGG0z/9s2TBu0BpEGiwqdyfZsRsL/Xp76XgIxDS4a6lK6E/d0a
	 AYcfMIiCh2TiM/PCHtP+EpTZNH/TIOsV6Erm8CjtmmRYT7jx91bz7RqoT7B21Z97pv
	 91b5npELwvVBA==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4Thtx94M02z6tvd;
	Sat, 24 Feb 2024 18:22:37 +0100 (CET)
From: simone.p.weiss@posteo.com
To: docs@lists.yoctoproject.org
Cc: =?UTF-8?q?Simone=20Wei=C3=9F?= <simone.p.weiss@posteo.com>
Subject: [PATCH] ref-manual: classes: Add cve status check for oe.qa
Date: Sat, 24 Feb 2024 17:22:14 +0000
Message-Id: <20240224172214.557369-1-simone.p.weiss@posteo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 Feb 2024 17:22:44 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4871

From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>

With a new check was added for oe.qa for CVE_STATUS via commit
3c5b7605acd9cd68b ("cve-check: Log if CVE_STATUS set but not
reported for component")
in poky. Add related documentation here.

Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
---
 documentation/ref-manual/classes.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-man=
ual/classes.rst
index 844433c55..4f1188ef2 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1297,6 +1297,11 @@ Here are the tests you can list with the :term:`WA=
RN_QA` and
    paths to locations on the build host were used. Using such paths
    might result in host contamination of the build output.
=20
+-  ``cve_status_not_in_db:`` Checks for each component if CVEs that are =
ignored
+   via :term:`CVE_STATUS`, that those are (still) reported for this comp=
onent
+   in the NIST database. If not, a warning is printed. This check is dis=
abled
+   by default.
+
 -  ``debug-deps:`` Checks that all packages except ``-dbg`` packages
    do not depend on ``-dbg`` packages, which would cause a packaging
    bug.
--=20
2.39.2


