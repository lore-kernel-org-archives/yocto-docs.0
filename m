Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11898C02185
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:09:18 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net [217.70.183.194])
 by mx.groups.io with SMTP id smtpd.web10.7672.1737108551468513907
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:09:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=ICNBXn5h;
 spf=pass (domain: bootlin.com, ip: 217.70.183.194, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D33CC40004;
	Fri, 17 Jan 2025 10:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737108550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIBnUQaRtcW8OHFyO7nnCauautjbs2sG2nYmXOMvrQk=;
	b=ICNBXn5hXphWj9wJMXw5t3rwXDqHKrJ263v77vqO+DJihwXM9jYqAxSXwlFp5qw66kiBaV
	3KvK88o+jIzs+dFFM5/bkPRkRG4FyiLfn5BKPJJ7f1f/honHUGJrUzhc8P0ks9R2iObJi6
	RziKriSkVXYjv71zy0bzKx33v/m0/Aj9otVOtqiDFLLeqGVyKA/01XgBtlooQ8ZJv6sVZL
	hV43TLyf7TDw7iRLb7ii6hu5lsrEYlyutbWEZATLWdAEOdgsf1S6xfa+KQvjeDik0yHrSw
	8ISrB2mJWNtd3YiJEYLLLYTtDTeI/f0OebXwYkhR5if/Gm06Zy9RH2OAwB1V1g==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 17 Jan 2025 11:08:49 +0100
Subject: [yocto-docs][PATCH v2 1/2] Update autobuilder URLs to valkyrie
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250117-update-autobuilder-link-v2-1-3ca2d22ab24a@bootlin.com>
References: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
In-Reply-To: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4971;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=VfCW9AbQtt4rCkl51DZg3d0e6Vlaa9vG+e0pl3A5ZFE=;
 b=owEBbQKS/ZANAwAIAdGAQUApo6g2AcsmYgBniixFrvhRfKv0MRQBTVWW5MVw7CxD0EjuxODei
 CJte1ctTveJAjMEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ4osRQAKCRDRgEFAKaOo
 NmH5D/9ZgP9VkutnJR/0CNDl/FaMVoT4PUtgcFRhoHsRyn7HGfSiLqbgYTATtp6Vh4ISGXo7+8S
 KgW85IddfG3gUcZTdG4q6/dktGaXr7UDtp2LajQF6cH0KVx5zeKSx9U88zmj2JHfQrQeIYToZ/+
 MCqRYFk0ths11Bubrn2zKa8tAdCC8jrTFXA2Qv7I2DeVbr9YQETiPnVmF5TeiYN/+6w8dfd9CYg
 13b0mpS/TAbN4ef3XpsTA2Ub8AHfANn3keG0i1YaBb+HVfZPzNe6tSf279bRXbHx/Dzo5ARHiKE
 AfVGT7akg/avT5wtFF1L1spFow3MUWO1mMMnsdJYITB3yClwqA49up5Y95tYjXdfdhvMqtLxfTN
 OTBSmfVWR4MA4jtgMOIWYaoniqOsmyTncvOiSaBwIvVi9HoE2qrn/cOVGECNJfvWvdV01dAMw+y
 LKbaO62olWtjmBkUtEKxYP7jUU6ubzuqAHJXwQxVg1D3/gAkAZw8pe5auG33rhqxOOEUwphOjq4
 wRsxYvmKH+/pAmnuhfn6IZFeZ3IU8va1QGiEWHS4r/cyfLdZXWupXY9745637nFv35Ka6N3hFW2
 u9parJTBwLGCZ+u6P89Cc8w3n7BgIaotxSYt1EHR1jSnbvNw8PFekRnzgonXTakgt0q7+6G8G/e
 wfWgj6zbEylsn8A==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:09:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6123

We have moved to Valkyrie which is hosted on
https://autobuilder.yoctoproject.org/valkyrie. Update the URL in the
documentation.

Also, the YOCTO_AB_URL macro was used in a single location in the
documentation so replace it by the :yocto_ab: custom extlink and remove
the macro.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/poky.yaml.in                           | 1 -
 documentation/ref-manual/release-process.rst         | 2 +-
 documentation/test-manual/reproducible-builds.rst    | 8 ++++----
 documentation/test-manual/test-process.rst           | 2 +-
 documentation/test-manual/understand-autobuilder.rst | 2 +-
 5 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/documentation/poky.yaml.in b/documentation/poky.yaml.in
index 0933cbbd351985899ecaea94ae42748bd7ba1753..d045ff596e6d7d7d46be373078e8bb8b38483267 100644
--- a/documentation/poky.yaml.in
+++ b/documentation/poky.yaml.in
@@ -12,7 +12,6 @@ DISTRO_REL_TAG : "yocto-5.1"
 DOCCONF_VERSION : "dev"
 BITBAKE_SERIES : ""
 YOCTO_DL_URL : "https://downloads.yoctoproject.org"
-YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
 YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
 MIN_PYTHON_VERSION : "3.8.0"
 MIN_TAR_VERSION : "1.28"
diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index c4452228a70268649f56ed3ecfde1f7418926fc6..639921b9f65fe3908e26ae69569eddc677efa322 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -190,7 +190,7 @@ effort has been made to automate the tests so that more people can use
 them and the Yocto Project development team can run them faster and more
 efficiently.
 
-The Yocto Project's main Autobuilder (&YOCTO_AB_URL;) publicly tests each Yocto
+The Yocto Project's main :yocto_ab:`Autobuilder <>` publicly tests each Yocto
 Project release's code in the :oe_git:`openembedded-core </openembedded-core>`,
 :yocto_git:`poky </poky>` and :oe_git:`bitbake </bitbake>` repositories. The
 testing occurs for both the current state of the "master" branch and also for
diff --git a/documentation/test-manual/reproducible-builds.rst b/documentation/test-manual/reproducible-builds.rst
index d581155eb2a45e36c4d54fb1ad8b5d15980bc508..7769a85d515d3fd4b06ad2ef76239aa774eb8af3 100644
--- a/documentation/test-manual/reproducible-builds.rst
+++ b/documentation/test-manual/reproducible-builds.rst
@@ -121,10 +121,10 @@ The project's current reproducibility status can be seen at
 
 You can also check the reproducibility status on supported host distributions:
 
--  CentOS: :yocto_ab:`/typhoon/#/builders/reproducible-centos`
--  Debian: :yocto_ab:`/typhoon/#/builders/reproducible-debian`
--  Fedora: :yocto_ab:`/typhoon/#/builders/reproducible-fedora`
--  Ubuntu: :yocto_ab:`/typhoon/#/builders/reproducible-ubuntu`
+-  CentOS: :yocto_ab:`/valkyrie/#/builders/reproducible-centos`
+-  Debian: :yocto_ab:`/valkyrie/#/builders/reproducible-debian`
+-  Fedora: :yocto_ab:`/valkyrie/#/builders/reproducible-fedora`
+-  Ubuntu: :yocto_ab:`/valkyrie/#/builders/reproducible-ubuntu`
 
 ===============================
 Can I test my layer or recipes?
diff --git a/documentation/test-manual/test-process.rst b/documentation/test-manual/test-process.rst
index 7bec5ba8285cda1d6b0157c38eb693fde7d0e557..945b56830fc3f7368a73b4655f8ea325a2d780a7 100644
--- a/documentation/test-manual/test-process.rst
+++ b/documentation/test-manual/test-process.rst
@@ -20,7 +20,7 @@ helps review and test patches and this is his testing tree).
 We have two broad categories of test builds, including "full" and
 "quick". On the Autobuilder, these can be seen as "a-quick" and
 "a-full", simply for ease of sorting in the UI. Use our Autobuilder
-:yocto_ab:`console view </typhoon/#/console>` to see where we manage most
+:yocto_ab:`console view </valkyrie/#/console>` to see where we manage most
 test-related items.
 
 Builds are triggered manually when the test branches are ready. The
diff --git a/documentation/test-manual/understand-autobuilder.rst b/documentation/test-manual/understand-autobuilder.rst
index 6b4fab4f0b2be5a6806db0982e257b9059d15fa7..7f4d1be3cd477cfe759a44efe67d65c97422a7ed 100644
--- a/documentation/test-manual/understand-autobuilder.rst
+++ b/documentation/test-manual/understand-autobuilder.rst
@@ -10,7 +10,7 @@ Execution Flow within the Autobuilder
 The "a-full" and "a-quick" targets are the usual entry points into the
 Autobuilder and it makes sense to follow the process through the system
 starting there. This is best visualized from the :yocto_ab:`Autobuilder
-Console view </typhoon/#/console>`.
+Console view </valkyrie/#/console>`.
 
 Each item along the top of that view represents some "target build" and
 these targets are all run in parallel. The 'full' build will trigger the

-- 
2.47.0


