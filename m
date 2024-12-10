Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A23BE77184
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.6755.1733824829750871054
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=NaqF4TMv;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 38DDA40013;
	Tue, 10 Dec 2024 10:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UvnogFM8ijd9mCwOdpFw7AkD/z0mrTVdXNNTslsB9Oo=;
	b=NaqF4TMvXL5DnJ/cZ1O0NkyjgT4UdSgtdyp6NZNuBm7YW7cJ/1ZMqiT9q0fLOiMjVJov8p
	z1rUfM9b+p2x/p2MopsK2xXodlVEbb9Iy0OhsMwhkftVCW1rWpbvz7s4olykfTJegMPAjJ
	XtsixOJ75XRrKGMhJSLBveIEUQSuQ/8zTuG0Nwfoaa/Ur6BGumRM/YhU4YC3yQ4d0nfCo1
	v0MuheNYA+0DfAlAlQpsN5JUh6+ohIjAtS5AuctbL+ZSzlue5mMVdbZkusT6o6Kw5gqe12
	ih3ac4hbfZASIAPAVQHRmkQKpsif9VTJ4Kgs6cLg5yhsJ67FA0MtuV4bGSp2MQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 10 Dec 2024 11:00:21 +0100
Subject: [yocto-docs PATCH v3 3/6] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-update-doc-deps-v3-3-534699936ddc@bootlin.com>
References: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
In-Reply-To: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1385;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=vktPXiXdVWbznhx2W4Alh1DkMFa27dtx2pDS98MJBTo=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE67xRMj/plQeYtAmRrEpuXBGdV6vXAtl3/3
 mzmtZ1Ngt2JAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 NidrD/4zakMbtCI9IN6l4MsvYGWW8AzPb/a9LGFdSEfG94bbcmgfVNNj1kgfVGhYBP4DsrdiX5G
 bdUWPLDkONFCMc7polS8TKLutwxPKzVco+HIs1E0ZFcww1aaIWJAGee3pgdh2QBfGP2tnJGnD7i
 PBhzzogdsbWlPZVK1HDavO6n5uqSFPR+4FiNBC4h7cFzlW25weor0TX7ehtknUbb4C7tuERX252
 +dqS0yXSzYfTgo2g3WGHCaR48jHAjoxXkxVxg2PnSC/xCdVyUVGjhTwDHSuKbLp+PqUk2v7Y6zk
 hG522othPLIDRXmE9jTK9pqM/EEZhJdS2vU4sarIekhlde/nrMuW97uMq43iZ9RNpDKLuvR3Pcv
 az4l36j0DrBjRoJL5UA0IjeAfFOSx3v+i4ehw53qGtYKKoitwsosDTKwPThUSIndnMTX1i9YqQ3
 kjBBudXVSoIOTDNExteo7yM0K1/pBSMLOGQsLHzvsyiipqAfAow6EwhsDKaJc3QRCJdRqd5uXHa
 C11eydaXUEyElhTNSt+tTBpFeSPfDclL3FD9lDw5W5mWPo5e111JC0FFjEa5Sme8GcZogmiSyND
 Otfcv1di1DIZ1uQwoF8Rbo0y4ZFHbqCYGQPUkQMgTVya6MjrVuF6cccIX2brPY83W1tKphsNoo3
 uVEMgdq7ZI8tgbw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5913

inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
but we replaced it recently by rsvg-convert.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index a81610756575a47c55d1e0cc7799e7920657adee..eedefcdea88694061fa2a3536bc86f78ed4a28d0 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -62,7 +62,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-bin
   locales
   make
   python3-saneyaml
@@ -120,7 +120,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
 FEDORA_HOST_PACKAGES_DOC: >-
   git
   glibc-locale-source
-  inkscape
+  librsvg2-tools
   make
   python3-pip
   texlive-fncychap
@@ -161,9 +161,9 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
   glibc-i18ndata
-  inkscape
   make
   python3-pip
+  rsvg-convert
   texlive-fncychap
   which
 
@@ -208,7 +208,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
   glibc-locale-source
-  inkscape
+  librsvg2-tools
   make
   python3-pip
   texlive-fncychap

-- 
2.47.1


