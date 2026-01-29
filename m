Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FD4D6103B
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.17187.1769700250644824682
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=DLMOSOcv;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 215E54E4231D
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E69CE606FD;
	Thu, 29 Jan 2026 15:24:08 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1FDEC119A8856;
	Thu, 29 Jan 2026 16:24:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700248; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=VpQz2X9a1/mJo9P8xhWGzblvjXHHwYgnSxuE76JQgm4=;
	b=DLMOSOcv+PcdkPemGT88hXXM8fsqZb3RQC+zVP400BWdRKaK0ljVDEqa8s/uzy9XzyH0y3
	YlewTuJrfF+bmUdVknYKthycNtcxmiVa3SNcU4otLU7j1DuWNPZ49f6HLFjV90VYdJwsgF
	oFKLf0tQ202e2KVIrB0/EY5XCWMBhTARgMDX6oTRa+3wXodcxQKhQdtFtf98/CpoaA5BVn
	eoRNl9CcPSWSNndMOucdYS0gThflJ6HIIN1mg7KsaSSZ3ViNDrQDhdOXZ7ATvwgGC505zT
	KX+ridtV9kUAUKt81SwDo/0EQScMSkgie1/iBBkRbKvoXJ6YpjrtUDU6ZGsivQ==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:59 +0100
Subject: [PATCH v3 08/57] dev-manual/debugging.rst: remove obsolete poky
 repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-8-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>, 
 Quentin Schulz <quentin.schulz@cherry.de>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3114;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=Q1Jab2vkTEJhjQAE57aYSWn2KYo23aMy8ev/8mZyUAM=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uK8vy8UxiqgmntYuwyR/R3+urRi8H6s6HVO
 q0BDo7SqgCJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 NoIaD/93UqrBRBz9wU7LwvDj/Dw02g6XOF+7qU1uA56EGAKA5rn5MvCPewvmnSz4tqeOnolKyp1
 QQPu4l00zYkVAwrHGBTRtBlR/DkGc7McykkkRdzOaann0AiyY5bC2AhHwutrBtYDwdWoKPXOTRL
 2GFWBHwR7Lukdg+PLwRCJkCRVM5gJrxz5nbD4v/vbq0GvvikHjwtfY345EYylEdKviLcg3JYxPz
 epH6qzda/mo6e7FVID13eS9JfTaHGNLRGfUb9189PX/dGaL1gmomdtHk/KzFsAUoFJpwhTB8fem
 8edJ98RX4dLutwGYvkXhVTkAiNHUx1VRGCqH7k/GLr2RHtqBYUt4PvgwGw8BFmKRp5ffKRcnMkl
 vMdSfEjgmwMvnqNl/Ycs8P0BWPMvlcFFnmPH9l08o/yC1/hp4BOrBdBFrUwZIr5px7rVNYV24G1
 LjJ5dadvo/B9v/1B5UoZ+IA1jjrZFZyIdpmQuHOj9ohhWnSlFnpwr3RDDGVOenEJhuS6kfPRsqb
 SIq0s8MdwqrpKw+6TofsdzxuHR1BhX2q++fx9qSN5CtZZxu6So3BNapt++KGreZqdHOr4xkfJFW
 Pcbhi/MwuGUOT+zscfasFwwbbh0YkBx7HVVwQSqR5+GMkySInJemqiL3gineEdNmfp8dDiVd7u1
 FFaDwI7rnwf6qig==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8794

Remove references to the Poky repository, replace by OpenEmbedded-Core.

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/dev-manual/debugging.rst | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 0202f1b32..21fb10537 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -439,7 +439,7 @@ the build system to run the task again.
 
    For an example of a commit that makes a cosmetic change to invalidate
    shared state, see this
-   :yocto_git:`commit </poky/commit/meta/classes/package.bbclass?id=737f8bbb4f27b4837047cb9b4fbfe01dfde36d54>`.
+   :oe_git:`commit </openembedded-core/commit/meta/classes/package.bbclass?id=30064a98dc9049db4a37f119d15fbb59aa3c8377>`.
 
 Running Specific Tasks
 ======================
@@ -522,7 +522,7 @@ task dependency mechanisms.
 
    .. code-block:: none
 
-      WARNING: /home/ulf/poky/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
+      WARNING: /home/ulf/openembedded-core/meta/recipes-sato/matchbox-desktop/matchbox-desktop_2.1.bb.do_compile is tainted from a forced run
 
 
    The purpose of the warning is to let you know that the work directory
@@ -615,7 +615,7 @@ The same logging functions are also available in shell functions, under
 the names ``bbplain``, ``bbnote``, ``bbdebug``, ``bbwarn``, ``bberror``,
 and ``bbfatal``. The :ref:`ref-classes-logging` class
 implements these functions. See that class in the ``meta/classes``
-folder of the :term:`Source Directory` for information.
+folder of :term:`OpenEmbedded-Core (OE-Core)` for information.
 
 Logging With Python
 -------------------
@@ -852,10 +852,10 @@ patch::
    Refreshed patch patches/parallelmake.patch
 
 Once the patch file is created, you need to add it back to the originating
-recipe folder. Here is an example assuming a top-level
-:term:`Source Directory` named ``poky``::
+recipe folder. Here is an example assuming :term:`OpenEmbedded-Core (OE-Core)`
+is named ``openembedded-core``::
 
-   $ cp patches/parallelmake.patch poky/meta/recipes-connectivity/neard/neard
+   $ cp patches/parallelmake.patch openembedded-core/meta/recipes-connectivity/neard/neard
 
 The final thing you need to do to implement the fix in the build is to
 update the "neard" recipe (i.e. ``neard-0.14.bb``) so that the
@@ -940,7 +940,9 @@ debug symbols from the server.
 To run a ``debuginfod`` server, you need to do the following:
 
 -  Ensure that ``debuginfod`` is present in :term:`DISTRO_FEATURES`
-   (it already is in ``OpenEmbedded-core`` defaults and ``poky`` reference distribution).
+   (it already is in :term:`OpenEmbedded-Core (OE-Core)` defaults and
+   :term:`Poky` reference distribution).
+
    If not, set in your distro config file or in ``local.conf``::
 
       DISTRO_FEATURES:append = " debuginfod"

-- 
2.52.0


