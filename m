Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B95CC88E59
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 14:56:37 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.41375.1789138586956580700
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 07:56:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=wYjPhfMz;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 1BF37C63A0C
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:57:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4BA19601DE
	for <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7BF2311C7AFA9;
	Fri, 11 Sep 2026 16:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789138584; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Ss8YodUREOqk3YnOjtbZpKxguBQljRXIXRneb3HCXI0=;
	b=wYjPhfMznN6w9B7nJLFIFxRXU2kS3EvMnEk2PePHIUsGRRZmEUaJmuRCguKGQA5gVif2/4
	09L7LqaGarvW2qDwaVKsPL/Xlr+zqgoimhnu2mVocH71W/tN0TIS0/WlbA/hLl2vxg3UHt
	m1OtfRC+lhXOrSbhvymXF+UOxP8fzIgW7mI5/7E1lf9AqTKyH3kwAoZ5UR5uk//0adPQLE
	lZ77QcmZ63/00144gGzZT9eRhDEv+uQ6YzmWgppaIHBcAJvh96boeXH+WVoYuAOYCQdMeq
	JRr2GmASWvZFDAhXQlmGeg6S9N+gjy8UJThY4IjJpllUX5pc33e7DICDsEb02Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 11 Sep 2026 16:56:01 +0200
Subject: [PATCH 01/10] security-manual/securing-images.rst: remove "your"
 in "your OE-Core"
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260911-assorted-fixes-v1-1-0d92a8112918@bootlin.com>
References: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
In-Reply-To: <20260911-assorted-fixes-v1-0-0d92a8112918@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=803;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=yz93e1B77A4FVIATlwhKTKGAGlvlCCplxgzXs6Fz+wA=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBqpBaVYwXX9RZM2+NpDDy30AdnycSExsyf1X70K
 C8FJQv+GtuJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaqQWlQAKCRDRgEFAKaOo
 NifcEAC2RbJkRCSH6h0E+q+Fj+ZrQ7Rx4ILo0bP8shVHpZamLZEGYo8P8z/p1nLItYI2N3O7C+x
 WEQxQaNPeOhaspiSiM/nN7ZCCWvn4OMl3oUcTLkSNj3uPG9IZP0cCzXxi8uKbVifiKIdevQozfR
 Wr/BXUvZYhZ/FRRtvWgl4d1RRX5G6NncylKtNzC8qOp9i1amM4pv/E0DQyyE6w5Ec5ME49I6Zi2
 CeNWDWo4zs7zYa3cxUf46v0twCDiOpnq6OD67r0zWVDTALR7OgjlSXw7uzIYpOxKKbZQHFpbhE0
 q9cAWglzYOR2GXyIjca573erMKw3dDw3BlE9lHChcj10QftESexSVB3M8aqXmeN+lUux+DUDoip
 eZvsCwDHSNukGFy6e2HAIT7KvkUmX0fpUeVyDneyQ+XQ13/cLujoA28IZa5jQnwYQ9QUi5KVaLJ
 GmzF0zN7HDISACQRHYO2lY6uQUpgG4HzuUdayjochG+oBGTlw3FO4QTbL7ZOqV6Wg72TDkb8QJM
 8FMI5fwpkk+4zLei7yBe0D/m4wVGBWXaIllIILlNysU+oKALYceG70X4SbTjLpEKooGen11V6pH
 bMvoLHOrEXXo5sOm2U2nJ6UyDvG5nZCGfQLMujylLN2XfERLfSbLfacnjuOq62b9ngA0J9b3u5W
 eY/+jfOtTEqwQJA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 14:56:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10455

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/security-manual/securing-images.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/security-manual/securing-images.rst b/documentation/security-manual/securing-images.rst
index 13ab63ddd..bcf4237bf 100644
--- a/documentation/security-manual/securing-images.rst
+++ b/documentation/security-manual/securing-images.rst
@@ -72,7 +72,7 @@ Security Flags
 
 The Yocto Project has security flags that you can enable that help make
 your build output more secure. The security flags are in the
-``meta/conf/distro/include/security_flags.inc`` file in your
+``meta/conf/distro/include/security_flags.inc`` file in
 :term:`OpenEmbedded-Core (OE-Core)`.
 
 .. note::

-- 
2.55.0


