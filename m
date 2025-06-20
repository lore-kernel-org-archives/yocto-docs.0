Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C8E6C71155
	for <webhook@archiver.kernel.org>; Fri, 20 Jun 2025 13:07:17 +0000 (UTC)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
 by mx.groups.io with SMTP id smtpd.web11.7377.1750424827049628537
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Jun 2025 06:07:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=Y7mCcyvy;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453398e90e9so13126635e9.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 06:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1750424825; x=1751029625; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qIqzSZe23C6aNEhenZI6vrswtbxk82nuO0j6Puo6jXo=;
        b=Y7mCcyvyDHc+pmHntEn3lHTgULESuqB1RQh1A8OiDwPcmeyK8yexuFgf2g5GLsNUy4
         vwD0GGmlV1kBJWMfGDo/2WZgRowlaNnScAe0bIJhU3ABNKxapHbbBRfuhRvqf/TYYGGx
         b0kWke2Ihksc4xFWW4cozPy72+6xt1MMNzSI8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750424825; x=1751029625;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qIqzSZe23C6aNEhenZI6vrswtbxk82nuO0j6Puo6jXo=;
        b=EFuDb348E6+Za66cWFzUGpT4RGRwuXRwEKNqSrMc2iyFWr0qcPLaVR94rJ23/Qp28m
         9RLwb9vnNANWO/WK0LhTYv0e+L+J6OcZ1/OrZDNeQ1y51oLNxxUWlhj1btKhJsAGqHm/
         4YCqT+IlEDkQp5/mKYovY/44CvlhEkryH3JXBfTmCt6YDHIZbkcpbJkVQm+syq22cTAA
         rVBDD5nbPbd26A5Cd6tzgIESDJ+sbh82lpgUtLP0R+deVYOFFpUaIopAFeBkr9+9ftUJ
         ptWi/go6C62twcaiN94lDyZedW4m/eE20VMTHuYMWUDWWwlQjiV1p9AvZLLP528rPgAp
         iQeg==
X-Gm-Message-State: AOJu0Yz+eXV7YhYvOroY+kF+GIi2MyUybNas43yTOQaZ1d9IcIatUbGu
	uSNOfwjQ/tAeq9OiI/y+gF3sBe6uSirzJP8bigna5ujneynYo8ST9qc6PZ/9o48F5wR22shpn1E
	mMyHRAJA=
X-Gm-Gg: ASbGncvzCK9Oo3pUEeWRtP5ShrmKHO9X/xNus3p+8q8jCSEr8j/k+caE+GgTDbuVqLx
	Z+QMolK43nCUbxJMVDH/TxJPmgWS+l9SHZfsUl24b8d6c5oFWcSXKkhPAVuxRqLRLkmVmWy34Io
	puivdggGXhjk3QlpGUw270UfsNv7RuEcwdQKgzwEyMYAMhGsFlo6ZDv7RF0SRNls4/wR3vt1HgC
	rx6Etlidw3SqMK+SjeGXEkyKFUVhHjHBONGKeYeuZiOAttv40h3YUpQnqLrWe/qmP9nA6XzgiG7
	PW/tm8niWPcl1KzHkaJD5Fq/kv5GGeQ+hXW9ceCezUnQNLg0lm4lnauSR4KSwxv8CCHKBwKObmN
	RkJDynJxycFYvI62nBqO2qyI6pw==
X-Google-Smtp-Source: AGHT+IFNoRKgikwSw3Bt/4sBdsTsm57ayDL2DS8NSOFVCkYl5QaQjXC7WcFBIShMB21ssW4hdXbN0Q==
X-Received: by 2002:a05:600c:3b1e:b0:453:78f:faa8 with SMTP id 5b1f17b1804b1-453659c0dbamr23195475e9.6.1750424824184;
        Fri, 20 Jun 2025 06:07:04 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:b606:370e:6752:7b3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e97a795sm60134015e9.5.2025.06.20.06.07.03
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 06:07:03 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual/yocto-project-supported-features: Update to match current status
Date: Fri, 20 Jun 2025 14:07:02 +0100
Message-ID: <20250620130702.2498598-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Jun 2025 13:07:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7124

A few items were in the wrong sections or needed clarification, tweak accordinly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../yocto-project-supported-features.rst      | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/documentation/ref-manual/yocto-project-supported-features.rst b/documentation/ref-manual/yocto-project-supported-features.rst
index 345280d67..cae24f3cd 100644
--- a/documentation/ref-manual/yocto-project-supported-features.rst
+++ b/documentation/ref-manual/yocto-project-supported-features.rst
@@ -92,10 +92,10 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
      - meta-exein layer testing
      - TBD
      - meta-exein
-   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualization/>`__
-     - meta-virtualization layer testing
+   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
+     - meta-webosose layer testing
      - TBD
-     - meta-virt
+     - meta-webosose
    * - :ref:`Multilib <dev-manual/libraries:Combining Multiple Versions of Library Files into One Image>`
      - Multilib feature testing
      - Collective effort
@@ -114,7 +114,7 @@ Below is a list of primary tested features, their maintainer(s) and builder(s):
      - pkgman-non-rpm (other builders use RPM by default)
    * - :ref:`Patchtest <contributor-guide/submit-changes:Validating Patches with Patchtest>`
      - Patchtest tool selftests
-     - TBD
+     - Collective effort
      - patchtest-selftest
    * - :wikipedia:`RISC-V (64-bit) <RISC-V>`
      - RISC-V architecture testing (64-bit)
@@ -211,20 +211,19 @@ builder(s):
      - PowerPC architecture testing (32-bit)
      - TBD
      - qemuppc,
-       qemuppc-alt,
        qemuppc-tc
    * - :oe_git:`meta-openembedded </meta-openembedded>`
      - meta-openembedded layer testing
-     - TBD
+     - Collective effort / openembedded-devel mailing list <openebedded-devel@lists.openembedded.org>
      - meta-oe
    * - `meta-mingw <https://git.yoctoproject.org/meta-mingw>`__
      - mingw based SDKs testing
      - TBD
      - meta-mingw
-   * - `meta-webosose <https://github.com/webosose/meta-webosose>`__
-     - meta-webosose layer testing
-     - TBD
-     - meta-webosose
+   * - `meta-virtualization <https://git.yoctoproject.org/meta-virtualization/>`__
+     - meta-virtualization layer testing
+     - meta-virtualization mailing list <meta-virtualization@lists.yoctoproject.org>
+     - meta-virt
    * - :wikipedia:`RISC-V (32-bit) <RISC-V>`
      - RISC-V architecture testing (32-bit)
      - Collective effort
@@ -256,6 +255,10 @@ it is on a best effort only basis.
        qemumips-alt,
        qemumips-tc,
        qemumips64-tc
+   * - :wikipedia:`PowerPC (32-bit) <PowerPC>` Systemd
+     - PowerPC architecture testing (32-bit)
+     - No maintainers
+     - qemuppc-alt
    * - :wikipedia:`PowerPC (64-bit) <PowerPC>`
      - PowerPC architecture testing (64-bit)
      - No maintainers

