Return-Path: <paul.eggleton@linux.microsoft.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10689C43217
	for <webhook@archiver.kernel.org>; Mon, 11 Oct 2021 03:58:05 +0000 (UTC)
Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
 by mx.groups.io with SMTP id smtpd.web08.7222.1633924683542802023
 for <docs@lists.yoctoproject.org>;
 Sun, 10 Oct 2021 20:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linux.microsoft.com header.s=default header.b=QqkEilvw;
 spf=pass (domain: linux.microsoft.com, ip: 13.77.154.182,
 mailfrom: pauleg@linux.microsoft.com)
Received: by linux.microsoft.com (Postfix, from userid 1054)
	id D409220B85E6; Sun, 10 Oct 2021 20:58:02 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com D409220B85E6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1633924682;
	bh=zM3puXttBGwbRfAYZ13W/J2DjY5m+IQIcnt47UMmVYU=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=QqkEilvw6qq/0+nAkK/FXa5GnqY0HIlop/TFWXvNMzoyfXNWlcYmgGnsgd2AWGWqN
	 WRgVgX/F/BzOhuCS4xT43VYljxawWaRzjBy8xHEhOMSPGPlAZyERWOovKj5rMY8QFe
	 dVQtkOiVO2arqDcjmWvhrsrd8f4y2A9XOVAEFZvM=
From: Paul Eggleton <paul.eggleton@linux.microsoft.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/5] migration-3.4: tweak overrides change section
Date: Sun, 10 Oct 2021 20:57:53 -0700
Message-Id: 
 <6db100cdca46798555138ed205e82da03c3aad12.1633924455.git.paul.eggleton@linux.microsoft.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
References: <cover.1633924455.git.paul.eggleton@linux.microsoft.com>
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 11 Oct 2021 03:58:05 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1979

From: Paul Eggleton <paul.eggleton@microsoft.com>

Minor grammar and readability improvements.

Signed-off-by: Paul Eggleton <paul.eggleton@microsoft.com>
---
 documentation/migration-guides/migration-3.4.rst | 34 +++++++++++++-----------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index e83e936..3df5b69 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -7,17 +7,18 @@ Project 3.4 Release (codename "honister") from the prior release.
 Override syntax changes
 -----------------------
 
-This release requires changes to the metadata to indicate where overrides are
-being used in variable key names. This is done with the ``:`` character replacing
-the use of ``_`` previously. This means that an entry like::
+In this release, the ``:`` character replaces the use of ``_`` to
+refer to an override, most commonly when making a conditional assignment
+of a variable. This means that an entry like::
 
    SRC_URI_qemux86 = "file://somefile"
 
-becomes::
+now becomes::
 
    SRC_URI:qemux86 = "file://somefile"
 
-since ``qemux86`` is an override. This applies to any use of override syntax so::
+since ``qemux86`` is an override. This applies to any use of override
+syntax, so the following::
 
    SRC_URI_append = " file://somefile"
    SRC_URI_append_qemux86 = " file://somefile2"
@@ -29,7 +30,7 @@ since ``qemux86`` is an override. This applies to any use of override syntax so:
    SRCREV_pn-bash = "abc"
    BB_TASK_NICE_LEVEL_task-testimage = '0'
 
-becomes::
+would now become::
 
    SRC_URI:append = " file://somefile"
    SRC_URI:append:qemux86 = " file://somefile2"
@@ -63,8 +64,8 @@ suffix to variables in ``layer.conf`` files such as :term:`BBFILE_PATTERN`,
 may be the same as a :term:`DISTRO` override causing some confusion. We do
 plan to try and improve consistency as these issues are identified.
 
-To help with migration of layers there is a script in OE-Core. Once configured
-with the overrides used by a layer, this can be run as::
+To help with migration of layers, a script has been provided in OE-Core.
+Once configured with the overrides used by a layer, this can be run as::
 
    <oe-core>/scripts/contrib/convert-overrides.py <layerdir>
 
@@ -74,10 +75,13 @@ with the overrides used by a layer, this can be run as::
    expected to handle every case. In particular, it needs to be told which overrides
    the layer uses (usually machine and distro names/overrides) and the result should
    be carefully checked since it can be a little enthusiastic and will convert
-   references to ``_append``, ``_remove`` and ``_prepend`` in function and variables names.
-
-For reference, this conversion is important as it allows BitBake to know what is
-an override and what is not. This should allow us to proceed with other syntax
-improvements and simplifications for usability. It also means bitbake no longer
-has to guess and maintain large lookup lists just in case ``functionname`` in
-``my_functionname`` is an override and this should improve efficiency.
+   references to ``_append``, ``_remove`` and ``_prepend`` in function and variable
+   names.
+
+For reference, this conversion is important as it allows BitBake to more reliably
+determine what is an override and what is not, as underscores are also used in
+variable names without intending to be overrides. This should allow us to proceed
+with other syntax improvements and simplifications for usability. It also means
+BitBake no longer has to guess and maintain large lookup lists just in case
+e.g. ``functionname`` in ``my_functionname`` is an override, and thus should improve
+efficiency.
-- 
1.8.3.1


