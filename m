Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21A8AC00A98
	for <webhook@archiver.kernel.org>; Thu, 19 Oct 2023 21:49:03 +0000 (UTC)
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
 by mx.groups.io with SMTP id smtpd.web11.40422.1697752133541405418
 for <docs@lists.yoctoproject.org>;
 Thu, 19 Oct 2023 14:48:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hYl1fGuA;
 spf=pass (domain: gmail.com, ip: 209.85.208.178, mailfrom: bhstalel@gmail.com)
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2c50d1b9f22so2268371fa.0
        for <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 14:48:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697752131; x=1698356931; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvVLEAk0/4ACR5ZX+Ers46A6tamRZX7dOtzy7qXAaaA=;
        b=hYl1fGuAYii2SOYffnW4qPM8vtd1bVmrgLuXWVZLaembRPvrSWbi5cBC8ir741u9vf
         l/9EicMCyNItolEBWl7LGwxyxqOi0mmqwjau3Q7NvapiravZ0FAot6aWunbFCNpo8mGi
         s+eoDFy7ywh3/YlpaMZDNmHfxlzykBYLmDb/5nTY3isEqTcXNMG6RZXi8cis3iA9AWqP
         BZ7kaWNhhFdmec7vXrZFznmrOkoVit9gVGpRc6rSTLdPfeg3f7ryKYu5JyFewDQjUpZG
         6TR89ZOd6pszPILWMdkCvopJ4WVfuwMB39YG3OpmYF800jsHocvdft5dcQpy300XcOZ+
         wTGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697752131; x=1698356931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fvVLEAk0/4ACR5ZX+Ers46A6tamRZX7dOtzy7qXAaaA=;
        b=YwGoogbFCXVI+9SXhHg179NPgrrOkm4FfilYF+dZ6W8xvmYeWGkVEX7L/GrJ9nCbim
         saSU1btQyTpDVXG+G6Zbj9NXGj1/BqNXEURSO79v/eJv1iy9CutJR4RfDN0Zzmfmxaz3
         RAONQyoyE47376R8McM9JqmMF8TTMnb89SPp9VOL0gnaiBr0iXtIfwZff92w8DEgCFCG
         WosPJRwI5p+4Iu07Xch0blR4UlaIWTDv3Flpn+uVygZOYU1W7wEdk0a/q+obbJhZzOzn
         +cp4th4PMlng7zL5Gx1Qrr1ks6wxtDiIheXIab+5dmiae8n6lreYSW2rWOMXk0XkYKa3
         YkBg==
X-Gm-Message-State: AOJu0YzQ36HaFU32nXCM/d5mIFlzk/oN7guvMIeiZ+e5BNlz5ZrgBIC0
	kubi4XAUHQ0vEaoxMz71E15aio8KqjU=
X-Google-Smtp-Source: AGHT+IHozrX2oSAWHjwSy0B4fD3rlH6b5KJPrwgXd5ZU305ykczfNKtVdz7LqIptQmrruhY3k3CJbA==
X-Received: by 2002:a05:651c:50f:b0:2c5:6df:8b24 with SMTP id o15-20020a05651c050f00b002c506df8b24mr122914ljp.41.1697752131253;
        Thu, 19 Oct 2023 14:48:51 -0700 (PDT)
Received: from localhost.localdomain ([197.27.108.75])
        by smtp.gmail.com with ESMTPSA id n15-20020a7bcbcf000000b004060f0a0fdbsm5341724wmi.41.2023.10.19.14.48.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Oct 2023 14:48:50 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS variable
Date: Thu, 19 Oct 2023 22:48:26 +0100
Message-Id: <20231019214827.405886-2-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231019214827.405886-1-bhstalel@gmail.com>
References: <20231019214827.405886-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 19 Oct 2023 21:49:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4431

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 22787f3b4..958b98fd6 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9134,6 +9134,16 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_OPTIONS`
+      This variable holds extra options passed to the compiler and the linker
+      for non ``-native`` recipes as they have to point to their custom
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      Native recipes don't need this variable to be set, as they are
+      built for the host machine with the native compiler.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.25.1


