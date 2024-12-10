Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38C5DE77185
	for <webhook@archiver.kernel.org>; Tue, 10 Dec 2024 10:00:38 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web11.6873.1733824829525744166
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Dec 2024 02:00:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=bnX2Qv6w;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E71D740011;
	Tue, 10 Dec 2024 10:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733824828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LAXJ95bGKaqSuQV1xg8HMj3toIVdzDYuIm4/0VZi0ZQ=;
	b=bnX2Qv6wb+oGlq9XHnE17sVsm6Ki5ivt/RdNko+cAF93FfYX3GnlepAeG9CMkXzEX3CG8D
	ekmhpDSz/ebyBML5W5v4K9UiVkjHRX67GMKX5dKbSh3UB9ilTSYph7Vl8phj29Rx61CVlJ
	uAeRDhfKRiBVYk3R8deH+dqWG0qMqwqjf9gUdMK7qF0nzObnF/aer4I7D7ithvuUiTL64n
	CFOUuJrSKhfeXuzAEFEpsoLb8PrxGdjE+q3kb8FQFYv+F8sprz9aHAYiEiaIItuH3nqyRW
	Tb1JKIC7Is4yEVWdH2MnYqtNlw5wi/C9bDf9ygSRyRiSosJ99lW0b320GzuN6w==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 10 Dec 2024 11:00:20 +0100
Subject: [yocto-docs PATCH v3 2/6] poky.yaml.in: add missing locales
 dependency
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241210-update-doc-deps-v3-2-534699936ddc@bootlin.com>
References: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
In-Reply-To: <20241210-update-doc-deps-v3-0-534699936ddc@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1373;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=HbFIbpamvoXzN0C9DoTcgb/6YF+hLE9ypEMIHISqJpQ=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnWBE6yUOqhwoqiZaoq3YBgP4MXijL2g+77jdsp
 TEZNUpw/miJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1gROgAKCRDRgEFAKaOo
 NquVEACGaB11vLFU70YzNwSTcz9yLnzWBIYN31W6OEIl3nAgQPvT0xjxIpAJk95fdV8mmmFoVjg
 wNEBTaAMafHtIgJ+JA6rHzCno1iVTYUs2wazli3CvnvaLQ3bQVlZpgMi2R1V6b6N6+mjsjQ4t2F
 PiccwtkhGL1Afjj+GFNIBU4di0JuwBSCUr/Oh6mmvVowPwKIseo7yylwEsAjd9Miu6WuUY5kz/Y
 xB0cYV8KwffqR1fHCNhVeug8SLncvww7+yitz8rh7asvlIrWvIx/VfuartKVM69+JPGttDxdZuA
 h6KqqVwQLW6k9DQRmwvfYgbcfZ+W8udW00sKC9GCpRoLVYPP+36Sn+BLRPteFwqZghaMvz9xMD+
 5ttpJGoVJFWDyvR2+dNdoEHRaWw+QQ/gcwZNgb8+9CXeMGrawkryo2pS8sDDro0OSOft8e+vIad
 qb0RC4SVl9CAiHsKnvsONWL9sn9K1p5XAoYbsLFkRdHOPPYug9yU3Bqb4YpzhWzNiGfsowpNjW7
 xVizgwb84vWOuBCSreohiPr7hCgPr+uRXTomLZic+TQEV5a4hrDD0ChFS+FCteIPRzDc/hOcGQq
 HOfKVb7INkaQAhr/OoEo6epMKjRGGUno4D+JYAG3bwJ3JqICWAY45nudRPNbFrMi+CRvsL5gYoJ
 kJLmQft8kwOV1xw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Dec 2024 10:00:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5912

This is a requirement for building the documentation, otherwise we get
(on Ubuntu 24.04):

     File "/usr/lib/python3.12/locale.py", line 615, in setlocale
       return _setlocale(category, locale)
              ^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   locale.Error: unsupported locale setting

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 117307effb99bc9a0f7203e3f786cfca6512791b..a81610756575a47c55d1e0cc7799e7920657adee 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -63,6 +63,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
   inkscape
+  locales
   make
   python3-saneyaml
   python3-sphinx-rtd-theme
@@ -118,6 +119,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
 
 FEDORA_HOST_PACKAGES_DOC: >-
   git
+  glibc-locale-source
   inkscape
   make
   python3-pip
@@ -158,6 +160,7 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
+  glibc-i18ndata
   inkscape
   make
   python3-pip
@@ -204,6 +207,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
 
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
+  glibc-locale-source
   inkscape
   make
   python3-pip

-- 
2.47.1


