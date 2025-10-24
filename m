Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E59F0CCF9EC
	for <webhook@archiver.kernel.org>; Fri, 24 Oct 2025 08:20:38 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.4942.1761294032797892552
 for <docs@lists.yoctoproject.org>;
 Fri, 24 Oct 2025 01:20:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=TkFEiwQB;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9459EC0C41E
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 70D0260703
	for <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A002D102F247C;
	Fri, 24 Oct 2025 10:20:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761294031; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=cuL/E6nGWXh5SWCK76GXuRzCad67GCPqh/ob/To4p6g=;
	b=TkFEiwQB20LfuMd+sa4tzUxxEr8C3apjUCNaWu82CkpgeBrBKngDkRkGMsXOnevReo7iS9
	3T8NWJiFjs02MBXmEj8yv0LekvXtbW4zRGWJwHzph4A7xkuE+trg0yhFe0waNzba4tU70e
	HmxTWGF/zPwyvIjBqKdOtFi6C5Coh3fTurDit560q2WnsGU4sNHEU/8Uaxcokxl5LVQIyz
	JDO9RvLlgtq+TtpoOCIJ/sh3RU7pur7nKEqvku1AGQAV/++sGJJJ7nwouuqXoz45Qk1bGy
	6sdp7Wh5nOT2BtrDp9KP2RygOzVsiErxpkbL6eltOOKVEA9qZaTJW1hWOQHzhA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 24 Oct 2025 10:19:52 +0200
Subject: [PATCH v2 03/16] ref-manual/classes.rst: document the python_pdm
 class
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-release-note-5-3-second-hunk-v2-3-d15dabc095d0@bootlin.com>
References: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
In-Reply-To: <20251024-release-note-5-3-second-hunk-v2-0-d15dabc095d0@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1011;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=iRaj2CUADULmbsTEkvUQlEEHXICIkRWc3pf0kPtuT+s=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo+zbI4S2JRA4YZ/awfxDmhQqRYAyl+9rDwPA6s
 kFv/wnMPa+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaPs2yAAKCRDRgEFAKaOo
 Nj/HEACocKkUFyusut8ApE6YKbkMKXGSJooFpa9YPoUJSYM4UVtA+yb9IySL+p48YWF6SAMATrP
 fwYpTarSlPNi3Q4FdIUG5KAbAO7AnnXdqr4UgCTcf5msN47SJSaQjqZegHwTfn2w75Omk86xxbX
 3PmcjViB4lEsnPq98ii/PmuPceSkWTBwy97piZSJslVHc9v3gYR8XzAwjHVnF5t8WTFmx9k1Aur
 kP8FMl8oR+lIwjVS/c/BzpfAsZ6t/o1yLcOg/D4s5fow588J4u6O+LhCefMJT2XBsoi/6z8gVrs
 EnoGF7/Z6hiJD9tmmYaoSZ2itGqJ9JwTctWv3yBF38IwH1jwk4+fge6y4m2awcSJ47Bi8GIpo6q
 x3KKRkpLw8MLsaJVno4zppLeWovpID/uGMUEvVXEH04XPSnc7nZ6/h0A+EW07qPeQJnor5NyOfN
 IJgETxZ1n/C0B7IgzFCICaFVVUv84AHhA+df1kdXMea53NWjHMy/fSnybmnBpYXWpVSOrsp8q8+
 kNgxc9SbHZ/plrnFx38GDIekkFJu8JplzjUFYQxVf3J2WPJKm5TaMN3eTfO5N5ffLsHVWaGtNUc
 DEKNqzJGIrcccgcmGsM1nV6mr/3gAttcCE8E+C2PYxPanLWvhaVsTSdhhRDJM8D3OtakMv4J/jM
 kC6RWyx/HnrLcOA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 24 Oct 2025 08:20:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7792

This class was added by commit 20758865e9e0 ("classes/python_pdm: add
PEP517 build class for PDM") in OE-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/classes.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index b92b9e28b..f93897be1 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -2174,6 +2174,16 @@ meson-python build system.
 
 Internally this uses the :ref:`ref-classes-python_pep517` class.
 
+.. _ref-classes-python_pdm:
+
+``python_pdm``
+=================
+
+The :ref:`ref-classes-python_pdm` class adds support for building Python
+packages with the `PDM <https://pdm-project.org/>`__ package and dependency manager.
+This class adds  ``python3-pdm-backend-native`` to the recipe's build-time
+dependencies.
+
 .. _ref-classes-python_pep517:
 
 ``python_pep517``

-- 
2.51.0


