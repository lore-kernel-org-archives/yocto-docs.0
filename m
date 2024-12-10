Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5199BE77186
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6756.1733824830030601936
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=M0KSU3SF;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7C67940005;
	Tue, 10 Dec 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ktWoQXZAg2efFwa4Ugs48tgMc58aZet6CLl/ZXTD+Ac=;
	b=M0KSU3SFTqVm/Hgrpnlfm1dTTY0QetvJZTHpy7/TwVLxQXYJ1d1zOKDf/Op7Es1zVGgl3M
	BNk/wVuqfIpHTnPrQJYhCEJTlDOe9QnBobtiK7j+h28sjkckLEprvGsnLUMRKFczmLHiak
	WZiJ0uk+OLUI4ABBd3Xy64eRgfVk2VdE2oTiT8Gwposavz+Hn/mKv9HVXBGj7Dlxvhu7l+
	Ipi26c5f+WJw2sWMqtHgC3bKqO5dGqZXFzZCYvClnjD+45vOkzPAeZQRPPLwPhYHNGCDR3
	DhFSEHIcJU/xpQJm7qcoVVeuqK30Jqdwwf8/h+B/viIjPdSlVQtx1b4tarpr5Q==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 10 Dec 2024 11:00:22 +0100
Subject: [yocto-docs PATCH v3 4/6] system-requirements: add fedora 39 to
 supported distros
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-update-doc-deps-v3-4-534699936ddc@bootlin.com>
References: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
In-Reply-To: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=657;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=MDtuaG9AYL2ZfrHxBjT5fLCTwjRyUITaNWw2zUu+zpc=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE6Wnc4vIqSQKbCO7+nh/AMJ22o0UsbmS1Ei
 KWbn3pLzg2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 NgRgD/sHBd2GnI4Tty0+RX3oAG9xFLKWYOK+YvQUnF83vdSOpQ+I+87jyr565cIMhTqBsi93bpb
 HQOgrvZgT34VPjHklxG0e0gcjLRJa4fQlhZ55IcLVFn5bo7H66fUwkhOhuWI2Pjq+9dWHa2eTl+
 Sfsa5FQPyNRbIouJ/mnuSYzrBGjTRQZmcSn0sVsvHDKX7MSFMtIbWrpjhuzm74+fZ0tDcj6Ow40
 PTXQ2F/YMF5v7dXhgoxmiP7dlK1u+CPreMXee5dJLkareJU4geMCqG4is/wG+ra4DJ4TxK2A9V9
 oi0pAgcbTz6O3klZcdGe24qzoma8E7j6ykcRqitxIRu+sEHjIcIAi6YcVN/V9G/XkWDTEPFiT5N
 gEJN+SYES0hVyio8sX1AoR3MPopBJ6ZEa1tADRfxk6SinqHuBFMKLgCxTZrsDBoAfiNTd/kpbsf
 09kOL54whVF9vuyTn6iwtaPQR9JrBJIvt8mRFqPzTJIpCp89lwP83MnPFVWbtdCEkrJ67eFjWZf
 5oKbZx5pICfQACxrD7O+1rKawtocfXGaWWUDpxsQYqyAakltQtCKREVZ+ldKu00WP/TMvdsmTS5
 PLewnvE2g4KC8Di/JNCqP7DLF4vh56gv8e6n54ajIDMwiEYRg8kK8Iw4qffH8M8KGiqijVQGa/z
 8Sr61AdWmmUAIvQ==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5914

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/system-requirements.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/documentation/ref-manual/system-requirements.rst b/documentation/ref-manual/system-requirements.rst
index 0b40c3f5e5ae87d703d9a2d338de084ca9f93b2b..17ad1b741a0b92f218860d22bbc4b0927b73b865 100644
--- a/documentation/ref-manual/system-requirements.rst
+++ b/documentation/ref-manual/system-requirements.rst
@@ -64,6 +64,8 @@ supported on the following distributions:
 
 -  Fedora 38
 
+-  Fedora 39
+
 -  CentOS Stream 8
 
 -  Debian GNU/Linux 11 (Bullseye)

-- 
2.47.1


