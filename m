Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12F35C0219E
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 16:13:16 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.web11.3140.1739290394681533138
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 08:13:14 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=VqvK3fUb;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1thssr-0000wA-LU; Tue, 11 Feb 2025 11:13:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:References:In-Reply-To:Date:Subject:To:
	From; bh=oDFikmShqyiVtwYXqvB7xKycIzBnBUQ7I+KH+BP0GD8=; b=VqvK3fUbx2VyiI7KzBoZ
	q5Emb77ev52k71Zf3ZIk2pkyZ1nszRgllGsEwrjoc2mrau43pibOijYohiz6ABDVkD4gKXMgCzYv5
	aqL89dtNhIttRHfyIA1M9zyKa/S4E4nriBbxGlQh1HFN6XrywAOMWa2A+Y/htWE2GxArq0QThdt8n
	MXepT9fJLRxx+45c1/VvVyJFeIF/I3+eShDV/cnZwSVnWAexWqOoEiaBG1dUQS4znyYZ1HQE6BH8L
	Psx6FgAnBeUWqauSWwANsPQ0IXGUCno06K55e8GXO5N+i0NlBUvIjM/8R5OaMHH+eBK8HaoNiWM+P
	HliJXB/D4DIxxA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Antonin Godard <antonin.godard@bootlin.com>,
	Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v3 2/2] dev-manual/debugging: Add a "Backtraces or target" section
Date: Tue, 11 Feb 2025 17:12:39 +0100
Message-ID: <20250211161239.5396-3-othacehe@gnu.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250211161239.5396-1-othacehe@gnu.org>
References: <20250211161239.5396-1-othacehe@gnu.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 16:13:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6337

That section is presenting how to rely upon the minidebuginfo, and possibly
the PACKAGE_KEEP_DEBUG_FRAME variable to get backtraces on target.
---
 documentation/dev-manual/debugging.rst | 55 ++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/documentation/dev-manual/debugging.rst b/documentation/dev-manual/debugging.rst
index 92458a0c3..6fc0bc2d4 100644
--- a/documentation/dev-manual/debugging.rst
+++ b/documentation/dev-manual/debugging.rst
@@ -1199,6 +1199,61 @@ coredumps (commands ``coredumpctl list`` and ``coredumpctl info``).
 This feature was created by Fedora, see https://fedoraproject.org/wiki/Features/MiniDebugInfo for
 more details.
 
+Backtraces on target
+====================
+
+Some high level languages such as Python have an integrated backtrace system
+allowing to get the call-stack up to the failure on target. For C and C++
+programs though, there is no such thing and getting backtraces on the target
+involves some effort. To get human readable backtraces, you need three
+different components:
+
+- The symbols: it can only be function names if you consider the mechanism
+  described in the ":ref:`dev-manual/debugging:enabling minidebuginfo`"
+  section. If storage is not an issue, you can also use the complete symbol
+  tables by disabling stripping in your ``local.conf`` file::
+
+   INHIBIT_PACKAGE_STRIP = "1"
+
+- The unwind tables: those are architecture dependent. On *x86* and *aarch64*
+  architectures, the ``.eh_frame`` and ``.eh_frame_hdr`` ELF sections that are
+  used for exception handling can also be used for stack unwinding. Those
+  sections are not stripped by default. On other architectures such as
+  *armv7*, the ``.ARM.exidx`` and ``.ARM.extab`` ELF sections that are used
+  for exception handling can also be used for stack unwinding. However, one
+  might prefer to rely upon the ``.debug_frame`` section.  That section
+  contains DWARF unwinding material, similar to what's in the ``.eh_frame``
+  section. As ``.debug_frame`` is stripped by default, an option is to
+  instruct the ``strip`` command to always keep the ``.debug_frame`` section
+  around, by setting :term:`PACKAGE_KEEP_DEBUG_FRAME` in the ``local.conf``
+  file::
+
+    PACKAGE_KEEP_DEBUG_FRAME = "1"
+
+- An unwind program such as ``GDB`` or library such as ``libunwind``. That one
+  will use the unwind tables to get the call-stack at the moment of the
+  crash. Then it will perform the translation between the function addresses
+  and the symbols to get a human readable backtrace.
+
+With those three components in your image, you can for example configure
+``libunwind`` to display a backtrace when receiving a ``Segmentation fault``
+signal. You would then get backtraces similar to that one::
+
+    Backtrace:
+      0x400da9: segmentation_fault_handler(int) + 0xb
+      0xb6d64a6e: strlen + 0xad
+      0xb6d38dcf: __printf_buffer + 0x112d
+      0xb6d4be7f: __vsnprintf + 0x31
+      0x400c79: print_info(char const*, ...) + 0x5f
+      0x400ddb: main + 0x13
+      0xb6d182cb: __libc_start_call_main + 0x45
+      0xb6d18367: __libc_start_main + 0x5d
+    Segmentation fault
+
+If you are using an unwinding section that was already present on target and
+the ``minidebuginfo`` mechanism, the overhead only consists in the compressed
+function symbols and the addition of the unwinding program or library.
+
 Other Debugging Tips
 ====================
 
-- 
2.47.1


