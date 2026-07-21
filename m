Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A4EFC4452D
	for <webhook@archiver.kernel.org>; Tue, 21 Jul 2026 21:47:15 +0000 (UTC)
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com [209.85.210.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34702.1784670433107396031
 for <docs@lists.yoctoproject.org>;
 Tue, 21 Jul 2026 14:47:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=NNADN4nQ;
 spf=pass (domain: gmail.com, ip: 209.85.210.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-ot1-f45.google.com with SMTP id 46e09a7af769-7e9fc3de7ceso4532303a34.1
        for <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784670432; x=1785275232; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F+okPi/c0XohqwiP5lfkuMavVB/jYo9Rw735z0o6MBw=;
        b=NNADN4nQpfsq9XonSRIUNDoBZg6hboYOglQIjaZOIsZDoiH5yyUsN/DaHo23hmPeuX
         s6iQO46yFivw8gQxg3dDt94vEv92gALYaWPHPYIiHvL9igXM9Xxs+OhavnMeJJdnD+fI
         j3lraiKSDdhT42nLjsSyKag/1i2IYEATfO6Re30VnnZceB/cjTzC04bn+CCar9wREm8G
         l3jNOf93pL/T5TN8VU8FjgQhCAokKfToHhXjsDN7Z3V9AOTKOUimBzs1TFKQ5mRVgio1
         XQDL/OjmGTPiHApc0fZi4MUxrMN5wwHxgFnP5d7RrySG4fuODlu4HVjYBTMWSTihOmZ+
         51/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784670432; x=1785275232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F+okPi/c0XohqwiP5lfkuMavVB/jYo9Rw735z0o6MBw=;
        b=X0fshNJsIv/1cgk1kYUkE+2ue/Ga+XCKhdA853XjLk2/4Gswgq9n/99Z2KX4RLwOhF
         bQZnxYXiZrqH/3kCAZJhNtipSfX7PyR9+5bwdbgJO30Ro0tr38jvti721vT4IfdcmwrQ
         DUqD2I5hLyq3NXtfB0o7u2aNF3eJjJLJjOZDY5AEcuZknoTq5nPh+LP41RKtiRdZuAti
         DB+kwisrA/7fUE5jeFpjpAWhJjRQkzreVkUD3FAdCVmuRW1ePwjLs8XlnoPVCXkBYxau
         awwiEAdqSZ8SJGekfLw/PtEg1HDWA4IfVIVW8VMwR8aSAu3OMNs4dY6PWY3ZjWXbqjRV
         FybQ==
X-Gm-Message-State: AOJu0YzD3Mt6Do+MpGtmzGDQnIzL76n9TIdKVLKMGWbn6fIF/GIuDNkX
	pJ7x2EtU5OuqMl7sD81mWzg57stj3Hm9VXYG861DixQs0zDFqxwfAnGsw84GEA==
X-Gm-Gg: AfdE7cl33IXVXX+IaBJoIwqBpn0ajzZC1BG6FIFIxlUfyJSD7RSlnlyudOzNxmwVWCT
	UW6UZJret3GZ+epoPYW29XMzVGqUUy3jPt0etB53d120or/H6VX7dD4gSzLTG4FeGF9+3G/IH51
	vL9XZi4nqsCsFfV724jYbqHllD5DG2185G3YCGmqMjxhhFglTfDrTqGfLDusaEpD1gqcgOrZOYk
	ZA3nSDK5irowz7QNeC43AECGb5RuLoGuPCXgOxFuRKj7hrp5rLhp6rcNd46UOHAqjXC0Ve1fkqO
	ajmyMcLKTzh3e00ZSDe6em9hgI6ZUUo0suYwf15S4Qvc+7XqYmNpI8VpH0kla2MetdNo4Q3DUUh
	Sh30oalMVxRwn5jkJDuvA5V3KWQgw2lv5QS7bcNzMLVxF8Cl07OwUWp0aZpXdEjalb8z+xFWx0X
	I=
X-Received: by 2002:a05:6820:4d01:b0:6a3:d72a:8b5d with SMTP id 006d021491bc7-6a535b0fbaemr8994753eaf.0.1784670432099;
        Tue, 21 Jul 2026 14:47:12 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::96ac])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-45766e7c9d7sm577992fac.2.2026.07.21.14.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 14:47:11 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] migration-guide: Add guide for converting licenses
Date: Tue, 21 Jul 2026 15:47:07 -0600
Message-ID: <20260721214707.2129954-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 21 Jul 2026 21:47:15 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10105

The LICENSE variable is now required to be SPDX license expressions, so
provide a migration guide to describe the changes required to integrate
this change

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 .../migration-guides/migration-6.1.rst        | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/documentation/migration-guides/migration-6.1.rst b/documentation/migration-guides/migration-6.1.rst
index 8786cd699..48777e16c 100644
--- a/documentation/migration-guides/migration-6.1.rst
+++ b/documentation/migration-guides/migration-6.1.rst
@@ -75,6 +75,61 @@ And::
 
    oe.utils.any_distro_features("x y", ...) -> bb.utils.contains_any("DISTRO_FEATURES", "x y", ...)
 
+``LICENSE`` is now a SPDX License Expression
+--------------------------------------------
+
+The ``LICENSE`` variable is now an `SPDX License Expression`_ instead of the
+custom license expressions that have been used historically.
+
+The changes required for the new expressions are as follows:
+1. The ``&`` operator is replaced with ``AND``
+
+2. The ``|`` operator is replaced with ``OR``
+
+3. Any license value which is not a valid `SPDX License Expression`_ is an
+   error.
+
+4. Custom (non `SPDX License Identifier`_) licenses are still allowed, as long
+   as they are prefixed with ``LicenseRef-``. The behavior of looking for the
+   license text in ``LICENSE_PATH`` (with or without the ``LicenseRef-``
+   prefix) or ``NO_GENERIC_LICENSE`` is unchanged, and may still be used.
+
+5. ``CLOSED`` as a license is deprecated and will issue a warning. This license
+   is effectively "no license" (usually meaning e.g. "All rights reserved"),
+   but a more precise definition is to provide some sort of actual license text
+   using a custom license. This provides a more consistent definition of the
+   license text, since the meaning of "no license" may vary by jurisdiction.
+   Keep in mind that you can still have a common license file in
+   ``LICENSE_PATH`` and refer to it with a ``LicenseRef-`` license. Note that
+   when you this, you will also need to provide a ``LIC_FILE_CHKSUM`` value to
+   point to your license file.
+
+6. The ``WITH`` operator should now be used to describe an exception to a
+   license, instead of a bespoke license identifier. For example, the old
+   bespoke license ``Apache-2.0-with-LLVM-exception`` would become
+   ``Apache-2.0 WITH LLVM-exception``.
+
+7. Because of the change to use ``WITH`` instead of bespoke licenses, there is
+   a change in how ``INCOMPATIBLE_LICENSE`` works. Anything listed in this
+   variable will match a single licenses (unchanged), but it will also match the
+   left-hand (license) side of a ``WITH`` expression. To allow a license with a
+   specific SPDX license exception, the SPDX license exception must be listed in
+   ``INCOMPATIBLE_LICENSE_EXCEPTIONS``.
+
+   Practically speaking, the place where this comes up the most is when
+   attempting to exclude GPLv3 code using ``INCOMPATIBLE_LICENSE``. Previously,
+   this would have allowed any ``GPLv3-with-exception`` license, since they
+   were bespoke licenses that did not match the ``GPL-3.0* LGPL-3.0*``
+   expansion. Now, however, the licenses will match because they are e.g.
+   ``GPL-3.0-or-later WITH exception``. As such, any exceptions to the GPLv3
+   that should be allowed must be listed in
+   ``INCOMPATIBLE_LICENSE_EXCEPTIONS``.
+
+Currently, the older syntax for license expressions is still parsed and
+automatically converted to an SPDX License Expression, but a warning is issued
+when this occurs. This support will eventually be removed and the only valid
+values for these variables will be SPDX License Expressions.
+
 Removed recipes
 ---------------
 
@@ -93,3 +148,6 @@ Removed classes
 
 Miscellaneous changes
 ---------------------
+
+.. _SPDX License Expression: https://spdx.github.io/spdx-spec/v3.0.1/annexes/spdx-license-expressions/
+.. _SPDX License Identifier: https://spdx.org/licenses/
-- 
2.54.0


