Return-Path: <antonin.godard@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19E05CA6C95
	for <webhook@archiver.kernel.org>; Tue, 27 Jan 2026 08:19:36 +0000 (UTC)
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6043.1769501966422730209
 for <docs@lists.yoctoproject.org>;
 Tue, 27 Jan 2026 00:19:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bootlin.com header.s=dkim header.b=egKZ2m6Q;
 spf=pass (domain: bootlin.com, ip: 185.246.85.4, mailfrom: antonin.godard@bootlin.com)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D39D74E422CB
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A9215606F5
	for <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:24 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D8DEA119A867D;
	Tue, 27 Jan 2026 09:19:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769501964; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Xb/KqyYu1ExfKY3vJItZ6N6ZJAxYNUVj9wTw/x+Le+Y=;
	b=egKZ2m6QggWUjIAQrI4LsMTfF0B9E2ryGSUgE42x0H3kTBL6GHPLg6ZJc5wPE3shf2R9/5
	I9NjWcdiozG/8cGoKTH5kAAHHXLFq2/5xyw/pSvdghFbkHBzzbWBrqTnd1ZqRanzdwfTlr
	x80H09eSF6qviZSxgWIE6uCcJPoVegjF8ekv+ulwIwZUPISaG9BVW5iZ4XKGiLqBGQuud8
	+QOZJ6PfEZPmp1ZfvBQ9IY+iYcgqN/Fs+VaILgjDbRAabwObJ3plMfNussg4O1vFaWNtrb
	jAU+ZA2+bad4kgcTkW19ZVpKxSgGYhXYP7pOBydZDnONG+DW1Bisu3EA63qIaA==
From: Antonin Godard <antonin.godard@bootlin.com>
Date: Tue, 27 Jan 2026 09:19:01 +0100
Subject: [PATCH v2 06/56] contributor-guide/submit-changes.rst: remove
 obsolete poky repo references
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-remove-poky-references-v2-6-74bf80cc4e5a@bootlin.com>
References: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
In-Reply-To: <20260127-remove-poky-references-v2-0-74bf80cc4e5a@bootlin.com>
To: docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Antonin Godard <antonin.godard@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6180;
 i=antonin.godard@bootlin.com; h=from:subject:message-id;
 bh=aicEIiy9GfDZkO1Sop+H2C1lBMphjpLrdsO0zVXUGtw=;
 b=owEBbQKS/ZANAwAKAdGAQUApo6g2AcsmYgBpeHT/qXrBY7GllsZZvADFJCAYsdpE+xrfo0GjU
 2bVtqNeTWqJAjMEAAEKAB0WIQSGSHJRiN1AG7mg0//RgEFAKaOoNgUCaXh0/wAKCRDRgEFAKaOo
 NuA0D/9J07T4T740H3l+ZOkBqpt5YdxwwkcSdo12wvhWTp2XB6p9X5YcSwCH8l69/tFlVd2zXv6
 oKNnUtJNn/ORBRrVooR+3sXyFH2oXGBLIZ38Cb4f3L5Bnd6RiLIsPdi69105Pj34KDpf1Nh7Cri
 ZAlJsyKU8OaT5Ob0t6OivRyZIwk83QgmeJSRs+T+bTgCDqedl+XIcB8c+W3iWxn2eTgFGiosSju
 LgWFox7JPyJ2PQIFEictnzaF4i9MhkDmRAZk8O6E+q+/Jb6BTVJzcQLF7UvZ2II8FIgDqE1IoWv
 yJGGtsx4ZPkHU2KmQU9pvC3juj/Wb4tdjJw/TwpkazaDzWellHvCK7XlFhx+cr/Dc/mQgBhnOHg
 M2FO7vlNrbOk/NQngZELh3JKIq9iwZYw+rgruw+WKIY/O5oH8PjYvki7ivuOjp5Ji9SHfhPyICK
 CwBLbIh+Ws978FQCOlmof2AsEQ4nB4oa8D0igSf21yG+wr5gMEl9nJXTMALrkYY2fMKu5KQMNmR
 79V+GNPBSI070+aELfllM+59gaTmooCu6ddcVHTPJs9ls9EDBMeSmlO9rLQLy5XNachzDsnSixm
 i1/iET0VLmhOnvdXsF9DSIfym1vxfmZNfM6zB4sV9f6JnI3SUUPAgRDRpXHMVENy8jD6Hee1wKj
 aw2HGJny0k7Y+tA==
X-Developer-Key: i=antonin.godard@bootlin.com; a=openpgp;
 fpr=8648725188DD401BB9A0D3FFD180414029A3A836
X-Last-TLS-Session-Version: TLSv1.3
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 27 Jan 2026 08:19:36 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8667

Remove references to the Poky repository, replace by OpenEmbedded-Core
in most cases.

Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/contributor-guide/submit-changes.rst | 57 ++++++----------------
 1 file changed, 14 insertions(+), 43 deletions(-)

diff --git a/documentation/contributor-guide/submit-changes.rst b/documentation/contributor-guide/submit-changes.rst
index 07989d7b6..4a4c60b41 100644
--- a/documentation/contributor-guide/submit-changes.rst
+++ b/documentation/contributor-guide/submit-changes.rst
@@ -429,37 +429,6 @@ and then based on successful testing, merges them.
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
 If you intend to submit a new recipe that neither fits into the core Metadata,
 nor into :oe_git:`meta-openembedded </meta-openembedded/>`, you should
 look for a suitable layer in https://layers.openembedded.org. If similar
@@ -620,7 +589,7 @@ have been followed:
    methods to find out:
 
    -  *Maintenance File:* Examine the ``maintainers.inc`` file, which is
-      located in the :term:`Source Directory` at
+      located in :term:`OpenEmbedded-Core (OE-Core)` at
       ``meta/conf/distro/include``, to see who is responsible for code.
 
    -  *Search by File:* Using :ref:`overview-manual/development-environment:git`, you can
@@ -645,9 +614,8 @@ have been followed:
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
@@ -660,7 +628,7 @@ have been followed:
    directory into which you pushed the change, and provides a subject
    line in the created patch files::
 
-      $ poky/scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
+      $ ./scripts/create-pull-request -u meta-intel-contrib -s "Updated Manual Section Reference in README"
 
    Running this script forms ``*.patch`` files in a folder named
    ``pull-``\ `PID` in the current directory. One of the patch files is a
@@ -673,7 +641,7 @@ have been followed:
    and email address. In this example, the email address is a mailing
    list::
 
-      $ poky/scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
+      $ ./scripts/send-pull-request -p ~/meta-intel/pull-10565 -t meta-intel@lists.yoctoproject.org
 
    You need to follow the prompts as the script is interactive.
 
@@ -682,8 +650,8 @@ have been followed:
       For help on using these scripts, simply provide the ``-h``
       argument as follows::
 
-              $ poky/scripts/create-pull-request -h
-              $ poky/scripts/send-pull-request -h
+              $ ./scripts/create-pull-request -h
+              $ ./scripts/send-pull-request -h
 
 Submitting Changes to Stable Release Branches
 =============================================
@@ -857,14 +825,17 @@ used testing branches for OpenEmbedded-Core are as follows:
    :oe_git:`openembedded-core </openembedded-core/>` repository and contains
    proposed changes to the core metadata.
 
--  *poky "master-next" branch:* This branch is part of the
-   :yocto_git:`poky </poky/>` repository and combines proposed
-   changes to BitBake, the core metadata and the poky distro.
+- *bitbake "master-next" branch:* This branch is part of the :oe_git:`bitbake
+  </bitbake/>` repository and contains changes to :term:`BitBake`.
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


