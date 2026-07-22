Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20BA8C44536
	for <webhook@archiver.kernel.org>; Wed, 22 Jul 2026 14:48:56 +0000 (UTC)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1783.1784731729933910984
 for <docs@lists.yoctoproject.org>;
 Wed, 22 Jul 2026 07:48:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=jJdCuEWq;
 spf=pass (domain: gmail.com, ip: 209.85.160.46, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-451d8064238so7477928fac.3
        for <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 07:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784731729; x=1785336529; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dquow5xKUfRLfWd50P2fm3nOY2PamoMBJi8dToV9XiE=;
        b=jJdCuEWqnMU4piv3cOMaEb+hqws70jJQdeoCUc2Xd1VaMB57AkOuRuqWsUCSnFFwcU
         aldNo67PwlF/XIymk+j7JQHZpX7lhGQpSDUweo//ERQyDbJ6/Hrt0OucA1sjs+wTO0Xc
         JGkgMImAWQ0MdKXgKW28QjnzsmCOhUJGZFiASbAt9EDagr0iwq5SU43d6O2D3+5IfLgk
         tkROXkO/8SlikojCKD86AJJqwq3c0xs/WufQkLw2S1wKFYXIPPQM5PQFPiCtJBrT/5i7
         8zR+tq0Jt5SB+OrpQuL3jevGwh00CGZFL/D5yBPabC05Eboyll+462nQqcS0/UFPVrnO
         25iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784731729; x=1785336529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dquow5xKUfRLfWd50P2fm3nOY2PamoMBJi8dToV9XiE=;
        b=VAaj295MbA9dlrQfn7Neio860VwC5JqpLyRRsTkTHimDtjEmmHlRUlrLVa8L5bT07N
         RaVYgcAscGRqyoMQKa7KzAz2CCBV/qfitwHYHec6KEke9q1uliRjdgR8TXSP1DGck+9C
         T8mdHB29/a4yNP3m+5dHpR0L0XIzue9AgPyGK7eE6/CDARbNp/B8+xRQ2ZbjO/2mvcqW
         N7OCdutycWBDdZlDWCFpaw2Qz2YNVbMnL188p6RxWYkO+MawZS4qaz62t60kmdVqYSvD
         eCGI4ooXzuEFN8AXD5sXaLZ/LVWtr+lUyUAEh72cKamvoFWDs7j1YOjW6LE4irBpr3ys
         t4zQ==
X-Gm-Message-State: AOJu0YxnVjhKUuKiFt2j9pSJ8atoaXjINYLxQwPEpRLEo+WMkFR9AVHC
	+7iQsLSdGP4oMIu8N8r+fxDHd8LY4V0xiPUDPtv4XfZztM9dpp/+7Hi98A0v/w==
X-Gm-Gg: AR+sD11u6w3sBsTzsBluO5/9JhkkT69lsfihPyc6kd7d7IV4cMK8y/WfgJ/WfK9MT8Y
	0W3CnbWBXwR6UpDraIiEIWE8RQX8vKLBWipDpZb+9DEe1Kn7qAYYyVGEfR9JnLOvh+R6q8Mcyc2
	pSbVLcoVT25gxDO9q80pyh4GBlVVCQgv7E7MWk9jGnC6fFZwGu5kjrUlOrZ/ztvpneMtGj2BZTF
	YDwhp84/sfLjUktyAarBrZeLPjSQPLhe2Io8Lqr+OwYvISOMv4nN+llpyFOeLcsAwQwPq1w/6qQ
	iuJUvWIQ9n5LWTPZkudnBffmMSr2MYZm0Og6Cp7qM/PM2OkTlsRzgbRGDHXSdSIQQz5QmEk+V7Z
	QO1NpBCiDZfXJvO2dcE2/oPWXe0f2W0j8z7Uh18bxWMO30daICqzTIUW7iHVawapNUG4x0NFnbg
	==
X-Received: by 2002:a05:6870:320b:b0:456:5461:11d9 with SMTP id 586e51a60fabf-456900f9edemr11931974fac.12.1784731728825;
        Wed, 22 Jul 2026 07:48:48 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::d8e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45767526fb2sm1961465fac.18.2026.07.22.07.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:48:47 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH v2] migration-guide: Add guide for converting licenses
Date: Wed, 22 Jul 2026 08:48:43 -0600
Message-ID: <20260722144843.3413389-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260721214707.2129954-1-JPEWhacker@gmail.com>
References: <20260721214707.2129954-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 22 Jul 2026 14:48:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10114

The LICENSE variable is now required to be SPDX license expressions, so
provide a migration guide to describe the changes required to integrate
this change

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../migration-guides/migration-6.1.rst        | 69 +++++++++++++++++++
 documentation/ref-manual/terms.rst            |  8 +++
 2 files changed, 77 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 8786cd699..a49cca270 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -75,6 +75,71 @@ And::
 
    oe.utils.any_distro_features("x y", ...) -> bb.utils.contains_any("DISTRO_FEATURES", "x y", ...)
 
+:term:`LICENSE` is now a :term:`SPDX License Expression`
+--------------------------------------------------------
+
+The :term:`LICENSE` variable is now a :term:`SPDX License Expression` instead
+of the custom license expressions that have been used historically.
+
+The changes required for the new expressions are as follows:
+
+1. The ``&`` operator is replaced with ``AND``
+
+2. The ``|`` operator is replaced with ``OR``
+
+3. Any license value which is not a valid :term:`SPDX License Expression` is an
+   error.
+
+4. Custom (non `SPDX License Identifier`_) licenses are still allowed, as long
+   as they are prefixed with ``LicenseRef-``. The behavior of looking for the
+   license text in :term:`LICENSE_PATH` (with or without the ``LicenseRef-``
+   prefix) or :term:`NO_GENERIC_LICENSE` is unchanged, and may still be used.
+
+5. ``CLOSED`` as a license is deprecated and will issue a warning. This license
+   is effectively "no license" (usually meaning e.g. "All rights reserved"),
+   but a more precise definition is to provide some sort of actual license text
+   using a custom license. This provides a more consistent definition of the
+   license text, since the meaning of "no license" may vary by jurisdiction.
+   Keep in mind that you can still have a common license file in
+   :term:`LICENSE_PATH` and refer to it with a ``LicenseRef-`` license. Note
+   that when you do this, you will also need to provide a
+   :term:`LIC_FILE_CHKSUM` value to point to your license file.
+
+6. The generic ``PD`` (Public Domain) license is no longer allowed (since it is
+   not a valid `SPDX License Identifier`_). Additionally, the meaning of
+   "Public Domain" varies by jurisdiction, so leaving the exact license text
+   unspecified is not recommended. Instead, either find a matching SPDX license
+   (The `SPDX License Check`_ website can be useful here), or use a
+   ``LicenseRef-`` with :term:`NO_GENERIC_LICENSE` to specify the actual
+   license text.
+
+7. The ``WITH`` operator should now be used to describe an exception to a
+   license, instead of a bespoke license identifier. For example, the old
+   bespoke license ``Apache-2.0-with-LLVM-exception`` would become
+   ``Apache-2.0 WITH LLVM-exception``. For a list of the valid license
+   exceptions, see `SPDX License Exception`_.
+
+8. Because of the change to use ``WITH`` instead of bespoke licenses, there is
+   a change in how :term:`INCOMPATIBLE_LICENSE` works. Anything listed in this
+   variable will match a single license (unchanged), but it will also match the
+   left-hand (license) side of a ``WITH`` expression. To allow a license with a
+   specific `SPDX License Exception`_, the SPDX license exception must be
+   listed in :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`.
+
+   Practically speaking, the place where this comes up the most is when
+   attempting to exclude GPLv3 code using :term:`INCOMPATIBLE_LICENSE`.
+   Previously, this would have allowed any ``GPLv3-with-exception`` license,
+   since they were bespoke licenses that did not match the
+   ``GPL-3.0* LGPL-3.0*`` expansion. Now, however, the licenses will match
+   because they are e.g. ``GPL-3.0-or-later WITH exception``. As such, any
+   exceptions to the GPLv3 that should be allowed must be listed in
+   :term:`INCOMPATIBLE_LICENSE_EXCEPTIONS`.
+
+Currently, the older syntax for license expressions is still parsed and
+automatically converted to a :term:`SPDX License Expression`, but a warning is
+issued when this occurs. This support will eventually be removed and the only
+valid values for these variables will be :term:`SPDX License Expression`.
+
 Removed recipes
 ---------------
 
@@ -93,3 +158,7 @@ Removed classes
 
 Miscellaneous changes
 ---------------------
+
+.. _SPDX License Identifier: https://spdx.org/licenses/
+.. _SPDX License Exception: https://spdx.org/licenses/exceptions-index.html
+.. _SPDX License Check: https://tools.spdx.org/app/check_license/
diff --git a/documentation/ref-manual/terms.rst b/documentation/ref-manual/terms.rst
index cbe7c88e6..a955792bd 100644
--- a/documentation/ref-manual/terms.rst
+++ b/documentation/ref-manual/terms.rst
@@ -578,6 +578,14 @@ universal, the list includes them just in case:
       and the ":ref:`dev-manual/sbom:creating a software bill of materials`"
       section of the Development Tasks manual.
 
+   :term:`SPDX License Expression`
+      A :term:`SPDX` defined standard for expressing how one or more licenses
+      apply to a work.
+
+      The syntax for a SPDX License Expression is defined in the `SPDX
+      Specification
+      <https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/>`__.
+
    :term:`Sysroot`
       When cross-compiling, the target file system may be differently laid
       out and contain different things compared to the host system. The concept
-- 
2.54.0


