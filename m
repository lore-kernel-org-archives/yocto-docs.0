Return-Path: <pbarker.renesas@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 417A5C4332F
	for <webhook@archiver.kernel.org>; Wed,  8 Nov 2023 16:28:48 +0000 (UTC)
Received: from relmlie5.idc.renesas.com (relmlie5.idc.renesas.com [210.160.252.171])
 by mx.groups.io with SMTP id smtpd.web11.18512.1699460920471460382
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Nov 2023 08:28:40 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: bp.renesas.com, ip: 210.160.252.171, mailfrom: paul.barker.ct@bp.renesas.com)
X-IronPort-AV: E=Sophos;i="6.03,286,1694703600"; 
   d="scan'208";a="182201512"
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 09 Nov 2023 01:28:38 +0900
Received: from GBR-5CG2373LKG.adwin.renesas.com (unknown [10.226.92.94])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id C783B40104DB;
	Thu,  9 Nov 2023 01:28:37 +0900 (JST)
From: Paul Barker <paul.barker.ct@bp.renesas.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <paul.barker.ct@bp.renesas.com>
Subject: [PATCH] ref-manual: Fix reference to MIRRORS/PREMIRRORS defaults
Date: Wed,  8 Nov 2023 16:28:35 +0000
Message-Id: <20231108162835.4405-1-paul.barker.ct@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Nov 2023 16:28:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4610

After the following meta-yocto commits, MIRRORS & PREMIRRORS are no
longer set in the poky distro config file:

  67b79df4fbff ("poky.conf: remove redundant MIRRORS")
  1b71a3b9418f ("poky: Drop PREMIRRORS entries for scms")

Signed-off-by: Paul Barker <paul.barker.ct@bp.renesas.com>
---
 documentation/ref-manual/variables.rst | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 12889a508577..b394d310990b 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5347,9 +5347,8 @@ system and gives an overview of their function and contents.
       :term:`PREMIRRORS`, the upstream source, and then
       locations specified by :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`MIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`MIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
    :term:`MLPREFIX`
       Specifies a prefix has been added to :term:`PN` to create a
@@ -6647,9 +6646,8 @@ system and gives an overview of their function and contents.
       source, and then locations specified by
       :term:`MIRRORS` in that order.
 
-      Assuming your distribution (:term:`DISTRO`) is "poky",
-      the default value for :term:`PREMIRRORS` is defined in the
-      ``conf/distro/poky.conf`` file in the ``meta-poky`` Git repository.
+      The default value for :term:`PREMIRRORS` is defined in the
+      ``meta/classes-global/mirrors.bbclass`` file in the core metadata layer.
 
       Typically, you could add a specific server for the build system to
       attempt before any others by adding something like the following to

base-commit: 897d5017eae6b3af2d5d489fc4e0915d9ce21458
-- 
2.39.2


