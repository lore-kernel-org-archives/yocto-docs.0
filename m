Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B90D1CAC5AE
	for <webhook@archiver.kernel.org>; Fri, 26 Sep 2025 07:54:49 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.web10.12258.1758873285488482814
 for <docs@lists.yoctoproject.org>;
 Fri, 26 Sep 2025 00:54:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=YPopNTm/;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 50257C003F8
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A52F0606E3
	for <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2814A102F1871;
	Fri, 26 Sep 2025 09:54:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758873283; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+XPWp55u1As3IK9Z4r/M9IPibvODp45FqNY96GYIzpU=;
	b=YPopNTm/tdMsSreDjvjps9p54pkkc+sXcIasjl5HB3QKml+5hVJupBYFaGASh17oILFRxq
	j3gNssyLxHvzVbcU6+Y8Sq4/wokxikoIuLfIMW7lHjm/B/uUkA8YJIDunzjhprfRUvkc4m
	+g10wkDwWaaem46dqIAlCdDgDG0gNFuvosf/SU51YzL2a8fUWEUPNEPglTV5RwdYhmB2ji
	lsZw/FBjRI6VCXPJT0tXMnx66m67nodY+kpL8D85Zx4k2nFon+exUmjTX6XPunsbnym81/
	9pmBaQpLhbdTldG5TSk2B8O0VFs2KSZ1bZwEmQVWuf5s6bT5BuO83684xB821A==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Fri, 26 Sep 2025 09:54:25 +0200
Subject: [PATCH v3 3/3] dev-manual/layers.rst: yocto-check-layer: update
 list of test
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250926-update-compatible-doc-v3-3-3740c44e49b2@bootlin.com>
References: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
In-Reply-To: <20250926-update-compatible-doc-v3-0-3740c44e49b2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2515;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=/wf48CopZCvU3iwAisJC9yRqxxCFkSOzY5RkWHvHRME=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBo1ka7kwbILkEEGvqNyk2ZxKsio+YlwGt8rxZv0
 uED9kiRNaGJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaNZGuwAKCRDRgEFAKaOo
 NhGhEAC4su+X5O3W/ToPGl8CHcBQ4lz9BafiKCmZVxXapAt+ExVkcg3r/SEkXf/utVzYepiA+94
 b6qpmfG3uK1dRODxQnnbwzxrW/+iv8cSNxQCNOXU9OC4M3ZpBt8tnWosXFLDYtkPWGmdDiVRq1G
 V0JQxVfbX+PW2rRyvS1IKcsSJc3ruUMpGnFWyVu2hLGCfsVwTXGKvD1kYWaUqeBRPddLNR1J8ig
 cpCThyrSU/8fB3EwAPfGCgmtWXtd78DGxUNI3nRHZsaBK3Z/QdusCucUI1yxtbYlDsFZBXqEFW3
 mXWZQjbyvnpmxH4JhTjZkT+g24cYLOb1HkE/N3Tp+Mw1SDTpL78/FH4cj3yTuTRj3GXkXjGJEMi
 M25sUnSbP+/b8r9iVbHeF2Ow7GmCTFOXdHAwlmfAbYAcgC6GQ4UKWA/WEEAsEazro8la7TNNJcZ
 dUjgbxtwHyYvkxeY5zRLMiln90vEElPEOfSwzoNF7Waszw1MUPeBR9db1mFWoDgUBTdQlZ0nL2u
 RTvVsdpya2RPokuvWMwJMoZ9AuRQVGr/i0bZLex1L1xuPFvPXRxtylTGH50su7pYGG8PC9ZTl4n
 YAAWlUQm4imcFzI/Inr5ZzzDy9N3l5PYvG18iv607wgRH/3h3KpIGB5UHLEog+T6k33sFKhSbnO
 6G/QmOQ80ERqVPA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 26 Sep 2025 07:54:49 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7608

Update the lists of tests as found OE-Core as of commit 07747aa7390e
("piglit: rename virtual/opencl-icd to virtual/libopencl1").

Add a link to the test directory in case the list is update, users can
still browse through the code.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 4224a02b2..cc7103ba6 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -392,12 +392,17 @@ These machines are the ones present in your BSP layer, in the ``conf/machine/``
 directory.
 
 Entering the command causes the script to determine the type of layer
-and then to execute a set of specific tests against the layer. The
-following list overviews the test:
+and then to execute a set of specific tests against the layer.
+
+The following list overviews the test:
 
 -  ``common.test_readme``: Tests if a ``README`` file exists in the
    layer and the file is not empty.
 
+-  ``common.test_security``: Tests that the layer has a ``SECURITY.md``
+   (or similar) file, either in the layer itself or at the top of the containing
+   git repository.
+
 -  ``common.test_parse``: Tests to make sure that BitBake can parse the
    files without error (i.e. ``bitbake -p``).
 
@@ -406,6 +411,13 @@ following list overviews the test:
 
 -  ``common.test_world``: Verifies that ``bitbake world`` works.
 
+-  ``common.test_world_inherit_class``: Verifies that ``bitbake world`` works
+   when the :ref:`ref-classes-yocto-check-layer` class is inherited.
+
+-  ``common.test_patches_upstream_status``: Verifies that all the patch files
+   included in the layer contain a
+   :ref:`contributor-guide/recipe-style-guide:Patch Upstream Status`.
+
 -  ``common.test_signatures``: Tests to be sure that BSP and DISTRO
    layers do not come with recipes that change signatures.
 
@@ -431,6 +443,10 @@ following list overviews the test:
 -  ``distro.test_distro_no_set_distros``: Tests to ensure a DISTRO layer
    does not set the distribution when the layer is added.
 
+For a complete list of tests, see the :oe_git:`scripts/lib/checklayer/cases
+</openembedded-core/tree/scripts/lib/checklayer/cases>` directory in
+:term:`OpenEmbedded-Core (OE-Core)`.
+
 Enabling Your Layer
 ===================
 

-- 
2.51.0


