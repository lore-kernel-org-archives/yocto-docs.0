Return-Path: <mw.choi@telica.co.kr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BA76CD4851
	for <webhook@archiver.kernel.org>; Tue, 12 May 2026 10:38:37 +0000 (UTC)
Received: from smtp3.hiworks.co.kr (smtp3.hiworks.co.kr [121.254.168.205])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.72622.1778582315686870278
 for <docs@lists.yoctoproject.org>;
 Tue, 12 May 2026 03:38:36 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: telica.co.kr, ip: 121.254.168.205, mailfrom: mw.choi@telica.co.kr)
Received: from hi-smtp-node2 (unknown [172.18.0.4])
	by smtp3.hiworks.co.kr (Postfix) with ESMTPS id 4gFCk06M8czXc3wC
	for <docs@lists.yoctoproject.org>; Tue, 12 May 2026 19:38:32 +0900 (KST)
Received: from hi-smtp-node2 (unknown [192.168.71.87])
	by hi-smtp-node2 (Postfix) with ESMTP id 4gFCk05yL1zQLLZR
	for <docs@lists.yoctoproject.org>; Tue, 12 May 2026 19:38:32 +0900 (KST)
Received: from hi-total-node2 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node2 with ESMTP id 76sjc6vsgl2vosmc;
 	Tue, 12 May 2026 19:38:32 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <mw.choi@telica.co.kr|211.170.25.155|mw.choi@telica.co.kr|260512193832_6321080866>
X-Hiworks-Remote-IP: 211.170.25.155
X-Hiworks-User: (SASL_USER) mw.choi@telica.co.kr
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from DESKTOP-LNIUHED.localdomain (unknown [211.170.25.155])
	(Authenticated sender: mw.choi@telica.co.kr)
	by hi-total-node2 (Postfix) with ESMTPSA id 4gFCk00fH5zSqT5P;
	Tue, 12 May 2026 19:38:32 +0900 (KST)
From: Minwoo Choi <mw.choi@telica.co.kr>
To: docs@lists.yoctoproject.org
Cc: Minwoo Choi <mw.choi@telica.co.kr>
Subject: [PATCH v2] ref-manual/variables: document the 'dynamic layer' concept
Date: Tue, 12 May 2026 19:36:52 +0900
Message-ID: <20260512103652.2535-1-mw.choi@telica.co.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 12 May 2026 10:38:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9460

[YOCTO #15713]

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


