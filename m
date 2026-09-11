Return-Path: <othacehe@gnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 261CEC88E4D
	for <webhook@archiver.kernel.org>; Fri, 11 Sep 2026 22:02:28 +0000 (UTC)
Received: from eggs.gnu.org (eggs.gnu.org [209.51.188.92])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50679.1789164142184444532
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Sep 2026 15:02:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gnu.org header.s=fencepost-gnu-org header.b=WdokUMSQ;
 spf=pass (domain: gnu.org, ip: 209.51.188.92, mailfrom: othacehe@gnu.org)
Received: from fencepost.gnu.org ([2001:470:142:3::e])
	by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.90_1)
	(envelope-from <othacehe@gnu.org>)
	id 1x59K8-0001Xb-NA
	for docs@lists.yoctoproject.org; Fri, 11 Sep 2026 18:02:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
	s=fencepost-gnu-org; h=MIME-Version:Date:Subject:To:From:in-reply-to:
	references; bh=leyMsP+LGq8+O8LMGDYO3LbVULjEkkikf9OlvvlTbiY=; b=WdokUMSQ2zrL1D
	csvLrHnIt2uvnrp7XPh5CDayu/ICBYTU+tyAfVtYcv7EfL3+aEuxfYdBj9RBcWuuayH/zhuNRf3tF
	U9/aMbQmf8I4D0sNSkhzwUr0jC6qprJP84y8nCbv8q/ri9OytpLnCAItGWM0X50skW3cASgE0X4yd
	N0rhQhHuxjJNP7RQdtb/GY/3rFZWWXI967k5ncoWO02wmmUiKQ0c6B/x8I+azQflXnm3PUZqkt3gI
	BdKfQbB1IZ32BxFvsY6vRdDD7snVQszqY/EytndcM1FLM1YX0PIdMlTNEtXcsckzEPGK80EcPozZ5
	aC/OYR7BYbm0e2nhiSbA==;
From: Mathieu Othacehe <othacehe@gnu.org>
To: docs@lists.yoctoproject.org
Cc: Mathieu Othacehe <othacehe@gnu.org>
Subject: [PATCH v3] ref-manual/variables.rst: document PACKAGE_KEEP_SECTIONS
Date: Sat, 12 Sep 2026 00:02:13 +0200
Message-ID: <20260911220213.32468-1-othacehe@gnu.org>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 11 Sep 2026 22:02:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10482

Document the PACKAGE_KEEP_SECTIONS variable added to
openembedded-core, which can be used to keep specific ELF sections
(such as .debug_frame, for use with libunwind) around when stripping
binaries and libraries.

Companion documentation for the openembedded-core patch "lib/oe/package:
Add strip keep-section support", sent separately to the oe-core list.

Signed-off-by: Mathieu Othacehe <othacehe@gnu.org>
---
 documentation/ref-manual/variables.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 83bc59e..1ea1d5a 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7166,6 +7166,30 @@ system and gives an overview of their function and contents.
       install, the build system does not generate an error. This variable
       is generally not user-defined.
 
+   :term:`PACKAGE_KEEP_SECTIONS`
+      Specifies a space-separated list of ELF sections to keep when
+      stripping binaries and shared libraries, even though they would
+      normally be removed by :term:`STRIP`. This variable is never applied
+      to kernel modules.
+
+      For example, on 32-bit Arm targets, GCC can emit DWARF Call Frame
+      Information for stack unwinding under the ``.debug_frame`` section
+      instead of the ``.eh_frame`` section used on most other
+      architectures. Tools such as `libunwind
+      <https://www.nongnu.org/libunwind/>`__ can use that information, for
+      example to produce a full backtrace when an unhandled C++ exception
+      is thrown, which the ``.ARM.exidx``/``.ARM.extab`` unwind tables
+      that GCC generates by default do not always allow (see `GCC bug
+      117941 <https://gcc.gnu.org/bugzilla/show_bug.cgi?id=117941>`__). By
+      default this section is removed like any other debug section, but
+      it can be kept with::
+
+         PACKAGE_KEEP_SECTIONS:pn-myrecipe = ".debug_frame"
+
+      .. note::
+
+         Keeping extra sections increases the size of stripped binaries.
+
    :term:`PACKAGE_NO_LOCALE`
       The :term:`PACKAGE_NO_LOCALE` variable can be set to "1" to prevent the
       :term:`OpenEmbedded Build System` from splitting the locales found in the
-- 
2.34.1


