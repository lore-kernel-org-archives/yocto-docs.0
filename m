Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232F9C5CFDB
	for <webhook@archiver.kernel.org>; Tue, 11 Aug 2026 09:03:02 +0000 (UTC)
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.50631.1786438977717956486
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Aug 2026 02:02:58 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FQd7CVaM;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.52, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so25129195e9.2
        for <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 02:02:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1786438976; x=1787043776; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AHFaOOP5B+nnmNq1/rfaMqwTM+3XHIAhljOskaXwTMo=;
        b=FQd7CVaMuUwZ7ExKE7EFgrkLnK+7u2KHwvb5RwMdGKw0QyOXSiwWvhLH1m75Xlapmx
         VDW9JVtLLOCSdeGBHUyrL4lezOgFGFwhGyw4qwBl4Wmeql8bSCEsETJgMQU+Q0CFCl39
         qy2EVQmfDL8y/ftbB25AgrDemjZPXZAZBnePw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786438976; x=1787043776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=AHFaOOP5B+nnmNq1/rfaMqwTM+3XHIAhljOskaXwTMo=;
        b=WrNt2r9m0dT/wWrgTu6aVsK9BftPbIRmVL466OVWuziRbB0ioAksC86f/sPMA3fE73
         3/Z2qdILspBs9nAGTBjbqqlLRjMY87n5YiCGtrVYfko9vwt50wcRnweZbmiCgv1mNBCH
         u2fnugHpKXXDmNc3no1qiGFvVlvWjmWAQtRvfCSP58okvvnWo4ZSjcUU21amA+lp5e+t
         mfgNEJbZ3V1j4Ma4+oAPXR36xVkk5/BIE+2PrgTCwBJzRAsjqnccc8xHGUs64KM+OKY/
         M7sP/5Di8YPMFfyh1/wwzCJJcr6tQ+Ok6lgPtbBc87tK2i10nHKCb+lSPYOPKmwYv8Eo
         2a/w==
X-Gm-Message-State: AOJu0YzO9OyR1tbkc6x9836OunOl4QviFuiD8bXzm4Uyb2pWrgwToIMk
	x87928L52e6cCha4gyahq3igYaIgV5Ep9JFVcSLCm1Wxwp0uvAmy6gKr+Lpn7JfcFqIGSiPsNK3
	LwpIMzUA=
X-Gm-Gg: AR+sD11KcnorTtPpnLNo+UCfPMA+VFKvhWIFk68T3dDrmPzj0d+cVnNaG9VP5Cl4PEg
	9WVxWtxpe/ccKgkVZTtyQPaRB/YsIZ7GnDgSjSsbYFCnTBMtepTJzXfKeWSNrwnq0dmFshnxGlZ
	2MHx36e4frLMbVQHFAzrE4kbmyunI1qJiPdhHheqPyUnv916zwbjXX/rHYYniaWvgFwKgX7Pu78
	kfyxvmrKBZuWoqSOK9lBt72wLNfWI1w9fTIX4WnzbE7HiX3BQrFwKtZyYCEAvpfVZy+2Cha6SR3
	t3yPWazqZZZE9iJtQ5THSf3R1CUngBnL0mvXN30Xn37hBjRrXT+62+Lk6VRBOLo7+kEYe0C5Im5
	W4mUFPenMTAVs47RR2nYFLYBZJjnXGmSI4SX+wHQJsozV8tIOit9FCbTiEpFjPV81mNJfE3wd3W
	TMVN2Ye4ObOwzf2eGtJHb6S4hJjvBqDD52AkytuTJ8wmI5YDJ3vw/plQ80pyfj5dYISRoQuMo2l
	C5j85M1Qz+DKzmxBZq9rzZ0SP3u
X-Received: by 2002:a05:600c:530f:b0:499:726b:7375 with SMTP id 5b1f17b1804b1-49978466056mr31716595e9.14.1786438975546;
        Tue, 11 Aug 2026 02:02:55 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:4732:d3f8:90a6:fc6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4814a5be2aasm2847470f8f.13.2026.08.11.02.02.54
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:02:54 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH v3] security-manual: Add information about how security is handled in builds
Date: Tue, 11 Aug 2026 10:02:53 +0100
Message-ID: <20260811090254.3611885-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Aug 2026 09:03:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10253

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
index 000000000..dfc13235c
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

