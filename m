Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 792FEC2A09B
	for <webhook@archiver.kernel.org>; Fri,  7 Aug 2026 16:43:30 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.46759.1786121008796655026
 for <docs@lists.yoctoproject.org>;
 Fri, 07 Aug 2026 09:43:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=gP2jD06l;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.49, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-496b7622a83so30737605e9.2
        for <docs@lists.yoctoproject.org>; Fri, 07 Aug 2026 09:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786121007; x=1786725807; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=98GRIzHz4Oq7Nc7kRLDCdXKBlA4ExCL09AGCqVuLAMw=;
        b=gP2jD06lV3YUE16TMNzeF9w2qJoMimozWUnhCmQZWAYbiGkCcBT2aizzPUE/ogU2nt
         m3e+L0/88dBeTbWO0zEq0+5ge+Upid/Ar9dgHsZpCpOvYGaevH7mVjqioCwgSVWqquXl
         Q0A7eW43aeoxfLdfdVmB40BkTcRaarr5d/63w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786121007; x=1786725807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=98GRIzHz4Oq7Nc7kRLDCdXKBlA4ExCL09AGCqVuLAMw=;
        b=VssiPiEx7OnP3UjHFped7q7HSR9xxj1lWtVGQWGXcKCT9nm7s8CdjMSkrYZNF+lpaL
         QK2n/0F3537ulh51l0wX4KboAqaN33xgTm0lJZoZMH2geBM9I0F6mc8zHyweNnY+USB+
         dYi5rKQyfWA9H1eiXTFEEJQ+zOqpDCF21i5BaajX93hmNnwO7E77RzJ+LAiZ9FKxhNsV
         CyhogxsNM5g41vCOyIj6FtCbS0Qd8rWlNdYkVDpYoIdtBmUz143ucnyPYSxa6M8HOjMb
         9jOZlYjwUAOANjsYvca9w7TP7IrXX4H9hK/p2A7LcU4vtD9whwa6MHoNFNHdYa8AdcFW
         4LRA==
X-Gm-Message-State: AOJu0Yw1yiP2seYSQvkMFMlm4cl/NN1TXDyXVAKaQkAQZ9gxs8xsWB/E
	Ac3IX4B8nwdl4MsaDgmgS54yNfn/QxYpo64i5onT6J9YH3LVfrGdnjJMpjotmsroO+/RjpVLX+E
	Fz1XpEqs=
X-Gm-Gg: AR+sD12O+tZxCAL+n2RNHv2ol9sccZX6ARp9v/QhV7YyoIc13hrxy0diCGnWZLV9Mny
	fcmAYdi5BHpvyM+Z9ZocvDBPvXY25b2jV6d1TGs3NeymCDMmRH9nflVntDnE4Bimia4kync9VhC
	24fheyYcicSX/6fMsIOX24QvD7Ug9ZNmJlqaVdmI6aLKFOouodG99naGYHTdyr6UKWvBVbyX1Fq
	wZaS98KmC7V6DIXEeyokLPDR9a/BUJacHRUqub8igYnbO422CDf+sZN3FkH3A9vyd0FfYEXGzFD
	yUVg81qkuoYFssRqwxtoGoeLJpvE/SnYGsAXxgbIj3cW3HVi1kcpxkRhPjCs6XpMqVuotRu31ug
	ozXyZaZq3MJ86PclN3NIeET3kivZ8G4COWOAn5GOdGtnpu18do9Qmv/4BvKImLMIIrJNW/Qg1DF
	rVJy7A1vtKLi6WaK24JBK6KU4TKuzo5UJKuTKYfSzRPW5Y8pQuMDdzXpsGfhuEs641P0S8lHAqU
	SFgmLT0JnL2k7YFBA==
X-Received: by 2002:a05:600c:1d20:b0:495:7426:c392 with SMTP id 5b1f17b1804b1-4996193f178mr11325935e9.1.1786121006817;
        Fri, 07 Aug 2026 09:43:26 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:789a:c044:a3bc:d9bf])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4995bdc433bsm80889975e9.1.2026.08.07.09.43.25
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 09:43:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH] security-manual: Add information about how security is handled in builds
Date: Fri,  7 Aug 2026 17:43:25 +0100
Message-ID: <20260807164325.4083331-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 07 Aug 2026 16:43:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10244

We have no information about how security is handled within the builds
themselves. Start to document this.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../security-manual/build-security.rst        | 41 +++++++++++++++++++
 documentation/security-manual/index.rst       |  1 +
 2 files changed, 42 insertions(+)
 create mode 100644 documentation/security-manual/build-security.rst

diff --git a/documentation/security-manual/build-security.rst b/documentation/security-manual/build-security.rst
new file mode 100644
index 000000000..5f15d5f64
--- /dev/null
+++ b/documentation/security-manual/build-security.rst
@@ -0,0 +1,41 @@
+.. SPDX-License-Identifier: CC-BY-SA-2.0-UK
+
+**************
+Build Security
+**************
+
+OpenEmbedded is used to run the builds and careful consideration has gone into
+how it does this with the aim of being both secure and reproducible. Like any
+system, it does need to be used carefully and in keeping with the design for
+that to be true. Users of the system should consider that:
+
+-  The builds generally aim for any input into the build process being verified in
+   some form. For source code tarballs, these would have a checksum. Git source
+   trees would have a specific git revision. Metadata would also usually be
+   under source control and also have revisions.
+
+-  Some elements that can influence the build are not verified. It is assumed
+   that the operating system running the system is secure and of a known setup and
+   version. The system goes to signififant lengths to isolate against host
+   contamination of the output but it is certainly possible, especially malicously.
+
+-  The builds assume DL_DIR is a safe location. Once things enter that location
+   there are not repeatedly re-verified. A user could edit the git trees or
+   tarballs there in ways the build might not detect.
+
+-  The builds assume things from SSTATE_DIR or from a configured sstate mirror
+   are safe (with signature checks if configured).
+
+-  The core build tool, BitBake is a execution engine and will execute code both
+   during builds and when parsing recipes. This is not a security issue, it is an
+   essential part of it's function and purpose.
+
+-  OE-Core is well tested for reproducibility issues but other layers and their
+   recipes and code may not be as well tested. Those reproducilbity tests are
+   available for others to run against their own layers and code.
+
+-  The builds combine many different software components and we take it on trust
+   that there aren't issues in those code bases. We'd recommend build environments
+   being setup in such a way that if such an issue were ever discovered, which at
+   some point could happen, the build environments themselves could be simply
+   destroyed and rebuilt cleanly, i.e. they're disposable.
diff --git a/documentation/security-manual/index.rst b/documentation/security-manual/index.rst
index a767cd9c6..328265be2 100644
--- a/documentation/security-manual/index.rst
+++ b/documentation/security-manual/index.rst
@@ -11,6 +11,7 @@ Yocto Project Security Manual
    :numbered:
 
    intro
+   build-security
    securing-images
    vulnerabilities
    read-only-rootfs

