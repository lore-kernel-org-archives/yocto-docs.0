Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94985D61033
	for <webhook@archiver.kernel.org>; Thu, 29 Jan 2026 15:24:18 +0000 (UTC)
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.17088.1769700249233564193
 for <docs@lists.yoctoproject.org>;
 Thu, 29 Jan 2026 07:24:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=LK6eFv7P;
 spf=pass (domain: bootlin.com, ip: 185.171.202.116, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 9AC8AC22F47
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:10 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 96BF0606FD
	for <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F2331119A8853;
	Thu, 29 Jan 2026 16:24:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769700247; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=aalmdJwSS4yLbioFayyEDwxcGdCJZrwXg3DlXqPK1lk=;
	b=LK6eFv7PTasawSGPvUnM95flWAmDqx/oFdy6/zqeokb1SXxdIO540ycKe7YPnNCDVI+onk
	Eg7tzpaXLzlgaDps4cH6H8gEZDIEu8XiuQfcXwiqiAKYczc7xiZSMy+XlOL/5IEzRrFDGr
	VztyQ7cGawBLmbwa1mtJkXLzH3c0n1RfxTfxTntf210ebcsljDmpIpn2J4FDItyko4PMPP
	PpiekuM3+vroWTMJw1uhiwNGlrJYmN5qp3gc0H+LnbR4mAWVa4T6zP7+4pwO5LqoUx99gN
	Dvkz16maErp0EL6Zo6qvDhqv+Gv1rXayjGrMEflUTEPIhhLcDia3Ra87pl8ecg==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Thu, 29 Jan 2026 16:22:57 +0100
Subject: [PATCH v3 06/57] contributor-guide/submit-changes.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260129-remove-poky-references-v3-6-804acc3d9b7a@bootlin.com>
References: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
In-Reply-To: <20260129-remove-poky-references-v3-0-804acc3d9b7a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6375;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=TNQdQZokhHUSO7oHJ757hNlJdO6WEQn6epJXAkrREPk=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpe3uKCAwfbYYahnu4jrFeeEcZwiL6albPYmy79
 Kwt6XzhX0+JAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXt7igAKCRDRgEFAKaOo
 Nu5xD/0W4AwXm5Q+zrXY0WM+HPc5wMomBT18j8AhDdLm8V0FluHmzQCNGUWFwPzzFocpVRR5HMb
 OZwjUjmy39pOL6+Y/aD1WU52rVMsgTn/sat113oHCQCa9C3HCtLgKKQT7/rB0C4n96eX+vByZLb
 zsKX/9lGTYhfN3/tkgDtb8l0eeRR0c/x7A/4uUdgk3UDTxeJrtgZP5ipoYOq+3CUwgm1GK3FpaD
 WA6TWqZOrEvz8Nfx3mvczZvvhfdsXHtTG7uSAjXDYR2DbEg87s983LYEKm73aJSbXCucb5obzS8
 CK6I1vR7oR9hxiMXKhiX4sT+/gGsWmg4XGDk2aju4aXP2L1ywYHoqQXT2T2TBv28Q/ZcFL5JBe2
 UYomLP8J94n5PHAnQnQIyllEsurNTWFsn18Tb/wc4CAsDSskt781EbAevDdoniVndJJe3l2PRBG
 S66LInsONQeBB0KI7h0qNj5Z0SJq+yQ4OPZTUzx8mLHXDhphfUdnrENUgolw3tcEo1SAxNwATv7
 YFevQskhfKmjFfL7Jbjt0VNpZwh2aqudPwtJcpib/ZhPjxaXHDJbqmfFk/3NkqhZEp7CVrheLVL
 k2fBE3tztGCzY9Tt5fzXGakkJ7gVpRJXI6PqFMHzDZZuVr4Te9vQ6pxkFT4xYsBTiFphWj3awQp
 Jhlu85RE24XVhzw==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 29 Jan 2026 15:24:18 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8792

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 60 ++++++----------------
 1 file changed, 16 insertions(+), 44 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 07989d7b6..089fec02a 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -429,38 +429,8 @@ and then based on successful testing, merges them.
 In general, each component (e.g. layer) should have a ``README`` file
 that indicates where to send the changes and which process to follow.
 
-The "poky" repository, which is the Yocto Project's reference build
-environment, is a hybrid repository that contains several individual
-pieces (e.g. BitBake, Metadata, documentation, and so forth) built using
-the combo-layer tool. The upstream location used for submitting changes
-varies by component:
-
--  *Core Metadata:* Send your patches to the
-   :oe_lists:`openembedded-core </g/openembedded-core>`
-   mailing list. For example, a change to anything under the ``meta`` or
-   ``scripts`` directories should be sent to this mailing list.
-
--  *BitBake:* For changes to BitBake (i.e. anything under the
-   ``bitbake`` directory), send your patches to the
-   :oe_lists:`bitbake-devel </g/bitbake-devel>`
-   mailing list.
-
--  *meta-poky* and *meta-yocto-bsp* trees: These trees contain Metadata. Use the
-   :yocto_lists:`poky </g/poky>` mailing list.
-
--  *Documentation*: For changes to the Yocto Project documentation, use the
-   :yocto_lists:`docs </g/docs>` mailing list.
-
-For changes to other layers and tools hosted in the Yocto Project source
-repositories (i.e. :yocto_git:`git.yoctoproject.org <>`), use the
-:yocto_lists:`yocto-patches </g/yocto-patches/>` general mailing list.
-
-For changes to other layers hosted in the OpenEmbedded source
-repositories (i.e. :oe_git:`git.openembedded.org <>`), use
-the :oe_lists:`openembedded-devel </g/openembedded-devel>`
-mailing list, unless specified otherwise in the layer's ``README`` file.
-
-If you intend to submit a new recipe that neither fits into the core Metadata,
+If you intend to submit a new recipe that neither fits in
+:term:`OpenEmbedded-Core (OE-Core)`,
 nor into :oe_git:`meta-openembedded </meta-openembedded/>`, you should
 look for a suitable layer in https://layers.openembedded.org. If similar
 recipes can be expected, you may consider :ref:`dev-manual/layers:creating your own layer`.
@@ -620,7 +590,7 @@ have been followed:
    methods to find out:
 
    -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
-      located in the :term:`Source Directory` at
+      located in :term:`OpenEmbedded-Core (OE-Core)` at
       ``meta/conf/distro/include``, to see who is responsible for code.
 
    -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
@@ -645,9 +615,8 @@ have been followed:
    The Yocto Project provides two scripts that conveniently let you
    generate and send pull requests to the Yocto Project. These scripts
    are ``create-pull-request`` and ``send-pull-request``. You can find
-   these scripts in the ``scripts`` directory within the
-   :term:`Source Directory` (e.g.
-   ``poky/scripts``).
+   these scripts in the ``scripts`` directory within
+   :term:`OpenEmbedded-Core (OE-Core)`.
 
    Using these scripts correctly formats the requests without
    introducing any whitespace or HTML formatting. The maintainer that
@@ -660,7 +629,7 @@ have been followed:
    directory into which you pushed the change, and provides a subject
    line in the created patch files::
 
-      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
+      $ ./scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
 
    Running this script forms ``*.patch`` files in a folder named
    ``pull-``\ `PID` in the current directory. One of the patch files is a
@@ -673,7 +642,7 @@ have been followed:
    and email address. In this example, the email address is a mailing
    list::
 
-      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
+      $ ./scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
 
    You need to follow the prompts as the script is interactive.
 
@@ -682,8 +651,8 @@ have been followed:
       For help on using these scripts, simply provide the ``-h``
       argument as follows::
 
-              $ poky/scripts/create-pull-request -h
-              $ poky/scripts/send-pull-request -h
+              $ ./scripts/create-pull-request -h
+              $ ./scripts/send-pull-request -h
 
 Submitting Changes to Stable Release Branches
 =============================================
@@ -857,14 +826,17 @@ used testing branches for OpenEmbedded-Core are as follows:
    :oe_git:`openembedded-core </openembedded-core/>` repository and contains
    proposed changes to the core metadata.
 
--  *poky "master-next" branch:* This branch is part of the
-   :yocto_git:`poky </poky/>` repository and combines proposed
-   changes to BitBake, the core metadata and the poky distro.
+-  *bitbake "master-next" branch:* This branch is part of the :oe_git:`bitbake
+   </bitbake/>` repository and contains changes to :term:`BitBake`.
+
+-  *meta-yocto "master-next" branch:* This branch is part of the
+   :yocto_git:`meta-yocto </meta-yocto/>` repository and contains proposed
+   changes to meta-yocto.
 
 Similarly, stable branches maintained by the project may have corresponding
 ``-next`` branches which collect proposed changes. For example,
 ``&DISTRO_NAME_NO_CAP;-next`` and ``&DISTRO_NAME_NO_CAP_MINUS_ONE;-next``
-branches in both the "openembdedded-core" and "poky" repositories.
+branches in both the "openembedded-core" and "meta-yocto" repositories.
 
 Other layers may have similar testing branches but there is no formal
 requirement or standard for these so please check the documentation for the

-- 
2.52.0


