Return-Path: <arkadiusz@drabczyk.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DC1C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:21:46 +0000 (UTC)
Received: from gateway22.websitewelcome.com (gateway22.websitewelcome.com
 [192.185.46.142])
 by mx.groups.io with SMTP id smtpd.web12.106.1651681302739752163
 for <docs@lists.yoctoproject.org>;
 Wed, 04 May 2022 09:21:43 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: drabczyk.org, ip: 192.185.46.142, mailfrom: arkadiusz@drabczyk.org)
Received: from cm13.websitewelcome.com (cm13.websitewelcome.com [100.42.49.6])
	by gateway22.websitewelcome.com (Postfix) with ESMTP id 31D1DC00B1
	for <docs@lists.yoctoproject.org>; Wed,  4 May 2022 11:21:42 -0500 (CDT)
Received: from gator3278.hostgator.com ([198.57.247.242])
	by cmsmtp with SMTP
	id mHkznREIweI1imHl0n0cmp; Wed, 04 May 2022 11:21:42 -0500
X-Authority-Reason: nr=8
Received: from 89-65-233-120.dynamic.chello.pl ([89.65.233.120]:52632
 helo=comp.lan)
	by gator3278.hostgator.com with esmtpa (Exim 4.94.2)
	(envelope-from <arkadiusz@drabczyk.org>)
	id 1nmHkz-003x16-B4
	for docs@lists.yoctoproject.org; Wed, 04 May 2022 11:21:41 -0500
From: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] overview-manual: fix a forgotten link
Date: Wed,  4 May 2022 18:20:24 +0200
Message-Id: <20220504162024.24114-1-arkadiusz@drabczyk.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator3278.hostgator.com
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - drabczyk.org
X-BWhitelist: no
X-Source-IP: 89.65.233.120
X-Source-L: No
X-Exim-ID: 1nmHkz-003x16-B4
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 89-65-233-120.dynamic.chello.pl (comp.lan)
 [89.65.233.120]:52632
X-Source-Auth: arkadiusz@drabczyk.org
X-Email-Count: 4
X-Source-Cap: cmt1bXZicmg7cmt1bXZicmg7Z2F0b3IzMjc4Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 May 2022 16:21:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2915

Signed-off-by: Arkadiusz Drabczyk <arkadiusz@drabczyk.org>
---
 documentation/overview-manual/yp-intro.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/overview-manual/yp-intro.rst b/documentation/o=
verview-manual/yp-intro.rst
index e574dfa5b8..f240ce0f4b 100644
--- a/documentation/overview-manual/yp-intro.rst
+++ b/documentation/overview-manual/yp-intro.rst
@@ -688,8 +688,8 @@ Sato.
=20
 One of the most powerful properties of Poky is that every aspect of a
 build is controlled by the metadata. You can use metadata to augment
-these base image types by adding metadata
-`layers <overview-manual/yp-intro:the yocto project layer model>` that e=
xtend
+these base image types by adding metadata :ref:`layers
+<overview-manual/yp-intro:the yocto project layer model>` that extend
 functionality.
 These layers can provide, for example, an additional software stack for
 an image type, add a board support package (BSP) for additional
--=20
2.28.0


