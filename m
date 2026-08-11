Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12EFAC5AC67
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 08:49:12 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50179.1786438147664257207
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 01:49:08 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=GhqanFNA;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-47ffaa8ebbdso2221013f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786438146; x=1787042946; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Mifs0kXEebQZ5HEudjHmDvKg7Gj7YIYUj6WoL3zi9+Y=;
        b=GhqanFNA8S5Y2AfxrLiaUGhAT0R4d53+AxKKWrCsGagCCH7cSguSvmGyhLmpKyOjdo
         lYC5BdgKiPYSoTI/lEOPFPUusoGZxIfdKde1QrBJrzqxqP9bSMjRZjERrH9DHWGbc6Yc
         f1pKqWgQYoBaiH3QnxBS9rUAJ0uZ/gkygdNtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438146; x=1787042946;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Mifs0kXEebQZ5HEudjHmDvKg7Gj7YIYUj6WoL3zi9+Y=;
        b=GGHEAK5ZReSNX4N6jzhhhRnKWytGDw8P8+wt0bmGQ64kWlAr43QWHSa9OaS3iKluKj
         Ryl8Gvp+fGGHDFc7Q2bBpImYrIDcqQRhCFA7ATiNKBeoXDeSIYQrXtACZ6SM552gq8lz
         qcgtGrwxopxvCce/kACBSgWRqHsbzvpYmiIfl14qqbKZo5sBlwc4Sd+BObTbsBFc89Rh
         0kZWLt7/Ak1DA6etjdaxJcdkVrwtpR6pthCIpVVOCVba7xadkXIvfVFWf1/F5TLyA7ww
         +TfZrh0vrHIefcTjERNaZGgqqAnJaNaqBJ7HB/c8hiyJiOMj2ouyHCBlRYDCpLS9NEJO
         YNRw==
X-Gm-Message-State: AOJu0YyyE467Y+L5YvSmFj0w0SM83MypI/i10F0kJF6woL0hKbwEizt2
	oO41daM6j7ZJu1NgfurSlKxxBNgq3h9TCB+VbfEpUVdsm+vpATSs48yqxBrIfxQf6BtlxEW0nTq
	hCMFdYl0=
X-Gm-Gg: AR+sD13vkxglT3UFgIvXpDGj3+eonW2YqS1eBzmUzXntASf2sLvWhV73D3Hw+ZXJ+wh
	+WCRoPk+bhmhzr3GC+GrJGZcng+4wjAa3OM91xeLA3jNYYcP5ajF3e5Fqd3CwZGivsOGywfPbfl
	Q9Jz8N/W45b7DX4bHx8Fd07SMaVtlsiU5AcRcJwb7OaaDGWwJfB8GGXfN3XA7ZeHcTjts/YsoOO
	Lii7PRQf6KqFRtiRTluPizXegcCnyPXFe+tXHR6yWOVuADBGaSy5PgQuCaWVAS6GiTh/tz5zCsB
	4FlpGv1sNH1gJhxhzRWyOQzxlnC1I0LOdrggSKnnOH8ME0XezMztunPfUtOa4R4YlMY+1d1zhc+
	zcAgNR0G0K/VkSgmOrmGiiFNtzbeMwR2H+lmVI6NMEF/2DxW1x8hhO3xHBK46KWnhIylAKAtyo6
	A6JWZgVO3wTElPW+1QGDhSycdONSEnLS7u24hsC1sx9LVVu8QOnOEZe3Ksxu0JT5iJdgyFwW4Ar
	15rqXbH+BNHaKiFkDSXmlrn4yDayMMqOg==
X-Received: by 2002:a05:600c:4585:b0:495:4e1d:82df with SMTP id 5b1f17b1804b1-499784612aemr27493315e9.10.1786438145463;
        Tue, 11 Aug 2026 01:49:05 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49978840189sm19905455e9.0.2026.08.11.01.49.04
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 01:49:04 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] security-manual: Add information about how security is handled in builds
Date: Tue, 11 Aug 2026 09:49:03 +0100
Message-ID: <20260811084903.3570050-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 08:49:12 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10251

We have no information about how security is handled within the builds
themselves. Start to document this.

[YOCTO #16102]

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../build-process-security.rst                | 49 +++++++++++++++++++
 documentation/security-manual/index.rst       |  1 +
 2 files changed, 50 insertions(+)
 create mode 100644 documentation/security-manual/build-process-security.rst

diff --git a/documentation/security-manual/build-process-security.rst b/documentation/security-manual/build-process-security.rst
new file mode 100644
index 000000000..1335e1d08
--- /dev/null
+++ b/documentation/security-manual/build-process-security.rst
@@ -0,0 +1,49 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+**********************
+Build Process Security
+**********************
+
+The :term:`OpenEmbedded Build System` is used to run the builds and careful
+consideration has gone into how it does this with the aim of being both secure
+and reproducible. Like any system, it does need to be used carefully and in
+keeping with the design for that to be true. Users of the system should
+consider that:
+
+-  The builds generally aim for any input into the build process being verified in
+   some form. For source code tarballs, these would have a checksum. Git source
+   trees would have a specific git revision. Metadata would also usually be
+   under source control and also have revisions.
+
+   See the
+   :doc:`bitbake:bitbake-user-manual/bitbake-user-manual-fetching` section
+   of the BitBake User Manual for more information.
+
+-  Some elements that can influence the build are not verified. It is assumed
+   that the operating system running the system is secure and of a known setup and
+   version. The system goes to signififant lengths to isolate against host
+   contamination of the output but it is certainly possible, especially maliciously.
+
+   See the :ref:`system-requirements-supported-distros` section of the Yocto
+   Project Reference Manual for more information on supported host distributions.
+
+-  The builds assume :term:`DL_DIR` is a safe location. Once things enter that
+   location there are not repeatedly re-verified. A user could edit the git trees or
+   tarballs there in ways the build might not detect.
+
+-  The builds assume things from :term:`SSTATE_DIR` or from a configured sstate mirror
+   are safe (with :doc:`signature checks </security-manual/sstate-signing>` if configured).
+
+-  The core build tool, :term:`BitBake`, is a execution engine and will execute code both
+   during builds and when parsing recipes. This is not a security issue, it is an
+   essential part of it's function and purpose.
+
+-  :term:`OpenEmbedded-Core (OE-Core)` is well tested for reproducibility issues but other
+   layers and their recipes and code may not be as well tested. Those reproducibility tests
+   are available for others to run against their own layers and code.
+
+-  The builds combine many different software components and we take it on trust
+   that there aren't issues in those code bases. We'd recommend build environments
+   being setup in such a way that if such an issue were ever discovered, which at
+   some point could happen, the build environments themselves could be simply
+   destroyed and rebuilt cleanly, i.e. they're disposable.
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
index a767cd9c6..ab1ef445c 100644
--- a/documentation/security-manual/index.rst
+++ b/documentation/security-manual/index.rst
@@ -11,6 +11,7 @@ Yocto Project Security Manual
    :numbered:
 
    intro
+   build-process-security
    securing-images
    vulnerabilities
    read-only-rootfs

