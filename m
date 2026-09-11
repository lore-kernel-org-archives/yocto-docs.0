Return-Path: <adrian.freihofer@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D3BFCC88E50
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 15:07:58 +0000 (UTC)
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.41752.1789139276786995718
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 08:07:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=adrian.freihofer@siemens.com header.s=fm1 header.b=E86CLTLt;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.64.225, mailfrom: fm-1329275-20260911150752794e3e613b000207b7-nzgae3@rts-flowmailer.siemens.com)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20260911150752794e3e613b000207b7
        for <docs@lists.yoctoproject.org>;
        Fri, 11 Sep 2026 17:07:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=adrian.freihofer@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=LUXxLOlv6EJBUsSy0H4NOLpnElJOtLkb0fTTXt5lFHQ=;
 b=E86CLTLtSUa1/CALovVaaRC3r6Hrz3+xMmIBhWgueMGOQ/ShzkBKSu0TfwkKUv5duWyfdg
 /F7FjMIyXx/xxarlNuq/W3VNM6EGSgR6ryN5ot3T6llhH1wdVhSfJ1kr8DVOEknCFNZjMXle
 mKBg04D6RCxrakl31QxZ3lpdqnMoKsR2SQryDz+Np4hohx/zO/wGrbhW1s2J/rRF0maGIxmN
 C2p1bQhaflLkJD/lNN2HuDjRHXrzl8CQU1g3X+56CD19UcnEdBDuNtuL/ziUU6wNiIfC8r82
 a0I3Zh4t3P1VG9iV0BktBI0ibAoKggLrGnRxFua/5WOgAsK0PeOnqW0g==;
From: AdrianF <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 1/4] dev-manual/devtool: fix non-patch local file handling docs
Date: Fri, 11 Sep 2026 17:07:47 +0200
Message-ID: <20260911150750.75697-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-1329275:519-21489:flowmailer
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 15:07:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10465

From: Adrian Freihofer <adrian.freihofer@siemens.com>

Non-patch ``file://`` entries in :term:`SRC_URI` no longer end up in an
``oe-local-files`` folder: that mechanism, along with ``S = WORKDIR``, was
removed in 5.1 (see migration-5.1.rst). Whether such files reach
``srctree`` now depends on :term:`S`: they land directly in ``srctree``
only if the recipe sets ``S = "${UNPACKDIR}"``; otherwise they are
unpacked into :term:`UNPACKDIR` outside of ``S`` and never reach
``srctree``, so they must be edited next to the recipe instead. Update
the ``devtool modify``/``extract``/``upgrade``/``finish`` descriptions
accordingly.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/dev-manual/devtool.rst | 91 +++++++++++++++++++---------
 1 file changed, 61 insertions(+), 30 deletions(-)

diff --git a/documentation/dev-manual/devtool.rst b/documentation/dev-manual/devtool.rst
index d67f22277..e84a13394 100644
--- a/documentation/dev-manual/devtool.rst
+++ b/documentation/dev-manual/devtool.rst
@@ -231,15 +231,27 @@ command:
       append file within the workspace while the recipe remains in its
       original location.
 
-      Additionally, if you have any non-patch local files (i.e. files
-      referred to with ``file://`` entries in :term:`SRC_URI` statement
-      excluding ``*.patch/`` or ``*.diff``), these files are copied to
-      an ``oe-local-files`` folder under the newly created source tree.
-      Copying the files here gives you a convenient area from which you
-      can modify the files. Any changes or additions you make to those
-      files are incorporated into the build the next time you build the
-      software just as are other changes you might have made to the
-      source.
+      Additionally, any non-patch local files (i.e. files referred to
+      with ``file://`` entries in the recipe's :term:`SRC_URI`
+      statement, excluding ``*.patch`` or ``*.diff`` files) only end up
+      in the extracted source tree if the recipe sets
+      ``S = "${UNPACKDIR}"``. In that case, they are unpacked directly
+      into the source tree at the same location as the upstream source,
+      mixed in with the rest of the unpacked source with no separate
+      area to identify them, so you need to check the recipe's
+      :term:`SRC_URI` to tell which files came from local ``file://``
+      entries. You can edit them directly in the source tree, and any
+      changes you make are incorporated into the build the next time
+      you build the software just as are other changes you might have
+      made to the upstream source.
+
+      If instead :term:`S` is a subdirectory of :term:`UNPACKDIR` (the
+      traditional default, e.g. ``S = "${UNPACKDIR}/${BP}"``), these
+      local files are unpacked into :term:`UNPACKDIR` but outside of
+      :term:`S`, so they never end up in the source tree at all. They
+      remain purely recipe-side, and are unpacked again into the
+      recipe's real :term:`WORKDIR` on every subsequent build regardless
+      of ``devtool modify``; edit them next to the recipe instead.
 
    -  *Middle*: The middle scenario in the figure represents a situation
       where the source code also does not exist locally. In this case,
@@ -260,8 +272,10 @@ command:
 
       As with all extractions, the command uses the recipe's :term:`SRC_URI`
       statements to locate the source files and any associated patch
-      files. Non-patch files are copied to an ``oe-local-files`` folder
-      under the newly created source tree.
+      files. Non-patch files only end up in ``srctree`` if the recipe
+      sets ``S = "${UNPACKDIR}"``; otherwise they are unpacked into
+      :term:`UNPACKDIR` but outside of :term:`S` and never reach
+      ``srctree`` at all.
 
       Once the files are located, the command by default extracts them
       into ``srctree``.
@@ -283,12 +297,15 @@ command:
 
          $ devtool modify -n recipe srctree
 
-      If an ``oe-local-files`` subdirectory happens to exist and it
-      contains non-patch files, the files are used. However, if the
-      subdirectory does not exist and you run the ``devtool finish``
-      command, any non-patch files that might exist next to the recipe
-      are removed because it appears to ``devtool`` that you have
-      deleted those files.
+      For a recipe that sets ``S = "${UNPACKDIR}"``, non-patch local
+      files are expected to already be present directly in ``srctree``
+      at the same location as the upstream source. If they are missing
+      there and you run the ``devtool finish`` command, any non-patch
+      files that might exist next to the recipe are removed because it
+      appears to ``devtool`` that you have deleted those files. This
+      does not apply if :term:`S` is a subdirectory of
+      :term:`UNPACKDIR`, since in that case the local files never lived
+      in ``srctree`` to begin with.
 
       Once the ``devtool modify`` command finishes, it creates only an
       append file for the recipe in the ``devtool`` workspace. The
@@ -356,9 +373,10 @@ command:
    Because there is no need to move the recipe, ``devtool finish``
    either updates the original recipe in the original layer or the
    command creates a ``.bbappend`` file in a different layer as provided
-   by layer. Any work you did in the ``oe-local-files`` directory is
-   preserved in the original files next to the recipe during the
-   ``devtool finish`` command.
+   by layer. If the recipe sets ``S = "${UNPACKDIR}"``, any changes you
+   made directly to local files in the source tree are written back to
+   the original files next to the recipe during the ``devtool finish``
+   command.
 
    As a final process of the ``devtool finish`` command, the state of
    the standard layers and the upstream source is restored so that you
@@ -811,14 +829,26 @@ The following diagram shows the common development flow used with the
    the new version of the recipe, and an append file all within the
    workspace.
 
-   Additionally, if you have any non-patch local files (i.e. files
-   referred to with ``file://`` entries in :term:`SRC_URI` statement
-   excluding ``*.patch/`` or ``*.diff``), these files are copied to an
-   ``oe-local-files`` folder under the newly created source tree.
-   Copying the files here gives you a convenient area from which you can
-   modify the files. Any changes or additions you make to those files
-   are incorporated into the build the next time you build the software
-   just as are other changes you might have made to the source.
+   Additionally, any non-patch local files (i.e. files referred to with
+   ``file://`` entries in the recipe's :term:`SRC_URI` statement,
+   excluding ``*.patch`` or ``*.diff`` files) only end up in the
+   extracted source tree if the recipe sets ``S = "${UNPACKDIR}"``. In
+   that case, they are unpacked directly into the source tree at the
+   same location as the upstream source, mixed in with the rest of the
+   unpacked source with no separate area to identify them, so you need
+   to check the recipe's :term:`SRC_URI` to tell which files came from
+   local ``file://`` entries. You can edit them directly in the source
+   tree, and any changes you make are incorporated into the build the
+   next time you build the software just as are other changes you might
+   have made to the upstream source.
+
+   If instead :term:`S` is a subdirectory of :term:`UNPACKDIR` (the
+   traditional default, e.g. ``S = "${UNPACKDIR}/${BP}"``), these local
+   files are unpacked into :term:`UNPACKDIR` but outside of :term:`S`,
+   so they never end up in the source tree at all. They remain purely
+   recipe-side, and are unpacked again into the recipe's real
+   :term:`WORKDIR` on every subsequent build regardless of
+   ``devtool upgrade``; edit them next to the recipe instead.
 
 #. *Resolve any Conflicts created by the Upgrade*: Conflicts could happen
    after upgrading the software to a new version. Conflicts occur
@@ -877,8 +907,9 @@ The following diagram shows the common development flow used with the
    resets the recipe so that the recipe is built normally rather than
    from the workspace.
 
-   Any work you did in the ``oe-local-files`` directory is preserved in
-   the original files next to the recipe during the ``devtool finish``
+   If the recipe sets ``S = "${UNPACKDIR}"``, any changes you made
+   directly to local files in the source tree are written back to the
+   original files next to the recipe during the ``devtool finish``
    command.
 
    If you specify a destination layer that is the same as the original
-- 
2.55.0


