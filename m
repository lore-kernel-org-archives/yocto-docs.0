Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6544C02183
	for <webhook@archiver.kernel.org>; Mon, 13 Jan 2025 23:37:59 +0000 (UTC)
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
 by mx.groups.io with SMTP id smtpd.web10.32768.1736811472862631779
 for <docs@lists.yoctoproject.org>;
 Mon, 13 Jan 2025 15:37:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TpKKL0Sr;
 spf=pass (domain: gmail.com, ip: 209.85.128.43, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-435f8f29f8aso35039325e9.2
        for <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 15:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736811471; x=1737416271; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JqhyXDLF63DQEMYCKoX1WU8/kbOjoS3pZYIn83cjfoE=;
        b=TpKKL0SrEogApvcgRe8tHqpWBcd+EWmhAhy1Iuzc1WZTnsAbhen3ICzWoxsh5htvLH
         FUtsrgFzgPd0fzTpO0Fibhg4PfGAYKD+cdv9+xrWEY4MGD0tEeTPrFN8ycim0VuO7jzL
         jbnBvcJOCSUBH0VXJ4Q8oqYryZ9OGUOCI/X34FhtwT4fTMhAFxqQ0oAAeJ+8/cKuE8TL
         LvfN4A7OhyEgNx+J2FZBoDxGLcDUhd3qUl/UBv4jqxhJrbZuUnAxHrW26Am2WCDrPf56
         LnNFEfj/kLpK+LOTgvuw04k4ztXAUNtK0HqcAb+eAEifEW/bX3xDu//BOS1pcRIxDMAR
         uJrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736811471; x=1737416271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JqhyXDLF63DQEMYCKoX1WU8/kbOjoS3pZYIn83cjfoE=;
        b=up2sUAHAuu7fXnY7tRsRSILhBiweUiZEqeV7+n1wkmQpROOtSew//lmpp0Cs/75ofq
         uMX9dsC0FkxVp8CNgLgS0vVAk0kD1DATKSqu+4ARS+m3ZouMLw8iCdvJ9MKuYQCmgaKW
         bFUeSAUhFvKy5Si9mno/D7p7cQMaDIvgdsVb//Ck0uFUBijc4qfohqKqvqN84Ns8ZUdY
         +50rr4yP10h7naA2IeqSroXVDkuW4zvpADQxgb8XtyOoa9y9shSYdfzIpMCrGWMSMr1P
         cMUaeL+/Zcf7VlOFoSFbXMo6LYwyyHkNjXIsNYUvJ8wYqt1NQrg+Y4HUNKa7tJ/qqp58
         psVA==
X-Gm-Message-State: AOJu0YxA/IuGXamXVg3KcD3ZoNn1SibQw/DrugirRX8JChCsWlhBpLHW
	6LKchM2ysHZO/n6dHVqaIrbTEhuj653v1EqWl8+gwipb7nHyP47a+BkKoBiC
X-Gm-Gg: ASbGncuTCVay3l3szlQJuTPzrfyVNrPFPwfSwApqqOSkYUrVSPzfKMkkRm7puY6GCpw
	nzj4UBfPn+WzRzuJB2bqCxKy96QKoTsTIKoVE8JDUWwfgt1AH5epO/5R8KvlZ47o5pQ2/slGFH3
	ymqgWzMNH7JXtjlvypq86uCX/NxYe5z5adYFUmpfZJ9r6tt4gTytETO0udSZfU8Sdk/hqOJShfI
	Zr5V1xGmMMRlqo1wE8OkifTmsUMlVuEk1mh9DkhseHFjezX6I8hQpy5PDGsa2uQ8Mmt2NBgW79C
	xzQ=
X-Google-Smtp-Source: AGHT+IHVGr7d4hZj7CGN1gC0BEmdQijjWdvUu0b1HLarixvlQwfTX0JEO+MZ1k63J8iTY8WAZPNOcw==
X-Received: by 2002:a5d:6daf:0:b0:38a:8b2c:53ac with SMTP id ffacd0b85a97d-38a8b2c550emr14636758f8f.42.1736811470901;
        Mon, 13 Jan 2025 15:37:50 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bddbf50a2sm2898727f8f.43.2025.01.13.15.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2025 15:37:50 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@gmail.com>,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH v3 2/3] sdk-manual: extensible.rst: update devtool ide-sdk
Date: Tue, 14 Jan 2025 00:31:17 +0100
Message-ID: <20250113233736.4181201-3-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
References: <20250113233736.4181201-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 13 Jan 2025 23:37:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6096

From: Adrian Freihofer <adrian.freihofer@gmail.com>

Replace
  devtool ide-sdk --debug-build-config
by
  devtool modify --debug-build

This change was introduced with commit
https://git.yoctoproject.org/poky/commit/?id=1f7eb26c947dde14698ae6e2ab88f0637027f4cb

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 9a50d7fc54c..3733997fac4 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -669,7 +669,8 @@ The extensible SDK supports two different development modes.
       IMAGE_INSTALL:append = " my-recipe"
 
    Assuming the BitBake environment is set up correctly and a workspace has
-   been created for the recipe using ``devtool modify my-recipe``, the
+   been created for the recipe using ``devtool modify my-recipe`` or probably
+   even better by using ``devtool modify my-recipe --debug-build``, the
    following command can create the SDK and the configuration for VSCode in
    the recipe workspace::
 
@@ -786,8 +787,8 @@ The extensible SDK supports two different development modes.
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


