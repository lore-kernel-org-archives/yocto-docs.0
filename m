Return-Path: <mw.choi@telica.co.kr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4515ECD37B5
	for <webhook@archiver.kernel.org>; Mon, 11 May 2026 09:35:08 +0000 (UTC)
Received: from smtp92-17.hiworks.co.kr (smtp92-17.hiworks.co.kr [139.150.92.17])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46215.1778492097955551087
 for <docs@lists.yoctoproject.org>;
 Mon, 11 May 2026 02:34:59 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: telica.co.kr, ip: 139.150.92.17, mailfrom: mw.choi@telica.co.kr)
Received: from hi-smtp-node4 (unknown [172.18.0.4])
	by smtp92-17.hiworks.co.kr (Postfix) with ESMTPS id 4gDZM35zytzrfQ5L
	for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 18:34:55 +0900 (KST)
Received: from hi-smtp-node1 (unknown [192.168.71.167])
	by hi-smtp-node4 (Postfix) with ESMTP id 4gDZM35bFxzQL3Dx
	for <docs@lists.yoctoproject.org>; Mon, 11 May 2026 18:34:55 +0900 (KST)
Received: from hi-total-node3 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node1 with ESMTP id i2ri2l6c6usjybqw;
 	Mon, 11 May 2026 18:34:55 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <mw.choi@telica.co.kr|1.225.216.91|mw.choi@telica.co.kr|260511183455_5762559806>
X-Hiworks-Remote-IP: 1.225.216.91
X-Hiworks-User: (SASL_USER) mw.choi@telica.co.kr
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from DESKTOP-LNIUHED.localdomain (unknown [1.225.216.91])
	(Authenticated sender: mw.choi@telica.co.kr)
	by hi-total-node3 (Postfix) with ESMTPSA id 4gDZM30DPfzSqYdq;
	Mon, 11 May 2026 18:34:54 +0900 (KST)
From: Minwoo Choi <mw.choi@telica.co.kr>
To: docs@lists.yoctoproject.org
Cc: Minwoo Choi <mw.choi@telica.co.kr>
Subject: [PATCH] ref-manual/variables: document the 'dynamic layer' concept
Date: Mon, 11 May 2026 18:34:46 +0900
Message-ID: <20260511093446.2350-1-mw.choi@telica.co.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 May 2026 09:35:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9437

Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
---
 documentation/ref-manual/variables.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index a8cbb87cf..755929947 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -841,8 +841,9 @@ system and gives an overview of their function and co=
ntents.
       previous link.
=20
    :term:`BBFILES_DYNAMIC`
-      Activates content when identified layers are present. You identify
-      the layers by the collections that the layers define.
+      Activates content when identified layers are present. This mechani=
sm
+      is commonly referred to as "dynamic layers". You identify the laye=
rs
+      by the collections that the layers define.
=20
       Use the :term:`BBFILES_DYNAMIC` variable to avoid ``.bbappend`` fi=
les
       whose corresponding ``.bb`` file is in a layer that attempts to
--=20
2.43.0


