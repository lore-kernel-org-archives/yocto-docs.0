Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE284CCD1BF
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:48 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.web10.4949.1761294039687723890
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=HXAhDRau;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 34A974E41268
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0BFFB60703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 59F9C102F2485;
	Fri, 24 Oct 2025 10:20:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294037; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=X029HXCPYd24mTFf4Ryqnn4zTKEMnkKg76/kHLd8HmY=;
	b=HXAhDRaus2IE/U/9Bg/Jp0/BltKkesMJOXhHEDPd4mi0VVC7lRcK0KW6OUWEKq/WXIn0lh
	bVRT+kWRC4EcHCtqBGqOtQKQuwUxyJ/Ivtb8wbzwoBLIiPrxmxvoKYibfV8FVxi8UeUpB+
	lJZSSGksPKusTJEBDrlqwdokKKUfg7Ry/5Y+Xvaef4XS8W35zUeRJhR41ZSRURAnQHyisU
	ntU1LRZ647hkJiI5E2IQQBn5a7az4eXzvufKvW3jrNT10+OCumnRVzg0L/8VjUwpkyTQX5
	dlo5TfBJ4sQd83ojBSNotHXFYUlTVq9BScFiL5cloTrYdO1dw+j+mKaWmQ0IcA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:20:01 +0200
Subject: [PATCH v2 12/16] ref-manual/classes.rst: document the
 rust-target-config class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-12-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1166;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=xX9KGuu8JsptrVC/pX+sjhn3rTkUbYesv7QGdJhWirE=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbKMQF1dQlxNTOPtohRNWxlRPBcUer6nmsgR
 ajLv8ZDZnCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2ygAKCRDRgEFAKaOo
 NjoMD/9WZqTykKldhh5sqSFo0IT5rJEEmTYlPVJC+Jx/F/00rddXKUET+ix7jFW+JqexKgL313s
 uBCZVfHVFdX3SKXjOfJXkxqMYqTs2Urbls/XQJ2K0rZah9qK7JZVmwEKz6Kd1gb/mfnBDOIFt3i
 FNplwHLo0z1nEqvhzFfcCF1BW8rYp+uvQMKPwk4Vv960G/78TyacyrgNoYjOdu/S2Jx4dw/MkNw
 L8AL0I6/YzyrLH/ITR4YtI8xHzkXaD8+Y8l+YvodzUhZt4osg4sTufDbnGTTb2ZApwz6dnZ+KQY
 IaXUKaPSYvsS20TB8fU4ceCVj21/TunIjEl2vlTPGOgeasHJxfwUXne89O+nUItxtFxfZCzIgel
 H5xKHjLYAaNLp5A3Y2BUyvwBCO0H4w/g58RXBPq5XpRfTWDlLmgECSgtwra6eAEG6WzbBJxFZtS
 f/6918lSb2CMkty3hHnEnsB+6aTux9wHt4c0P6UDV2hTd9FAHov+gs/Ls7H2tAePDCsXi/zYfEN
 YgUp0o5md+YNGr+4OLUeZdZy05O3WvnM3heD4ZhqibddW0R0LT2sYpjp1IieQuyNWz+jxDr3hyZ
 W7epjKCjCO2jbEzhuU/RfDo0zWkMJEqcuabGsAuoq+XVZ8EjGXW5CFi62QID/aIrTaezd7dNF9q
 YwwdElzUhGV1lIw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7801

Document the rust-target-config class.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index cd447d2c2..d29feb6c6 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2637,6 +2637,19 @@ The :ref:`ref-classes-rust-common` class is an internal class to the
 :ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
 intended to be used directly.
 
+.. _ref-classes-rust-target-config:
+
+``rust-target-config``
+======================
+
+The :ref:`ref-classes-rust-target-config` class is an internal class to the
+:ref:`ref-classes-cargo_common` and :ref:`ref-classes-rust` classes and is not
+intended to be used directly.
+
+It is used to generate a JSON specification file from the features listed in
+:term:`TUNE_FEATURES`, which is used for cross-compiling. The logic is done in a
+``do_rust_gen_targets`` task.
+
 .. _ref-classes-sanity:
 
 ``sanity``

-- 
2.51.0


