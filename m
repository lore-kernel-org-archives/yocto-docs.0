Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09D85CA6CB1
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:57 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5821.1769501992449855087
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=AoY6XnTW;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id E78684E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BEB9B606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:50 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B72CC119A8682;
	Tue, 27 Jan 2026 09:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501990; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=uc5naPPC/jFgrosQJME9DT6dVMcPNGTuPvtdILwZFD0=;
	b=AoY6XnTWG9w5QOuohLX4np8LYc/f8oO+VnXNLBZX6U+qlK8tzDwZiJlLBPXWMHTP4ig0x+
	9U5e+ni2/efcIZMaZhpRI8MyCTVl+pJKL0f3I5MwQ+erdBDtHxISf78qE4F702ykaPd+iB
	o17pi47+oopHTLAa/+OaIAogDPtq7BxI6APR5aYc7F8EgBYyiUDDTjW9WieLS6WCY5VM0s
	TFycorJd59X2B5JrHnv472drW6tjfGzcLumLmFVh6JpehBcB0PEYMDQ5zxtIUtkhUQ99Hp
	bw/qUiMaOVxO6laDiBLB2AEWoOU75S705+Z1+4wZiypgOVGgVDaFTYCIv/ALdg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:36 +0100
Subject: [PATCH v2 41/56] dev-manual/packages.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-41-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2214;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=8PWtVlmNtQAq1Q01kEuUZZNhbU9Q9LdY+pg7hsNWEVo=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHUEabGEwn8PWeWmo4jm1dcujMmuMKA7YIlfn
 RH2/nTe5WmJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh1BAAKCRDRgEFAKaOo
 Nh/4EADEQ8ei9fbKGM/CfUK7573yQh/0p/bC4ROES0Qk+hOlpsDLLHQggp1zyGAQ090lXVSNd8x
 1a6CGJmUKfAvup1RM/rc3IoovXp9plxnJgs+l0ZgwHLA5rTQSbn6UxSmaVZNeEIE/LrKTjqCym5
 on+ss4OyAXwggaIFUxWLQKUOWgyvNn7tw5C0dpS2ZLzVG2FRU28UFl9KQ03H6uhNJQv4XBqofGQ
 g45e1W1bq80TiYxXOFsATdC/s9fN3Ziq7UGGGj/quK7Ff7ofhatUASOOdfIb3rrSLAhvXqNFDpY
 1ti+29nxHMWBZS7NamjPEI2842kFcxjLmR1lBZhIatvpJQdbxlu6H1tN80jLBuqYv41r1Lg8i9E
 RJD0LJlwIP8OPwPIWIE0HgCe96FkLUVGYMnk02x4FcNMLnDxbcbinUGszwWB3NMenuG74nNoNSk
 LLuCEcaRK9LZOlECjOLEhDRFduz9tvm6Jd/TYLSomI0JOAedhpD1kjS+P+eU7euRyDoP2N+wHyb
 3NQA2ana2cbX7mF7qVC1e1+QcOzG2r6CNNBkVK/IH3Llk4pF5ka6ZaKiohMLAU0ceAxoBiCtk43
 1SSGvPAJsBqx36bkEw8bMbwz7SakyvmfbbkgBwYTCassKbRTTuIEGdJggwVl8JOelpst+iw5OHq
 7KY2x5LhJD7zahA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8702

Refresh the document now that the Poky repository is obsolete.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/packages.rst | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/documentation/dev-manual/packages.rst b/documentation/dev-manual/packages.rst
index 8bd48c8e8..ebed8f076 100644
--- a/documentation/dev-manual/packages.rst
+++ b/documentation/dev-manual/packages.rst
@@ -361,8 +361,9 @@ package. It is also perfectly acceptable to call ``do_split_packages``
 multiple times if you have more than one set of modules to package.
 
 For more examples that show how to use ``do_split_packages``, see the
-``connman.inc`` file in the ``meta/recipes-connectivity/connman/``
-directory of the ``poky`` :ref:`source repository <overview-manual/development-environment:yocto project source repositories>`. You can
+``connman.inc`` file in the :oe_git:`meta/recipes-connectivity/connman/
+</openembedded-core/tree/meta/recipes-connectivity/connman/>`
+directory of :term:`OpenEmbedded-Core (OE-Core)`. You can
 also find examples in ``meta/classes-recipe/kernel.bbclass``.
 
 Here is a reference that shows ``do_split_packages`` mandatory and
@@ -543,7 +544,7 @@ to use. In your configuration, you use the
 variable to specify the format:
 
 #. Open the ``local.conf`` file inside your :term:`Build Directory` (e.g.
-   ``poky/build/conf/local.conf``).
+   ``bitbake-builds/build/conf/local.conf``).
 
 #. Select the desired package format as follows::
 
@@ -637,10 +638,10 @@ Lighttpd, or Nginx), take the appropriate steps to do so.
 
 From within the :term:`Build Directory` where you have built an image based on
 your packaging choice (i.e. the :term:`PACKAGE_CLASSES` setting), simply start
-the server. The following example assumes a :term:`Build Directory` of ``poky/build``
+the server. The following example assumes a :term:`Build Directory` of ``bitbake-builds/build``
 and a :term:`PACKAGE_CLASSES` setting of ":ref:`ref-classes-package_rpm`"::
 
-   $ cd poky/build/tmp/deploy/rpm
+   $ cd bitbake-builds/build/tmp/deploy/rpm
    $ python3 -m http.server
 
 Target Setup

-- 
2.52.0


