Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84795C02190
	for <webhook@archiver.kernel.org>; Mon, 27 Jan 2025 09:58:39 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web11.48226.1737971913868044951
 for <docs@lists.yoctoproject.org>;
 Mon, 27 Jan 2025 01:58:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=gm1 header.b=SRnPICai;
 spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: antonin.godard@bootlin.com)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 75BBB60017;
	Mon, 27 Jan 2025 09:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737971912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3khD7R8/Dwn98sVBvqUOarLjk4elhFod9mU1IWpWCsc=;
	b=SRnPICaidTYIjkYnxBr898LxCh2YuLXXDza0r6CgBPPLG8wEDLvO2S8CVilqJW+HflEpYm
	EERGh3YYUPumIHkprBrWyu1zuY/5tsQDTfgZ3aF2G4MRrX0sqU9zc2B+IIy9D5BUOMG2uL
	o5Dj1AdxJdGsP9mBEgLsnMIE4VZ4E8qx1GpNS5Y0N4aJZoREL0RDxl2DIxLAuRI/zL0Fdc
	LwzsU+uYPZxVGdsTrHP7XAJcKJB/d1jcS67an00KbLfiUiQrFGLx7RJurN1DOnu5TOG9xe
	ekL4ZrXRVSACsQOJv7DF58HNRhRXIbF6tR2wj9T57WXgJOHgoE65gpZ7TygKMA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Mon, 27 Jan 2025 10:58:23 +0100
Subject: [yocto-docs][PATCH v3 2/2] dev-manual/devtool: remove reference to
 the extensible SDK
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250127-devtool-dev-manual-v3-2-0e7ed17cfde4@bootlin.com>
References: <20250127-devtool-dev-manual-v3-0-0e7ed17cfde4@bootlin.com>
In-Reply-To: <20250127-devtool-dev-manual-v3-0-0e7ed17cfde4@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3032;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=A40iDqO2OISQ2YEF1c8npywAOvqbva1dG74pH7BxOF8=;
 b=owEBbAKT/ZANAwAIAdGAQUApo6g2AcsmYgBnl1jHzWe8b2ecO68W+VunC0VUgj031r5GJGRZJ
 U6JLrVNrc+JAjIEAAEIAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCZ5dYxwAKCRDRgEFAKaOo
 NgnWD/jhLtBr7gUYuQUxpWEElGLt6BZyLSApJ6b0YdO1qsJCTrp4AcCbFpVoa8msjgnDGue7kul
 1KVsftothnzUCe/E9+jScfiSRUbg62TK/kQkQnoEU4aAXumrD1TjNqCnRbLLluJJsi9MR36gDCg
 7cYMqIXdSdcR0JALOsO+Xenkm+TGa2myuX0HGW/M3mAuIPdsakBMmJM+3ZrGdBe5ZCOo9gIfWaT
 a3z9y/tA21tDeZx2Z5qCSSQuq+3jOZkLtqdHoNbBQJjorhIyeE7wUF8fmvcSKBHjuV4PVeLxLK6
 OhwQto+GTeFTlqXneV+QOpMIDJgnKWdyKaqCjxnySw4bnppB15BM/1PuXE4+3dYM1HjNdfsDvc9
 BCXf+viDI3jYL0EK4805UqvJFcgoyuGaNSMgrKtA4tW5AHbvsz0rYaUUutYqg8LRZBn7zu/PmoI
 hlJBiW3YorhtskB7TbUjlT+J/cGw9+phI4amE33W9eQDPx4W/VoHDHhR1xstUCHSatqvtGLFSbc
 l5MyNdxI+ZivcukUfekTudDNaxocL0G2UJvtqP4K4NnYAj2r9Zyu83ISX7SLfUzDdkoJsyXpmsy
 aNXT2TpR5xAC7eNc1o/V2UE31/GIAxua+mubXXfdJC4W6JAoB2bhdjYku4yIDGuPI0L1UPiBaMu
 uJlj9j+vu4mSJ
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-GND-Sasl: antonin.godard@bootlin.com
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 27 Jan 2025 09:58:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6189

There were leftover references to the extensible SDK after moving the
devtool documentation from the Extensible SDK document to its own
devtool document.

This patch follows the bulk move to make it clear what was modified in
the document.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/devtool.rst | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index 2e3de7a0961a7a09b9c2a6217152f97636099a93..2f17d5093048d97e1679a06978a2c22400ee01e3 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -1046,7 +1046,8 @@ mind:
 
 -  The environment in which Make runs is set up with various standard
    variables for compilation (e.g. :term:`CC`, :term:`CXX`, and so forth) in a
-   similar manner to the environment set up by the SDK's environment
+   similar manner to the environment set up by an :ref:`SDK
+   <overview-manual/concepts:Application Development SDK>`'s environment
    setup script. One easy way to see these variables is to run the
    ``devtool build`` command on the recipe and then look in
    ``oe-logs/run.do_compile``. Towards the top of this file, there is
@@ -1132,9 +1133,6 @@ these behaviors ensure the reproducibility and integrity of the build.
       ``devtool add`` does not receive the other parts, which results in
       several "command not found" errors.
 
-   -  In order to support adding Node.js modules, a ``nodejs`` recipe
-      must be part of your SDK.
-
 As mentioned earlier, you can also add Node.js modules directly from a
 repository or local source tree. To add modules this way, use
 ``devtool add`` in the following form::
@@ -1242,10 +1240,8 @@ Recipes often need to use files provided by other recipes on the
 :term:`Build Host`. For example,
 an application linking to a common library needs access to the library
 itself and its associated headers. The way this access is accomplished
-within the extensible SDK is through the sysroot. There is one sysroot per
-"machine" for which the SDK is being built. In practical terms, this
-means there is a sysroot for the target machine, and a sysroot for
-the build host.
+is through the :term:`Sysroot`. There is a sysroot for the target machine, and a
+sysroot for the build host.
 
 Recipes should never write files directly into the sysroot. Instead,
 files should be installed into standard locations during the
@@ -1259,8 +1255,7 @@ remain free from stale files.
 Packaging
 ---------
 
-Packaging is not always particularly relevant within the extensible SDK.
-However, if you examine how build output gets into the final image on
+If you examine how build output gets into the final image on
 the target device, it is important to understand packaging because the
 contents of the image are expressed in terms of packages and not
 recipes.

-- 
2.47.0.2.g7caf9f4c55.dirty


