Return-Path: <peter.kjellerstedt@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC577C433EF
	for <webhook@archiver.kernel.org>; Wed, 23 Mar 2022 16:09:17 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.45.1648051755962929614
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Mar 2022 09:09:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=bdHgsqkm;
 spf=pass (domain: axis.com, ip: 195.60.68.17,
 mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1648051756;
  x=1679587756;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=qGHtfJtVBXFhC2riq3c21hvpdLe9AV7czoXWBQvVies=;
  b=bdHgsqkmXUP85neywUHKzwJROlpdOguBl4YtFYVD3Hmn7XpK3cfgXOBm
   1QDNdH8Mpbj9rjAMK6xXkalZWCmHKyuPN+FPYKG1OV/qwXOR5iCMLoe5V
   1Y4tntAaaaDWDY8MmJv6f9cB7WmomkIz/pYOSR9M2DzqmwJI0BQHFjA5R
   YsYPN2+Tie3QUvkk8wLuCM3+Doh+YIXP51pJqxtoFQ1sey7A8zVl+JOgP
   W7OQ56n3r5SixpkrqHbQn8LftKbVG/ZkMfJfT8nHh7+d72A6nUszV5pHa
   mYEoPrezRnrV8LiGXhtPDVGTPUNBTXNK3lBnYDfP8ZHC6YVGZg57/8dSi
   Q==;
From: Peter Kjellerstedt <pkj@axis.com>
To: <docs@lists.yoctoproject.org>
Subject: [PATCH] ref-manual: Remove references to AVAILABLE_LICENSES
Date: Wed, 23 Mar 2022 17:09:11 +0100
Message-ID: <20220323160911.6259-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Mar 2022 16:09:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2705

The AVAILABLE_LICENSES variable has been removed from OE-Core.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 documentation/ref-manual/variables.rst | 26 --------------------------
 1 file changed, 26 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 634f19a673..b5cfc335fb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -231,17 +231,6 @@ system and gives an overview of their function and contents.
       must set this variable in your recipe. The
       :ref:`syslinux <ref-classes-syslinux>` class checks this variable.
 
-   :term:`AVAILABLE_LICENSES`
-      List of licenses found in the directories specified by
-      :term:`COMMON_LICENSE_DIR` and
-      :term:`LICENSE_PATH`.
-
-      .. note::
-
-         It is assumed that all changes to :term:`COMMON_LICENSE_DIR` and
-         :term:`LICENSE_PATH` have been done before :term:`AVAILABLE_LICENSES`
-         is defined (in :ref:`ref-classes-license`).
-
    :term:`AVAILTUNES`
       The list of defined CPU and Application Binary Interface (ABI)
       tunings (i.e. "tunes") available for use by the OpenEmbedded build
@@ -3508,21 +3497,6 @@ system and gives an overview of their function and contents.
          remove dependencies on or provide alternatives to components that
          are required to produce a functional system image.
 
-      .. note::
-
-         It is possible to define a list of licenses that are allowed to be
-         used instead of the licenses that are excluded. To do this, define
-         a variable ``COMPATIBLE_LICENSES`` with the names of the licenses
-         that are allowed. Then define :term:`INCOMPATIBLE_LICENSE` as::
-
-                 INCOMPATIBLE_LICENSE = "${@' '.join(sorted(set(d.getVar('AVAILABLE_LICENSES').split()) - set(d.getVar('COMPATIBLE_LICENSES').split())))}"
-
-
-         This will result in :term:`INCOMPATIBLE_LICENSE` containing the names of
-         all licenses from :term:`AVAILABLE_LICENSES` except the ones specified
-         in ``COMPATIBLE_LICENSES``, thus only allowing the latter licenses to
-         be used.
-
    :term:`INHERIT`
       Causes the named class or classes to be inherited globally. Anonymous
       functions in the class or classes are not executed for the base

