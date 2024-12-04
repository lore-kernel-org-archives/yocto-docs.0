Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B35F2E7716B
	for <webhook@archiver.kernel.org>; Wed,  4 Dec 2024 12:23:43 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
 by mx.groups.io with SMTP id smtpd.web10.12920.1733315022354931532
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Dec 2024 04:23:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=oHAlX8q4;
 spf=pass (domain: bootlin.com, ip: 217.70.183.201, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id E0A221BF203;
	Wed,  4 Dec 2024 12:23:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1733315021;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VfZmioT27AtVnFUnuGYc1jZVOwwpo0olQsT33QKYODg=;
	b=oHAlX8q4XuTAqiVVoT447Gmd+61c79YBP8cIX0GaYzyw6UuiNTqiyoCHuLsge4Fbe+FvtC
	Xh8xkxCgQ7eY07ycCa5UBI7zaPic/kFz7/LO+DLY6y7tdW73DE16Z0jDhCOExemLfqgsq0
	gCQhl5yC7dKZG2atZDx8HhfMnDvkR5pCk9JZYYl1tkoWH98Xgo5xVJY9zNRsWhtiiARiWy
	9V8lOOZ3a62kNXS1Fcidk/dsz1sg7/j6Y5JH3cQiMDqbWAYWWrubqrx9qRetIXM8Clal4A
	v2YklPhmjD/+8kIlkxmVqb8+0UIA+RSBIrSNlFqgtzWNNO/ioAd05w5DvOALIg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 04 Dec 2024 13:23:10 +0100
Subject: [yocto-docs PATCH v2 2/6] poky.yaml.in: replace inkscape
 dependency by librsvg2-bin
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-update-doc-deps-v2-2-1d9b4063476f@bootlin.com>
References: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
In-Reply-To: <20241204-update-doc-deps-v2-0-1d9b4063476f@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1344;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=gBQx50A2UoZQaB4P/cxH8kqp0Ye4bwysndQ7haWAuPI=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBnUEnLtqZ4lwn+TKg+WCESnLa1c+FMqlmxqOymw
 4Le486ZdCGJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ1BJywAKCRDRgEFAKaOo
 NjhREADAnO0zgyJ9Jq1aWoWzG0nMs+MB8Dx+z39bCr6vXq/s5jbE6XQMnJTTKAV0VW/1C/lfL8n
 FWKZMgRWqkDQX8oShgUcBBZXrvTpfLG6uWk2TzgEDqCyefz5VN96zysHO1yOVgz6YqPEuApyTSh
 eekizCfjk8+ITqiO0uYMrfPeCeIgTD+EwLEDHzzQVygLbp+LOs32QCLfe5qoDdiks8co0ThURwx
 GhH4XJs1bideYKGQQ8Xa+oLK36n1MDgGoC+2gEH/uQj3lr2sqhYfGQU3yHEksnhdpZbbiyebxbs
 IZ87Ep2DWAc4YjOLzYfaUcn6Ui1f0r1at5A5/wm2UqOSvciDLnNyfgu1jl5bXq4ncEsPG/XCdyN
 ieqmtZJH2AwnxUTfQNUJzQokhuww4OE0djjPNJrThItp236VR0J/zI2wf4dx2VUiPWTmJSdzPAn
 cJMjeNHGlICMDRcKqv9mbUyOYEt9zTbX48O+W0PSYABqPKw9s8YI28wQAUsiYVmq49KzBlCgIqI
 X7lbL+aj27x60uBQRutASSHS0ghlGJM4Dp9vZVIlWRmBfcUabbvsuLnN4ErIq5nfdwPOq6BIPol
 XqiW7IrgwXqW4nhuO0/JqLSDIV1GJmiMe9SS12ix3cAgdMN/UajBTkofQP1ZDvRkEYonh/FWC1/
 sjGHqGOqO+E/ypA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 04 Dec 2024 12:23:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5881

inkscape used to be a requirement to convert SVG images to PNGs/PDFs,
but we replaced it recently by rsvg-convert.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index d03809f557960d10a6b9a2753a65c80937c62e13..94849acf9942c7ebddb2ac7f8aaf5eb9d87e0c5b 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -62,7 +62,7 @@ UBUNTU_DEBIAN_HOST_PACKAGES_ESSENTIAL: >-
 
 UBUNTU_DEBIAN_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-bin
   make
   python3-saneyaml
   python3-sphinx-rtd-theme
@@ -119,7 +119,7 @@ FEDORA_HOST_PACKAGES_ESSENTIAL: >-
 
 FEDORA_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-tools
   make
   python3-pip
   python3-saneyaml
@@ -163,9 +163,9 @@ OPENSUSE_PIP3_HOST_PACKAGES_ESSENTIAL: GitPython
 
 OPENSUSE_HOST_PACKAGES_DOC: >-
   git
-  inkscape
   make
   python3-pip
+  rsvg-convert
   texlive-fncychap
   which
 
@@ -209,7 +209,7 @@ ALMALINUX_HOST_PACKAGES_ESSENTIAL: >-
 
 ALMALINUX_HOST_PACKAGES_DOC: >-
   git
-  inkscape
+  librsvg2-tools
   make
   python3-pip
   texlive-fncychap

-- 
2.46.1


