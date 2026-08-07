Return-Path: <u.oelmann@pengutronix.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B375C2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 05:05:30 +0000 (UTC)
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.36457.1786079123508618989
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Aug 2026 22:05:24 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: pengutronix.de, ip: 185.203.200.13, mailfrom: uol@pengutronix.de)
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id BF1222005A5;
	Fri, 07 Aug 2026 07:05:19 +0200 (CEST)
Received: from dude03.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::39])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <uol@pengutronix.de>)
	id 1wsClj-000CVg-24;
	Fri, 07 Aug 2026 07:05:19 +0200
Received: from uol by dude03.red.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <uol@pengutronix.de>)
	id 1wsClj-0000000ESW7-2HDS;
	Fri, 07 Aug 2026 07:05:19 +0200
From: =?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
To: Yocto Project Documentation <docs@lists.yoctoproject.org>
Cc: yocto@pengutronix.de,
	=?UTF-8?q?Ulrich=20=C3=96lmann?= <u.oelmann@pengutronix.de>
Subject: [PATCH] dev-manual/creating-fragments.rst: fix typos
Date: Fri,  7 Aug 2026 07:05:16 +0200
Message-ID: <20260807050517.3446202-1-u.oelmann@pengutronix.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Aug 2026 05:05:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10243

Signed-off-by: Ulrich =C3=96lmann <u.oelmann@pengutronix.de>
---
 documentation/dev-manual/creating-fragments.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/creating-fragments.rst b/documentat=
ion/dev-manual/creating-fragments.rst
index 7f437d7c94a9..8dabd599f13f 100644
--- a/documentation/dev-manual/creating-fragments.rst
+++ b/documentation/dev-manual/creating-fragments.rst
@@ -13,9 +13,9 @@ This section will describe how to create new fragments =
for your builds.
=20
 There are two kinds of configuration fragments:
=20
--  Standard :term:`Configuration Fragments <Configuration Fragment>` whi=
ch a
+-  Standard :term:`Configuration Fragments <Configuration Fragment>` whi=
ch are
    stored in a file. These fragments include a summary and a description=
,
-   following by configuration statements.
+   followed by configuration statements.
=20
 -  :term:`Built-in Fragments <Built-in Fragment>` which can be used to a=
ssign a
    value to a single variable and do not require a separate definition f=
ile.
--=20
2.47.3


