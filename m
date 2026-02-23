Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1B96EA4FA1
	for <webhook@archiver.kernel.org>; Mon, 23 Feb 2026 10:58:14 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.32827.1771844285546384697
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Feb 2026 02:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=kHcOuk9d;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0542C4E41033
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:04 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D009B5FD43
	for <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EFE6610368F7F;
	Mon, 23 Feb 2026 11:58:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771844283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uDowRJL0ICLFtEi9iKgYHDNvpANvJxQQFt8v6HIw78Y=;
	b=kHcOuk9dvWDZVUMXqVHqMp0mXAVG79DNw3THxE/ATdLK8Vh6qthG9/VOgeX0GkyBi/dwh6
	t+0brvootBzVtfGJPeIc9iYNjpdzimc62rT8Ho4XPWV1VKLFasu5GlYLZT32H39PO0hlKH
	Grx9OM6XCnAkxoKASRlrGvAoLbWPS37lsi+zo5M4E1ybyuGI2cGTnR+h5GUcEhxTekFDI4
	ZVE6Cc23i/5GaPtNyGgkDSbpSKBAxZ+W4trlbVtbkP4tcf2Oi79Xb/JEtrBLOh4croTLeL
	HQ5jkeWNth+2GZwKlgLZu3R3rWVoyb6rvAs5c87Rc0XwoJCL0fbvJjDhcWhKow==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 23 Feb 2026 11:57:54 +0100
Subject: [PATCH v2 4/4] _templates/footer.html: show a dynamically created
 id of the docs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-fix-switchers-js-v2-4-296523996600@bootlin.com>
References: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
In-Reply-To: <20260223-fix-switchers-js-v2-0-296523996600@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3308;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=qqExNSeCbHgrTUrt6j/IRP8+ZqePaaJwY67SfrZrk3s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpnDK3X51wPXIpxWveIFCYBc1szLzGaEZB9Wqbk
 c5Gnfhrv86JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaZwytwAKCRDRgEFAKaOo
 Nja6D/929qQqGxQj4FjMIfePMBpZqt8fpfM3FXRqhkIG1FoS2n2ZYeMfRBusROYYdmM8KLQqwHG
 P/ajT1Jow7lT7ymQ3wYpmylgRv4nZcGXMqZn2r4Mj1VFmLIJJ8zHpbTPIsO/9lv4dEdCqx4Uw+M
 noVrPHuAKFYskqGzzHHbonSfV4dtWx4U9XShl3gRtUNSzHdBIey/4PNX6t870njx2+Pss5cRmtx
 uRxMgUSGZECyEaoRQ0H+gwo7fySIemhhP1qwHbwFzrDLSsE2dQ/w6bQAo5C+VEvPbdP1LMUFDtk
 LFYA9WqB9cl8U7We5ZSxIrOL/AXNgbDCYriyrmu3aLpgzCIr0QNB4qNwZiaLKZLNkyN5IpruW76
 bq3pkVrUAkORDfcXWzEJuNR+RpbPnelIMNfMG1rTWSRFTIUPe4ZEBZxDHQ8XKO/HWiPZ/D5XXm/
 R8H+Us7KAU3qgkB5YCf4K3Ut953F0V00cAXId5h/sdUXnngZONkAvlGJQ1zvHhyg8YxIcaSSXLz
 RQ+jqKC4ZUZ+F3Ks0ep2XpzAi2VyM5lx+deA58xmzqtd8ZmASZSPtpGiH++jaexDoY25QxIYio8
 eKU2FvmqEjMoYSj9JGgnICnIm8GHiIKcZYg5x97fNHK/le9hDNZVe5VL3GD994n9QDWIo69ShPb
 tZf+QIP714BCKxQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Feb 2026 10:58:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8955

Since we have switched to branch tips for all versions of the active
releases, having the information of which commit id of yocto-docs was
built is useful. Show it in the footer as a link to
git.yoctoproject.org/yocto-docs.

When a tag is built, create a link to the tag instead.

When building on a floating commit, this will create an invalid link,
but this never happens when publishing the documentation, only for local
development.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/_templates/footer.html        |  2 +-
 documentation/sphinx-static/switchers.js.in | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/documentation/_templates/footer.html b/documentation/_templates/footer.html
index fb3c58d845..0e10dcc8df 100644
--- a/documentation/_templates/footer.html
+++ b/documentation/_templates/footer.html
@@ -5,7 +5,7 @@
         <br> All Rights Reserved. Linux Foundation&reg; and Yocto Project&reg; are registered trademarks of the Linux Foundation.
         <br>Linux&reg; is a registered trademark of Linus Torvalds.
         <br>&copy; Copyright {{ copyright }}
-        <br>Last updated on {{ last_updated }} from the <a href="https://git.yoctoproject.org/yocto-docs/">yocto-docs</a> git repository.
+        <br>Last updated on {{ last_updated }} from the <a href="https://git.yoctoproject.org/yocto-docs/">yocto-docs</a> git repository<span class="docs_meta_info_placeholder">{{ docs_meta_info }}</span>.
     </p>
   </div>
 </footer>
diff --git a/documentation/sphinx-static/switchers.js.in b/documentation/sphinx-static/switchers.js.in
index 0edb0240ce..b08cc12bcc 100644
--- a/documentation/sphinx-static/switchers.js.in
+++ b/documentation/sphinx-static/switchers.js.in
@@ -107,6 +107,21 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     buf.push("</select>");
     return buf.join("");
   }
+
+  function get_docs_meta_info(current_version) {
+    if (current_version in switcher_versions) {
+      // Display the commit id of the documentation, as we're browsing a branch tip
+      var meta_info = ' (commit <a href="https://git.yoctoproject.org/yocto-docs/log?id=';
+      meta_info = meta_info + switcher_versions[current_version]['hash'];
+      meta_info = meta_info + '"> ' + switcher_versions[current_version]['hash'];
+    } else {
+      // Display the tag
+      var meta_info = ' (tag <a href="https://git.yoctoproject.org/yocto-docs/log?id=yocto-';
+      meta_info = meta_info + current_version;
+      meta_info = meta_info + '"> ' + current_version;
+    }
+    meta_info = meta_info + '</a>)';
+    return meta_info;
   }
 
   function build_doctype_select(current_doctype) {
@@ -265,6 +280,9 @@ by https://git.yoctoproject.org/yocto-autobuilder-helper/tree/scripts/run-docs-b
     $('.version_switcher_placeholder').html(version_select);
     $('.version_switcher_placeholder select').bind('change', on_version_switch);
 
+    var docs_meta_info = get_docs_meta_info(current_version);
+    $('.docs_meta_info_placeholder').html(docs_meta_info);
+
     var doctype_select = build_doctype_select(current_doctype);
 
     $('.doctype_switcher_placeholder').html(doctype_select);

-- 
2.52.0


