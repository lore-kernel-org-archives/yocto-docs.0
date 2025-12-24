Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0E0E776E0
	for <webhook@archiver.kernel.org>; Wed, 24 Dec 2025 16:32:03 +0000 (UTC)
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.123188.1766593916825596319
 for <docs@lists.yoctoproject.org>;
 Wed, 24 Dec 2025 08:31:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=BW9Bb/RS;
 spf=pass (domain: bootlin.com, ip: 185.246.84.56, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 542731A23E0
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:55 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2C2386073D
	for <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:31:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7618110AB1366;
	Wed, 24 Dec 2025 17:31:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766593914; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8doD9MXUF/cmtB32RchDFBrW7OUWWb2kwT/TlYo13FI=;
	b=BW9Bb/RSOGwWEJ2KAN6ea3+CLHa72u7F03IRuiN86Pyl1akaC9LYjXZfA0ol5dR82EW4ul
	Kba2vcymUEeD3WnGWNSOx5R7ul3J/0Q1meUbBrLp9bQLSHQeSShiwRpbaXwXc+JSRyztnp
	JQONOEyojELMAb3hHLCGFdZ4WMIC5ea8D5+ORqBDzKZ4VWzVgCaXuSDtfvxEFG09mm2bJf
	RFv1Xxx6WjwzDTRbWt3nTPapi4AKK0paYH4Kk2xPppWNy4ccrUc5fOLhYYkq7CcaskS7A4
	RX2CusAB1+S9WKSTTUSMqXqxwOH5tcQ4TF92VtVc9CyWDNw5vJlaZmLD4JZXjA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Wed, 24 Dec 2025 17:31:38 +0100
Subject: [PATCH 12/53] dev-manual/layers.rst: remove obsolete poky repo
 references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-remove-poky-references-v1-12-658a5f4dbde2@bootlin.com>
References: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
In-Reply-To: <20251224-remove-poky-references-v1-0-658a5f4dbde2@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4242;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=JMSddOH0bYa1FREUbxXrBhCgxuUzRyhv+DpG09TSyF8=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpTBVoUO4QIVWQYXUuprQO6fU7YcwyBnRNV3RJO
 SIETdrZJuaJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaUwVaAAKCRDRgEFAKaOo
 NgTqD/97G8gpIYosNxUp9DL/5dtLGlev6MJKU2u8e8oQWdc/5P4KnLmLxxCNJClZFbNg0GFEbix
 ykkg/Z+OZhEkF5RTLdvqReVl4dJQEufFrrXUDLgtQV7/7+UZpA5nd4JjLC/YAnrht270bUZK/De
 PVr7U5VBlRI5oCV8abcIvrxfdGi1GILddWmxXk7moMLCkk0j5ojYiyJ6YpxzH/IRbBasfrQZLDZ
 030c7+I1L8G/z0upiK4Maz1ZYx4rii3CwWmficQm/+96kgV9ULVkNlJK/nYm/Z4DgxEGFa1hhr8
 nXb6IqpvyAcCslTSsVhxHFEakgHqUTGdrjjKuZgfi19lmqdxw3nBJblJCKJ9Y827+Hw1icPdm9+
 XDV6THDlyWnICk6P1o6WwWcf+h39ANTrXEWiJ9y6Jlo1Jpf8UGvoVrsbN6z7pH2mvtpyFMZWMS7
 wU/rP5Z/M41+PHBIh9q3PslnUSzeYnVownruN0ErB8MVDNlbAvO5aozQI0LGmZw62/3OFRbaA/I
 9UJGSavCUW6U7UtXnpDUgikkAaXJbvfHQE1BHMeE+UEZO+9cuyu3KaMKW0tXigXAQiPFdY3gj1m
 vrsjqhjdKshdfUgowxFXkEKbhTd1Sr+klcDQqlaWeOCFTlV+YNObOnvXasHJj8dM5VwQ9gzFDBQ
 Kb9+E6HSa4AjR9Q==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 24 Dec 2025 16:32:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8341

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/layers.rst | 31 ++++++++++++++++---------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/documentation/dev-manual/layers.rst b/documentation/dev-manual/layers.rst
index 15d54cc02..49e17c0fb 100644
--- a/documentation/dev-manual/layers.rst
+++ b/documentation/dev-manual/layers.rst
@@ -279,7 +279,7 @@ following list:
    repository that use the ``meta-layer_name`` format.
 
 -  *Group Your Layers Locally:* Clone your repository alongside other
-   cloned ``meta`` directories from the :term:`Source Directory`.
+   layers in your :term:`Source Directory`.
 
 Making Sure Your Layer is Compatible With Yocto Project
 =======================================================
@@ -518,10 +518,10 @@ possible.
 Overlaying a File Using Your Layer
 ----------------------------------
 
-As an example, consider the main formfactor recipe and a corresponding
-formfactor append file both from the :term:`Source Directory`.
+As an example, consider the main ``formfactor`` recipe and a corresponding
+``formfactor`` append file both from :term:`OpenEmbedded-Core (OE-Core)`.
 Here is the main
-formfactor recipe, which is named ``formfactor_0.0.bb`` and located in
+``formfactor`` recipe, which is named ``formfactor_0.0.bb`` and located in
 the "meta" layer at ``meta/recipes-bsp/formfactor``::
 
    SUMMARY = "Device formfactor information"
@@ -598,8 +598,8 @@ Installing Additional Files Using Your Layer
 --------------------------------------------
 
 As another example, consider the main ``xserver-xf86-config`` recipe and a
-corresponding ``xserver-xf86-config`` append file both from the :term:`Source
-Directory`.  Here is the main ``xserver-xf86-config`` recipe, which is named
+corresponding ``xserver-xf86-config`` append file both from
+:term:`OpenEmbedded-Core (OE-Core)`.  Here is the main ``xserver-xf86-config`` recipe, which is named
 ``xserver-xf86-config_0.1.bb`` and located in the "meta" layer at
 ``meta/recipes-graphics/xorg-xserver``::
 
@@ -886,7 +886,9 @@ Add your layer by using the ``bitbake-layers add-layer`` command::
 Here is an example that adds a
 layer named ``meta-scottrif`` to the configuration file. Following the
 command that adds the layer is another ``bitbake-layers`` command that
-shows the layers that are in your ``bblayers.conf`` file::
+shows the layers that are in your ``bblayers.conf`` file:
+
+.. code-block:: console
 
    $ bitbake-layers add-layer meta-scottrif
    NOTE: Starting bitbake server...
@@ -894,14 +896,13 @@ shows the layers that are in your ``bblayers.conf`` file::
    Parsing of 1441 .bb files complete (0 cached, 1441 parsed). 2055 targets, 56 skipped, 0 masked, 0 errors.
    $ bitbake-layers show-layers
    NOTE: Starting bitbake server...
-   layer                 path                                      priority
-   ==========================================================================
-   meta                  /home/scottrif/poky/meta                  5
-   meta-poky             /home/scottrif/poky/meta-poky             5
-   meta-yocto-bsp        /home/scottrif/poky/meta-yocto-bsp        5
-   workspace             /home/scottrif/poky/build/workspace       99
-   meta-scottrif         /home/scottrif/poky/build/meta-scottrif   6
-
+   layer                 path                                                        priority
+   ==========================================================================================
+   meta                  /home/scottrif/project/layers/openembedded-core/meta           5
+   meta-poky             /home/scottrif/project/layers/meta-yocto/meta-poky             5
+   meta-yocto-bsp        /home/scottrif/project/layers/meta-yocto/meta-yocto-bsp        5
+   workspace             /home/scottrif/project/build/workspace                         99
+   meta-scottrif         /home/scottrif/project/build/meta-scottrif                     6
 
 Adding the layer to this file
 enables the build system to locate the layer during the build.

-- 
2.51.0


