Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2ECFED61022
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17184.1769700246763857554
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:07 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=aTjePA69;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 993DFC22F47;
	Thu, 29 Jan 2026 15:24:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 80403606FD;
	Thu, 29 Jan 2026 15:24:04 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C687B119A868D;
	Thu, 29 Jan 2026 16:24:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700244; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wjl4d53mc6wCO/qGfxZ93rzrOZHOvIp3vm+zpMsjDDE=;
	b=aTjePA69fCKTEdr2KI+oEbUEP6cVrFmVjxUeFJA0oVzwGHH5DH3ytUB1qaFyK6WMSyCh1O
	lOE/HnYm6Ll8xq/XMsxSIbkv9ZK0KwBkBygVIcQnLDbMN7KjQ5BCxwywLMY1qpm5KQdqOK
	womRomISPBfmHlSxLYi/3W3MEuoaghequHpzDZ7qol7hFvzxkoR5/9JnTPSggVemlPhQjD
	ZAKaCTDP0j7CYBGAJr6AlvCnU6k4MebZnE7cVuMYaGJ+l1NxlSDQaxR5XUKicL3VFdNTqc
	IWMm07KFUtveLKBjvx4ge+OAuJFK1dfbyKEdaflooCs/P9b9g/xcEaMg2B5uSg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:52 +0100
Subject: [PATCH v3 01/57] transitioning-to-a-custom-environment.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-1-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3401;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=0F4IHnBzDvWpK8t8LkLBteRlMMQt3d8H4EbekxMvrKY=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uJ6tLEFTYtwXoLkDEYAEMNTICRg+rh9DiXk
 YD+BdBM0AeJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7iQAKCRDRgEFAKaOo
 Np2FD/4hlKWYY8XpPxthWiW838RM1h/kxuyLgMNq7KCeZCuSwBYQnRa/eaN8eVQoetMv6PXbTS5
 1IhQSHzoiTp8nAl2bRaopizhB9h6rsTxhovQtjr6UBM3A/pOFjrpOUUZ35NqP1vPpB7yuzkvnDd
 f1E0BmFcRgJDYAoNFXEohSaT5lg3rkW4e72Zeyxm8l2Xe3ou9x/MtVfF+xrMffIzJ9x1HFoC6w/
 48ZyRLpn7Yn6iPBZc0iMKm5iQgfq0TZYiRo6EiakBO9giJCLaMySI3C0yaevF7brrUSc3cOO77l
 ptSCPt/IJ3yxCW+q6/noqZ05Q77hQbrcaL25wxn9XVOoCatfSpQD0cHJIGW80fFK0eYU+pHNotV
 P37d1ZQ9PONojH+1a1Zoj0Z+Ohrxy5fzlJ71zzOLuGVxBkIpZkNrQ+++dSURREwTSfLSMLY7jy6
 WkwEaLJt8MerBIVEnTf3grBjsT1CskYgJv8uzrVIcEPCOszU4Wz/9KW44sdzm3bAbuImezU7p3E
 k/rZLhTX+HjLvso3FFd1UQnGw3HjJL7o7bbqiBVlVC9Wi66cAq+u8xgJFGtEUywevMsXEEtWGat
 a33fijmzQLTQWOXM07mihvnCYkHGCFUJ1kdysrx8krk6yDM1pNJG6RH3hFVnUnUzE7E1kPOQj1s
 FbQ8hgdPZx9PDNg==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8786

- Use :term: for Poky.
- Mention use of fragments instead of local.conf.
- Remove Yocto < 2.4 reference.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 .../transitioning-to-a-custom-environment.rst          | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index a5f55c567..e292399f4 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -39,7 +39,7 @@ Transitioning to a custom environment for systems development
    that you've downloaded. Be aware that some BSPs may not be immediately
    supported on the very latest release, but they will be eventually.
 
-   You might want to start with the build specification that Poky provides
+   You might want to start with the build specification that :term:`Poky` provides
    (which is reference embedded distribution) and then add your newly chosen
    layers to that. Here is the information :ref:`about adding layers
    <dev-manual/layers:Understanding and Creating Layers>`.
@@ -48,16 +48,14 @@ Transitioning to a custom environment for systems development
    configuration**.
    For instance, you've chosen a machine type and added in the corresponding BSP
    layer. You'll then need to change the value of the :term:`MACHINE` variable in your
-   configuration file (build/local.conf) to point to that same machine
-   type. There could be other layer-specific settings you need to change as
-   well. Each layer has a ``README`` document that you can look at for this type of
-   usage information.
+   configuration (using the :ref:`ref-fragments-builtin-core-machine`
+   fragment) to point to that same machine type. There could be other
+   layer-specific settings you need to change as well. Each layer has a
+   ``README`` document that you can look at for this type of usage information.
 
 #. **Add a new layer for any custom recipes and metadata you create**.
-   Use the ``bitbake-layers create-layer`` tool for Yocto Project 2.4+
-   releases. If you are using a Yocto Project release earlier than 2.4, use the
-   ``yocto-layer create`` tool. The ``bitbake-layers`` tool also provides a number
-   of other useful layer-related commands. See
+   Use the ``bitbake-layers create-layer`` command. The ``bitbake-layers`` tool
+   also provides a number of other useful layer-related commands. See
    :ref:`dev-manual/layers:creating a general layer using the
    \`\`bitbake-layers\`\` script` section.
 
@@ -99,7 +97,7 @@ Transitioning to a custom environment for systems development
 
    Distribution settings define the packaging back-end (e.g. rpm or other) as
    well as the package feed and possibly the update solution. You would create
-   your own distribution in a new layer inheriting from Poky but overriding what
+   your own distribution in a new layer inheriting from :term:`Poky` but overriding what
    needs to change for your distribution. If you find yourself adding a lot of
    configuration to your local.conf file aside from paths and other typical
    local settings, it's time to :ref:`consider creating your own distribution

-- 
2.52.0


