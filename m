Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72FDEC0218D
	for <webhook@archiver.kernel.org>; Sun, 26 Jan 2025 12:53:43 +0000 (UTC)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.web11.29199.1737896020807199995
 for <docs@lists.yoctoproject.org>;
 Sun, 26 Jan 2025 04:53:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cqlZ3b01;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4361815b96cso23282825e9.1
        for <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 04:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737896019; x=1738500819; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gb8eqqiHSMxqp39jprrm7ElCdlosU9SqzlVpuo0ebvw=;
        b=cqlZ3b01KH21yuTu+dZq+fz6NQ3BIG3a1YDqlOUpecsx0fRWevq/hcfWy/IEPQHgkX
         cWnYVLjsac0okXKvogm0USwByGnIDiKV63WH7hZJclJj4a1ey/bBuYQhUiUWCeEhJQdD
         5zUZTwDzRnovudd43yM9S4/mUSBN1XcnwhqjIwf5xpa+NND7v5O4ze+353a2vddrW+Ka
         QVhQW8FW2GCtrLmPQwmKlrk2AJEgBfRmwgu7MzsvhzpKyMQSvPsedmwGngNhWXsrY0tb
         kfLjpmvj4Pg+lLHtUjZyCTF/CGaw16VxiTNIp2G9zQ2i/ODWdegFgsMf3WOZgEj0hgeH
         Oidw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737896019; x=1738500819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gb8eqqiHSMxqp39jprrm7ElCdlosU9SqzlVpuo0ebvw=;
        b=bhfc+Y3Xs+kqW7JhQKFSG4FOILRBZKqfsWobzceG2s6jvw1XT+c/6oPs2Kp564knSV
         FIb5XNsD7/Her+TYUYbujtlB459LPmtMc/u9IfHAkIOKVC0R80mnslzuvglolzXkwh9f
         eYBPa2z9hjS+zbBjS26/PH1RjSPomATfPlQokzGyz8wjeNKGnui0MZznGmTGyQZagCUw
         lJfHT/sFvZT70dO3QcSTevq64iWL02fhmJKlANKobYADjl0q9jK/SiwY4VT6ixV9HeKb
         dgARb8OETCJbHaGx+pGOeSKAmoBX0R//Oh2+xWd2RL/LXVVBor84+VZ2TCSmaQ1dDWsh
         Ht9g==
X-Gm-Message-State: AOJu0YymwZIn3EYLeiNwEs5G4fuUYfD3JGk73BYHFsYaQ+oC4kKgNsiU
	5qTz/lCRivWE054O5U6qQJHosHDha/NFROWdcY4AN+Jrk8Bj3phnFMvKGMrZ
X-Gm-Gg: ASbGnctOY+VU9JZLjRQ3snZptwdRMUcNqCCAfMfYhUVY45EZGI775NO5AKtZtwEORwF
	2oyjObokGYACNtKERqSuNelHhe0V3cbu4hmbK5kSayEBEoeO6h+Wv9nllnDRkLMz3RF7UicxeNJ
	HUz2Tr2wP5T1/7PANvaCAi6GrqWvkKo9WFFZwISSPggE1q1W4yaDE9ifw44JHuvSRQjPgjQhked
	SH6btsjEc1CHxLLoJTHwwo3hQMZgu9uk+dz+8Y0eTywIXtsBqYrbHBWdvTfGsRocq19NcbBXGOO
	iwFKVLLNhNYWVXkwMFFM3C9t8LA=
X-Google-Smtp-Source: AGHT+IGf8tQqNgMQSJcGVwmG5z+XYUxJHtFc15yNTQ3NVDqSUAANxEKNPtrrQ9yi/vqQ1fkyG8R86Q==
X-Received: by 2002:a05:600c:1f86:b0:436:faeb:2a1b with SMTP id 5b1f17b1804b1-438913db2cfmr332356825e9.13.1737896018849;
        Sun, 26 Jan 2025 04:53:38 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438bd4d33f8sm91791075e9.38.2025.01.26.04.53.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 04:53:37 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Antonin Godard <antonin.godard@bootlin.com>
Subject: [scarthgap,styhead][PATCH 1/1] sdk-manual: extensible.rst: update devtool ide-sdk
Date: Sun, 26 Jan 2025 13:53:13 +0100
Message-ID: <20250126125313.1454763-2-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
References: <20250126125313.1454763-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sun, 26 Jan 2025 12:53:43 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6181

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Replace
  devtool ide-sdk --debug-build-config
by
  devtool modify --debug-build

This change was introduced with commit
https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Reviewed-by: Antonin Godard <antonin.godard@bootlin.com>
Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
---
 documentation/sdk-manual/extensible.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3f6a754d8..f16d5a027 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -666,7 +666,8 @@ The extensible SDK supports two different development modes.
       IMAGE_INSTALL:append = " my-recipe"
 
    Assuming the BitBake environment is set up correctly and a workspace has
-   been created for the recipe using ``devtool modify my-recipe``, the
+   been created for the recipe using ``devtool modify my-recipe`` or probably
+   even better by using ``devtool modify my-recipe --debug-build``, the
    following command can create the SDK and the configuration for VSCode in
    the recipe workspace::
 
@@ -783,8 +784,8 @@ The extensible SDK supports two different development modes.
    .. code-block:: sh
 
       # Create the SDK
-      devtool modify cmake-example
-      devtool ide-sdk cmake-example core-image-minimal -c --debug-build-config --ide=none
+      devtool modify cmake-example --debug-build
+      devtool ide-sdk cmake-example core-image-minimal -c --ide=none
 
       # Install the firmware on a target device or start QEMU
       runqemu
-- 
2.47.1


