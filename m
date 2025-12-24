Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B3AE776E2
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123190.1766593917852923655
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=NTq9N1m+;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 5C5961A23E1
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2D3316073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:56 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 186CB10AB1371;
	Wed, 24 Dec 2025 17:31:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593915; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=sYANjGp7xZngddTZryLBh53DHF1xFrsLNgQtAhIN/Fk=;
	b=NTq9N1m+BU/ZVGPMw/J1oKUxCYJX6aGfhj+TYIK5rdiAgaEjh5Njni15hhRmeD+SelcmjP
	GByFkfAs6RXzuAxpOnsowjerhnMqhb5ulqHVRVmq4cMvXzIZbd5GWP1WolE4lNhpokgt1/
	+dE+EfHu5x5gOUV/58mahEZUSpkvL25fqE0o0nk7kgTPGxcG7atuoWpm4yDMNZQ17ywpQd
	3YXvoGYpUrYXgwDCxHV7iMaC8kyUyeN4mhbpA4rHkpR6KAP3gOj90tALlLFbQyUbuhaOIH
	LkaTINQYNtSi32O2OQlmvanH8azEEFHL9c4wDDn5SGnqgNB5ESQM6HA3Ko9BeA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:39 +0100
Subject: [PATCH 13/53] dev-manual/libraries.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-13-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1583;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=hIpMky2f0WYKueMG+OJk7gMtjppBoTXKU+VAUH2LICY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVoh9rb4kh2lycIfSqbjVdUrUgbOLt39WDIQ
 nqtkmCWdaiJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaAAKCRDRgEFAKaOo
 Ntc8EACjbOCqW2070/GZdbKYXs8dXstshLCzkcPy3xY7eOGEqhwnTRkn99+fzGuOy3+KEf+fk6P
 CTJ1TO6I/pyExDaJ4Umr6zXnWJhYzhUEKxqnlHD1CJaf5Fl3RGIef1Zv0UZI3Ehpy7+ZWfeOk6N
 VFC4EXMnUEwJw/mYmUbLO+56q9olv70Agzt06W1l+crnPhBmGwwfNhrWookki1q1SvBYXTK9+1I
 +HWB5EQ/xdTA4ZABMjZZ0ilrzWbbU+K40ewFMoYjxX0uDL92e89QVk5HsL0xhQxFhllvhuTF9QC
 Az0Va6u5osuUbZui42mRA8K6d+9oGcblslnx/KLZTYzruZm4tWe5R0y8JqDVdhkv4zVgbulTPQK
 JNnTZt8HAyyBz56c+p4/YrvAsbbUPYR2hcEb/pEILFz5r5gB+mA6/4FhRgaKjYJ58M9FLIPNCpi
 xWKmGiDE0C/Ag6RZkOHLUIAGR3U23/ZfgU3NLX21LNY1mxEW6V2kAx/UWZSpZA8hT11ipUOrI8w
 DPwZj4JTlwyzWSKFrgteK88qaHGJY3YdYegcM82gmUs59IXdDH1QzKbWoItxRkjjaQisX7j5gc6
 PdDty4a9LDkM9LBzqgYOlDxNEeB6WiptGDwvG1epMm0o/7Kd4xD9ZyNhrWT79ZXWt49gk1yLvon
 CMJF/+qU8oCmG0w==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8342

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/libraries.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/dev-manual/libraries.rst b/documentation/dev-manual/libraries.rst
index a8c38128e..697ea48e4 100644
--- a/documentation/dev-manual/libraries.rst
+++ b/documentation/dev-manual/libraries.rst
@@ -68,8 +68,8 @@ libraries and other binaries to use a different set of libraries. The
 libraries could differ in architecture, compiler options, or other
 optimizations.
 
-There are several examples in the ``meta-skeleton`` layer found in the
-:term:`Source Directory`:
+There are several examples in the ``meta-skeleton`` layer found in
+:term:`OpenEmbedded-Core (OE-Core)`:
 
 -  :oe_git:`conf/multilib-example.conf </openembedded-core/tree/meta-skeleton/conf/multilib-example.conf>`
    configuration file.
@@ -90,8 +90,8 @@ meet your needs.
 In order to enable Multilib, you first need to ensure your recipe is
 extended to support multiple libraries. Many standard recipes are
 already extended and support multiple libraries. You can check in the
-``meta/conf/multilib.conf`` configuration file in the
-:term:`Source Directory` to see how this is
+``meta/conf/multilib.conf`` configuration file in
+:term:`OpenEmbedded-Core (OE-Core)` to see how this is
 done using the
 :term:`BBCLASSEXTEND` variable.
 Eventually, all recipes will be covered and this list will not be

-- 
2.51.0


