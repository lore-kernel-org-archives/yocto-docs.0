Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1627AE7718D
	for <webhook@archiver.kernel.org>; Fri, 20 Dec 2024 12:17:12 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.150622.1734697028083079742
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Dec 2024 04:17:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=mRHZzPM9;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 923E240003;
	Fri, 20 Dec 2024 12:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734697026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DsqbivM2KEuCzEDpCamA4OJ09yZl5NXBw8TEftVVnHk=;
	b=mRHZzPM9niUIpjkjJW9bQTymRY+SnkV0mTrpaf7B0klUxbRjjtmIXoiiQzSjVBk39/VheM
	qE1fHiQiTAGx1Hq+merXa3EBLPRNq7lHzGA2xUf207cnvLkJJPBucSRh4BfElIeRDV6PdU
	sGd8AISZ8I2H5TabfPsdu6Z+a4j8c7Pe6LzhtxblDe0ZFmPuSX0yiRxNnAckNyrJQAweUO
	SpauTthqa8dDmO9RK1QZ2yS947WOs3ZgO9FC41UDG7y6onElB/+hn8X4VuNiOug6PbdXpK
	MP4Skqv8xM7QT7gZ70dh0rSeddNGwLdX/XgH7WxQJZIu8fAFh1PKREQtAeHgug==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 20 Dec 2024 13:16:39 +0100
Subject: [yocto-docs PATCH v2 12/14] ref-manual/variables: document the
 CARGO_INSTALL_LIBRARIES variable
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-release-note-5-2-updates-v2-12-df29527f3fc5@bootlin.com>
References: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
In-Reply-To: <20241220-release-note-5-2-updates-v2-0-df29527f3fc5@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1361;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=V9aruU5g3L6MlTBgN69Ef/XHPSJw71P2Z95+PPc+d7U=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnZWA/2oARI57cEABLbX0OopHypfMle6d0Fz3mk
 sOXk356ZSaJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ2VgPwAKCRDRgEFAKaOo
 NkpxD/9SvzTxOP2sALnLdXt6Do4e/KQNOknvt7mLz5KRYhSOXFgPBOG70Rmm9UdDugC6mTAa+5l
 Hv8f2hMiFBE3osJwJmmY1S3+p9Vp1eCFrZFqg/yy3Pbhx2J47NftqD9h+4A35njwu0BrwUj4Lic
 3Bz4/DBm/xf6Y5GAsz4G3crhPGd47zMUtxqkZ6iXQyIOnckGq1agQp5/AHomQoks22M6+ou4L1j
 N6/KnQE5FMOM/KKadT0b/Pj39wpH2OY1jrNSB26yaoK/GdXcNuwPWl2vq61NjyeBptyaeTCprox
 YO38B1ho7lqVdJ5ao01fenZmIz+aM83DrZNHWSrGm6+9nRrNbQsW3PvNehjIBaqXVvrHWAejyi7
 zXTegpmRNFOuMOkNioTNA8kWrYZreBTcHVbUxQL7ZJ2ymkPe+t/oX8MS+Hbq/zhRT0OtgNmYXFq
 K0Wp1DM6RfR8/nSNgZzVjYbbHltCzul9YLsyYv2z7u+pA7L8jvke02txSABb4b7iYBfWwAD+PGq
 6odE/RiyjtLGYpMOLbu4ddZB8jgNjC5QUXyxMPeyHwcR7pJ0GL4GhhOv/1Lgmq8UbCIjSQZ/vCl
 oerjhh08IdKf/huvTLhC9PRGIKEXl5R3d8npyCDADgDwN2cPyAg1jCVsx9U+2ci7eTsY4Sfjr1H
 n2TYWjxKXh75PAw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Dec 2024 12:17:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6010

This variable controls whether libraries compiled by recipes inheriting
cargo are installed or not.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/ref-manual/variables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 2a97ff98d3f0cb178ab2b6463980cf5a354acfc5..1d4e2e2be67aab3ea22d1506be94c7222bbc6f53 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -1230,6 +1230,15 @@ system and gives an overview of their function and contents.
       :term:`Metadata` so it does not need to be parsed every time
       BitBake is started.
 
+   :term:`CARGO_INSTALL_LIBRARIES`
+      When inheriting the :ref:`ref-classes-cargo` class, the variable
+      :term:`CARGO_INSTALL_LIBRARIES` can be set to a non-empty value by
+      individual recipes to enable the installation of the libraries the
+      recipe has built in ``${B}/target/${CARGO_TARGET_SUBDIR}`` (files ending
+      with ``.so`` or ``.rlib``). By default this variable is not defined and
+      libraries are not installed, to replicate the behavior of the ``cargo
+      install`` command.
+
    :term:`CC`
       The minimal command and arguments used to run the C compiler.
 

-- 
2.47.1


