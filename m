Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07910E77184
	for <webhook@archiver.kernel.org>; Tue, 17 Dec 2024 09:27:27 +0000 (UTC)
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
 by mx.groups.io with SMTP id smtpd.web11.77904.1734427637405518350
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Dec 2024 01:27:17 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=nsKJYHtb;
 spf=pass (domain: bootlin.com, ip: 217.70.183.197, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 049571C0013;
	Tue, 17 Dec 2024 09:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734427636;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxUe9no/x3PVfdjkedkgE40P4XfYALCniH9varbaiQs=;
	b=nsKJYHtbYo8gBIZPykI667/p/raZh0SBJXRdihIGVBoJsPPROzfezKikxph6fENmSE4gRe
	ZbR1hCsZxd08x0ZIJXxvhJ+23zFaobfSIHDBW7H3CzE0aVn+yBuSCYJa4fY2yZMNIrgBx+
	oM3YQ4dMqhIl+O0LJSp/gyPd4baumZ8dpIDankElhSZ+c1KisVMxtnIw80/gUH/WQCkpTz
	n1u46HQFui9hl+DVjlpmYRh6ppqMi5NTPJKCcYuUxDkcjCEOizBVf2VUz8E4QdCLIc65Yn
	dhuQZO1JxBMhpn43nAPwcOJapeVKyv7la2OROycGupiEUzjzjZP0PsjXlFNaJQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 17 Dec 2024 10:27:11 +0100
Subject: [yocto-docs PATCH 12/14] ref-manual/variables: document the
 CARGO_INSTALL_LIBRARIES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241217-release-note-5-2-updates-v1-12-b189493b1b09@bootlin.com>
References: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
In-Reply-To: <20241217-release-note-5-2-updates-v1-0-b189493b1b09@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1336;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=9VkleMfnWRQFiBGHlvoa69MPhsFXuKH4IJ0GlajIxG4=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnYUPw43W6mBfar0yzbYWNjVp6MlBZVYEPYJ1y+
 OslH54DNgOJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2FD8AAKCRDRgEFAKaOo
 NtI5EACTMC0rGVcc0A1YqqiPotwO8jfjovgRSHVHWNFl9/B33cnEDM0Rlq2ETW70mPmQnA9xe+C
 Y0+84FjMeI0ydoXZP3fozgFJs0JYvejJKXR4MtL/IYMS+zqRPB3e3S76GtjpG37x0zNT+b8hx1X
 z6hTdmtm5krXvfR9Bq1HTBh7kJHepWXZ8az6V5eX87GEf4/cFgRBW5zEMZrADOj8Fsgoz8e6F6t
 qCvrwFgldxhSt8Aow4c8fMkizz73UpxRcgs9BdEvjRPhxjIzVqxtV5WSHQFVCgZ2u0tyUaPGc1l
 s6g4SODl1e8Vp7qzenH4ECdoXk42lIuhJH0YJDMxSerHV1pZFvd4lsj4/+vys3conRjPtltFPrJ
 oGL8LvMy0usXpdugHCzSP+x/KKf4AemVYdDhu/SPsCytXPlcmBw7peOvvmqno+JU7ABPlVL7oNv
 rTvUtjGIdfFeFKlZ/9xgzMC6lXlkVG5HfowvI+cahQx51wR93u78Yf5AR1v+kCxTk49XCxUkPDu
 zFidWZnsEduCMZwGGnMA5pcdL1gU75ndqml/4V2Pt8xC5C5Knt7TxpZGe7syx5ZjKhUbzPUBa3/
 oB2mzr21XEj9PJFFPpkjGi5cDhwK4nAY49jrG/4tIK18KyMXCXzo00IIUAih7dGeRCDK0BUgKxf
 RSOHzTHJc6ChgjA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Dec 2024 09:27:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5944

This variable controls whether libraries compiled by recipes inheriting
cargo are installed or not.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 66ecece8b2658b304e17c9c4a1492e42a8a313d4..50cd8948b35f381414837acc9b9e925dc5110779 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1231,6 +1231,14 @@ system and gives an overview of their function and contents.
       :term:`Metadata` so it does not need to be parsed every time
       BitBake is started.
 
+   :term:`CARGO_INSTALL_LIBRARIES`
+      When inheriting the :ref:`ref-classes-cargo` class, the variable
+      :term:`CARGO_INSTALL_LIBRARIES` can be set to a non-empty value by
+      individual recipes to enable or disable installation of the libraries the
+      recipe has built in ``${B}/target`` (files ending with ``.so`` or
+      ``.rlib``). By default this variable is not defined and libraries are not
+      installed, to replicate the behavior of the ``cargo install`` command.
+
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 

-- 
2.47.1


