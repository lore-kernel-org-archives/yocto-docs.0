Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C35E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:53 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web11.12812.1733315023311739401
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=JTjsHdhk;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D36A41BF20D;
	Wed,  4 Dec 2024 12:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315022;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a/ikerQ7wyQVLJlv6/Uq8dkj+TFBmbq8jjdSzTo5rhM=;
	b=JTjsHdhkrS7Sz+KsF/b4nlpJ0HmaUBK0ubEAxPE7W4I2zqSdU+j+P89ai4pzu4kUx2hmT0
	tkwZN0RQu3QdFZADla5ZL6MixglwmiqnsL5PPt72uR+/LGE4uOA6vU6YPssmHYjCf0HIe3
	Us54ribV4s/tSNFsC4Y7npfLEKpXMz8fuvYIgJCAJFhteNwJGQrCxUW6kNj7N6OU42KcNY
	WRwLhyCko8VddhP/1fGv8doZO0eODDqKj4MdNwWtU0aPd3k5uIU+NlhCMmHEukKAzDGMqD
	CUF/X0UI0eRXY1viu+pPAE5X5/JTmD2SyDepNysEJzVXsCfNhgKVnZ3dzfxFSA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:14 +0100
Subject: [yocto-docs PATCH v2 6/6] poky.yaml.in: add missing locales
 dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-update-doc-deps-v2-6-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=d95V//BTmfXnRSAhOcK3QP94Z7Jn6UnKN0DAkr5nFE0=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLNqq27E2oQ50UAsFQ+0+HSPilLnPT8TDl3
 HF8UFfK41mJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 NtBGD/9kl/JoH13yEYluioH/sQrNMuMDb/P0a9+0MsMU9Qq4BStTKrbcl9YesSIbTe7EC4JO7dZ
 M9YTE5/HQ4Nxfi+LeGPm8Qrf1WPCgZNe4P85GOgO7FbWEdlB+LD+MoioGlnDwsCrfJfXIyTY2XG
 UQPTb2NPWYpRf/Y3B7wWseI0g4KBNaqesWAWyinAPE5VGlzJaEJvyrRyZvo/DehxGBrkUHCqV51
 X1Pm2pvARz6ErcAF3/5ol1lN7QQglXNY1DOknFnkCot4BxpgqotvdV0l9s5zE64dz8XUv+K2znC
 Nt3QzGacbyTx+ni835GVIXTeID4ajdTRYianwDHLS9kXHIxQOK9hhkXVU9X5+fD1iUQeXkOqkS9
 RpZMSThHgis+oaeaW4oYwRTjGfLoEELoTdPiKFL/nWo6XgEiKno60YLrYrhMQGldGdGfSvap7OM
 5/jr1HjmVfOm0kptJ5KmaV+bIEX3sbbHdsZqA7zzJBVl7Azm8qNLxT/ZJLdCFXz+H2o7fvHqwpJ
 j/51tAbsZIS+UBmR9UFC1iS1yzNNQZYtRAaW6FPQaDMOU0HmXodcg69i2TrJusTa1sTToET371r
 J0KIFuNMMcW6QUVXnq9VZwTvLBwI7F/ZwObUMq7x+7EkEiVkTahs1QqZ8QvleZFofva5KBf/i5x
 psC5SVq/GGFK1gw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:53 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5887

This is a requirement for building the documentation, otherwise we get
(on Ubuntu 24.04):

     File "/usr/lib/python3.12/locale.py", line 615, in setlocale
       return _setlocale(category, locale)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   locale.Error: unsupported locale setting

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 25385068679a51e0f2e9e516b02b62e19e126291..340c6e891615d4b552a879062ac9e367888905da 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -63,6 +63,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
   librsvg2-bin
+  locales
   make
   python3-saneyaml
   python3-sphinx-rtd-theme
@@ -128,12 +129,12 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
 
 FEDORA_HOST_PACKAGES_DOC: >-
   git
+  glibc-locale-source
   librsvg2-tools
   make
   python3-pip
   python3-saneyaml
   python3-sphinx-rtd-theme
-  sphinx
   texlive-fncychap
   texlive-latex-extra
   which
@@ -185,6 +186,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
+  glibc-i18ndata
   make
   python3-pip
   rsvg-convert
@@ -244,6 +246,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
 
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
+  glibc-locale-source
   librsvg2-tools
   make
   python3-pip

-- 
2.46.1


