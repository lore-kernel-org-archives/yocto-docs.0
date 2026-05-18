Return-Path: <mw.choi@telica.co.kr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5ECDCD4F4A
	for <webhook@archiver.kernel.org>; Mon, 18 May 2026 21:38:26 +0000 (UTC)
Received: from smtp4.hiworks.co.kr (smtp4.hiworks.co.kr [121.254.168.203])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.8320.1779140300059207441
 for <docs@lists.yoctoproject.org>;
 Mon, 18 May 2026 14:38:21 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: telica.co.kr, ip: 121.254.168.203, mailfrom: mw.choi@telica.co.kr)
Received: from hi-smtp-node2 (unknown [172.18.0.4])
	by smtp4.hiworks.co.kr (Postfix) with ESMTPS id 4gKB4S6SszzKRn5p
	for <docs@lists.yoctoproject.org>; Tue, 19 May 2026 06:38:16 +0900 (KST)
Received: from hi-smtp-node2 (unknown [192.168.71.87])
	by hi-smtp-node2 (Postfix) with ESMTP id 4gKB4S61x3zQLLZR
	for <docs@lists.yoctoproject.org>; Tue, 19 May 2026 06:38:16 +0900 (KST)
Received: from hi-total-node3 (amphora-3294b420-308a-4b9e-8a1d-bf25580dae1f.openstack.gabia.io)
 	by hi-smtp-node2 with ESMTP id d6ss6m7si3tur7yj;
 	Tue, 19 May 2026 06:38:16 +0900 (KST)
X-Authinfo: HIWORKS SMTP authenticated <mw.choi@telica.co.kr|1.225.216.91|mw.choi@telica.co.kr|260519063816_6382828411>
X-Hiworks-Remote-IP: 1.225.216.91
X-Hiworks-User: (SASL_USER) mw.choi@telica.co.kr
X-MailFrom-INFO: <country_code:KR|rbl_level:0>
Received: from LAPTOP-2OEBABTQ.localdomain (unknown [1.225.216.91])
	(Authenticated sender: mw.choi@telica.co.kr)
	by hi-total-node3 (Postfix) with ESMTPSA id 4gKB4R6m9TzSqQl8;
	Tue, 19 May 2026 06:38:15 +0900 (KST)
From: Minwoo Choi <mw.choi@telica.co.kr>
To: docs@lists.yoctoproject.org
Cc: quentin.schulz@cherry.de,
	antonin.godard@bootlin.com,
	Minwoo Choi <mw.choi@telica.co.kr>
Subject: [PATCH v4] ref-manual/variables: document the 'dynamic layer' concept
Date: Tue, 19 May 2026 06:37:58 +0900
Message-ID: <20260518213758.2420-1-mw.choi@telica.co.kr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 18 May 2026 21:38:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9478

This patch documents the "dynamic layer" concept for BBFILES_DYNAMIC.
While not previously in the manual, this is an informal convention
widely used in major layers such as meta-intel, meta-ti, and meta-freesca=
le
to name directories containing conditional content.

[YOCTO #15713]

Signed-off-by: Minwoo Choi <mw.choi@telica.co.kr>
---
 documentation/ref-manual/variables.rst | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-m=
anual/variables.rst
index a8cbb87cf..00dc1b55f 100644
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
@@ -856,8 +857,8 @@ system and gives an overview of their function and co=
ntents.
       filename patterns::
=20
          BBFILES_DYNAMIC +=3D " \
-            clang-layer:${LAYERDIR}/bbappends/meta-clang/*/*/*.bbappend =
\
-            core:${LAYERDIR}/bbappends/openembedded-core/meta/*/*/*.bbap=
pend \
+            clang-layer:${LAYERDIR}/dynamic-layers/meta-clang/*/*/*.bbap=
pend \
+            core:${LAYERDIR}/dynamic-layers/openembedded-core/meta/*/*/*=
.bbappend \
             "
=20
       This next example shows an error message that occurs because inval=
id
@@ -866,8 +867,8 @@ system and gives an overview of their function and co=
ntents.
       .. code-block:: none
=20
          ERROR: BBFILES_DYNAMIC entries must be of the form <collection =
name>:<filename pattern>, not:
-             /work/my-layer/bbappends/meta-security-isafw/*/*/*.bbappend
-             /work/my-layer/bbappends/openembedded-core/meta/*/*/*.bbapp=
end
+             /work/my-layer/dynamic-layers/meta-security-isafw/*/*/*.bba=
ppend
+             /work/my-layer/dynamic-layers/openembedded-core/meta/*/*/*.=
bbappend
=20
    :term:`BBINCLUDED`
       See :term:`bitbake:BBINCLUDED` in the BitBake manual.
--=20
2.43.0


