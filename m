Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C948C5CFCF
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:14:42 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.50410.1786439680427891595
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:14:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=hh1AX+ZF;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-47f703a9e5dso288117f8f.0
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786439679; x=1787044479; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=le7j0D6m284azSwJreR768B/71MUGkw+jqAaS2ZP+MA=;
        b=hh1AX+ZFkVrMOMV1Bg2kjSNrSE/cnRl9xIKP0Zw6a/zsT+B9mV4ONJE4kGYkplhHL4
         AFT67oUxxQmhTa6TzZzyDGB1gfHaIbMMRqWN8CWUADRhNiCiyTRT9h8knIYTn2yS9mu8
         eVxRmeLVg3WBqt2yoVZHMuh0U8e9zzhZrvtWk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786439679; x=1787044479;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=le7j0D6m284azSwJreR768B/71MUGkw+jqAaS2ZP+MA=;
        b=BSch/1/6gd71uxfMAtrf85485YMqN7/L1Jhu32p2HGsEKKeR7pUmpQTLpagKk1xWOO
         Y4WgTj8XNrecjdYsmfW2C+iGzY2iTxHLgPu13nOfu/3H/MrRpz1sRdwiHlPtI4q98j5A
         dJqv4yYuJE6ozphq6w+F+VcHPSiKYxtJ2+UckEk1H3hkrVJMmsmmuJoECUsnkquVxL7I
         GDe17qs/XT5uuDfI6XX1ybYOgEm1fAunvpuKhxRaxkYLJWVBMA5Hl0hKAzXnJo4OSGTB
         O3xaCWJncB6ktN8HtlUB2yRIdjVgpWDbrQ1zHMiEGlMKUNvX6SmTC+l+MZGHargC7S5H
         1UYw==
X-Gm-Message-State: AOJu0YzW32/5o7w/qDzYP329j54WzL9mbyuKDer9hXYF/heg4dmSJG4O
	R+75FMQXvCsiJ2eL8JwVOZn9spRMU0RZBmYnMfcIh84+/AqCYSxcGv4TR/EKNlMfqAx0rq1La41
	WVAtFRv8=
X-Gm-Gg: AR+sD10F1/kBw9tnnKxKJbbrXQIp/d6Y3EMqV6bUnmbdUKhUCGJvc6XsWBqRClOWxQ2
	PVlQ7BNE8sTr+wBAo3ZtlWb590jiIRX+4TAo/E84g6z1U0QRaASrn9UeTuW6Gtzk8SqTYpxhlFZ
	Aob1EPAkGk5IheE/dyylje1IOA6RrHvROuLExOrOTyRjEkCESyKc2u0FkgH4QMc0UZpi9xZxceZ
	wAuJzjUPxVibdYLXrZC9F+xAd2zu4zR60BiWY+75zQ/M+sFxn/+Mk1a4bTvJJvJAntia2R0PiAY
	Xh0pcv2Fvup12KIlqYbh7QDMN/SIwaj5LGT0X7zWfS5VuDiAX9McL7zKxT0xP0MOERyC1rLAFqo
	PbuQuPvl9UZHb2knfga8XhHHGUw0qaOpEZdvR9hzZ3Ajitkd+7YXww++9Vw1b5mA0kJgZNSY5aT
	MvP5uTEYgdy4w+FurpBBBO+arwfsloxqZ6oQLMfOec0cGmZdPkS9U/na3LuwKVYO6ic9OpohLDh
	eDNf2rhr9L03AE1uA==
X-Received: by 2002:a5d:5e8d:0:b0:47f:9750:26cc with SMTP id ffacd0b85a97d-4814adcac2cmr3495939f8f.23.1786439678470;
        Tue, 11 Aug 2026 02:14:38 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a709594sm2772465f8f.18.2026.08.11.02.14.37
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:14:37 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v4] security-manual: Add information about how security is handled in builds
Date: Tue, 11 Aug 2026 10:14:36 +0100
Message-ID: <20260811091436.3649689-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10255

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
index 000000000..111f4e352
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
+   version. The system goes to significant lengths to isolate against host
+   contamination of the output but it is certainly possible, especially maliciously.
+
+   See the :ref:`system-requirements-supported-distros` section of the Yocto
+   Project Reference Manual for more information on supported host distributions.
+
+-  The builds assume :term:`DL_DIR` is a safe location. Once download artefacts enter
+   that location they are not repeatedly re-verified. A user could edit the git trees or
+   tarballs there in ways the build might not detect.
+
+-  The builds assume sstate objects from :term:`SSTATE_DIR` or from a configured sstate mirror
+   are safe (with :doc:`signature checks </security-manual/sstate-signing>` if configured).
+
+-  The core build tool, :term:`BitBake`, is an execution engine and will execute code both
+   during builds and when parsing recipes. This is not a security issue, it is an
+   essential part of its function and purpose.
+
+-  :term:`OpenEmbedded-Core (OE-Core)` is well tested for reproducibility issues but other
+   layers and their recipes and code may not be as well tested. Those reproducibility tests
+   are available for others to run against their own layers and code.
+
+-  The builds combine many different software components and we take it on trust
+   that there aren't issues in those code bases. We'd recommend build environments
+   being set up in such a way that if such an issue were ever discovered, which at
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

