Return-Path: <rpjday@crashcourse.ca>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8735ACD3447
	for <webhook@archiver.kernel.org>; Sat,  9 May 2026 21:00:30 +0000 (UTC)
Received: from cpanel10.indieserve.net (cpanel10.indieserve.net [199.212.143.9])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.19293.1778360426409011543
 for <docs@lists.yoctoproject.org>;
 Sat, 09 May 2026 14:00:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@crashcourse.ca header.s=default header.b=xtyLlWPN;
 spf=pass (domain: crashcourse.ca, ip: 199.212.143.9, mailfrom: rpjday@crashcourse.ca)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=crashcourse.ca; s=default; h=Content-Type:MIME-Version:Message-ID:Subject:
	To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jPqMbncP4PEeohgHUaLf0H1ScnUQ5X/VC0TF5flJB6Q=; b=xtyLlWPNuUfDJA7udn1OX97Pn3
	6u3LfvdXnW1V2qlJLtgZTh8vkTeRljUnOUYp9FomGt6v7r5mOjgKdhA49jjJ+XlLciu0sqIUN/kNC
	rimJD3Wiy/dD7JaUPOx3JG1frDoPzhkqjU1m15/ESh4y3CnWonj/Bk7MpsuVKs5VDV326HWY7m8pd
	tsHg7djdV+8o47s+rd4Gh0K5LiUycKDZmeVy1trbsCY9LrOmHPPz/KjxC5cWwrOfzF0RBiRdysVBJ
	ho1KW11AE4S4GRF2hNz2fOTE4qX41tiD7+qrmcJ/eeGj1DBu4mV21eheE+VOyVQbHXIOfnKYmSfBL
	/swaO9wA==;
Received: from pool-174-115-41-146.cpe.net.cable.rogers.com ([174.115.41.146]:53864 helo=rday)
	by cpanel10.indieserve.net with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.99.2)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1wLomc-00000000OvQ-2D9C
	for docs@lists.yoctoproject.org;
	Sat, 09 May 2026 17:00:23 -0400
Date: Sat, 9 May 2026 17:03:03 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: [PATCH] "Transitioning ..." doc: Various pedantic cleanups
Message-ID: <24eff5f0-982b-fd5a-4483-1d5b7ec40514@crashcourse.ca>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1277005933-1778360597=:622449"
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel10.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel10.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel10.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 May 2026 21:00:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9429

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1277005933-1778360597=:622449
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT


Tweaks:

  - grammer adjustments
  - hyphenation
  - monospace font for layer and file names

Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>

---

diff --git a/documentation/transitioning-to-a-custom-environment.rst b/documentation/transitioning-to-a-custom-environment.rst
index bc37345b9..c69ab5361 100644
--- a/documentation/transitioning-to-a-custom-environment.rst
+++ b/documentation/transitioning-to-a-custom-environment.rst
@@ -9,10 +9,10 @@ Transitioning to a custom environment for systems development
 .. note::

    So you've finished the :doc:`/brief-yoctoprojectqs/index` and
-   glanced over the document :doc:`/what-i-wish-id-known`, the latter contains
+   glanced over the document :doc:`/what-i-wish-id-known`, the latter containing
    important information learned from other users. You're well prepared. But
    now, as you are starting your own project, it isn't exactly straightforward what
-   to do. And, the documentation is daunting. We've put together a few hints to
+   to do, and the documentation is daunting. We've put together a few hints to
    get you started.

 #. **Make a list of the processor, target board, technologies, and capabilities
@@ -23,7 +23,7 @@ Transitioning to a custom environment for systems development
 #. **Set up your board support**.
    Even if you're using custom hardware, it might be easier to start with an
    existing target board that uses the same processor or at least the same
-   architecture as your custom hardware. Knowing the board already has a
+   architecture as your custom hardware. Knowing that the board already has a
    functioning Board Support Package (BSP) within the project makes it easier
    for you to get comfortable with project concepts.

@@ -34,19 +34,19 @@ Transitioning to a custom environment for systems development
    target board. The Yocto Project layer index BSPs are regularly validated. The
    best place to get your first BSP is from your silicon manufacturer or board
    vendor – they can point you to their most qualified efforts. In general, for
-   Intel silicon use meta-intel, for Texas Instruments use meta-ti, and so
+   Intel silicon use ``meta-intel``, for Texas Instruments use ``meta-ti``, and so
    forth. Choose a BSP that has been tested with the same Yocto Project release
    that you've downloaded. Be aware that some BSPs may not be immediately
    supported on the very latest release, but they will be eventually.

    You might want to start with the build specification that :term:`Poky` provides
-   (which is reference embedded distribution) and then add your newly chosen
+   (which is reference embedded distribution) and then add your newly-chosen
    layers to that. Here is the information :ref:`about adding layers
    <dev-manual/layers:Understanding and Creating Layers>`.

 #. **Based on the layers you've chosen, make needed changes in your
    configuration**.
-   For instance, you've chosen a machine type and added in the corresponding BSP
+   For instance, assume you've chosen a machine type and added in the corresponding BSP
    layer. You'll then need to change the value of the :term:`MACHINE` variable in your
    configuration (using the :ref:`ref-fragments-builtin-core-machine`
    fragment) to point to that same machine type. There could be other
@@ -65,8 +65,8 @@ Transitioning to a custom environment for systems development
    bsp layer using the \`\`bitbake-layers\`\` script>`. For example, given a
    64-bit x86-based machine, copy the conf/intel-corei7-64 definition and give
    the machine a relevant name (think board name, not product name). Make sure
-   the layer configuration is dependent on the meta-intel layer (or at least,
-   meta-intel remains in your bblayers.conf). Now you can put your custom BSP
+   the layer configuration is dependent on the ``meta-intel`` layer (or at least,
+   ``meta-intel`` remains in your ``bblayers.conf`` file). Now you can put your custom BSP
    settings into your layer and you can re-use it for different applications.

 #. **Write your own recipe to build additional software support that isn't
--8323329-1277005933-1778360597=:622449--

