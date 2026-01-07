Return-Path: <pierre-loup.gosse@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B40D9D0D141
	for <webhook@archiver.kernel.org>; Wed,  7 Jan 2026 17:02:27 +0000 (UTC)
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10988.1767805342169976015
 for <docs@lists.yoctoproject.org>;
 Wed, 07 Jan 2026 09:02:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=QP/x5KZU;
 spf=pass (domain: smile.fr, ip: 209.85.221.65, mailfrom: pierre-loup.gosse@smile.fr)
Received: by mail-wr1-f65.google.com with SMTP id ffacd0b85a97d-430f3ef2d37so1979611f8f.3
        for <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 09:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1767805340; x=1768410140; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=e9K/5u4+UJlMC64HsEDc4qt/PHvc73EbLMTQFEotWkE=;
        b=QP/x5KZUMeOgwhqx12LPzh5eyLoCIyXf4iqQ9dFLuJlMXctFN5rcrUGYyiur2C94KV
         mce44wwqbGZj4EX1jptl+3wrmWcuNoSSIvy7YSX1fOarOnGt533bktVxbQZ9u4/+uwf9
         iFyZP2jMHaF/FERfHXBc6v55C1eA3urWESW6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767805340; x=1768410140;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e9K/5u4+UJlMC64HsEDc4qt/PHvc73EbLMTQFEotWkE=;
        b=jbSWFLWRwX55KWoH4wPmxe6pL1emv0FrF2Bt1kpFn+eQXpfIFSyEajexvmYs6ilyNr
         zR02d6w0V8lQv2D5PdlwQnct2J8wm2Ks3GLGp9SWwhP+bouYE3UDy9LKTK9KtX2ITPxA
         1eL10Q5TrTRB/h8lCdOQMie9LebfRwVvJKDX1Fknx9B9kBCCzBnaYXnwNVH7X6iplj/e
         wDMiQMFOIjT3CJ5QSVqeY2XYuSnhN/orH2fi+7Zpzs3FHu9v+3d92mW4AB54qZwTotr4
         COEl5OGzpRlzSbJwg7M3fCLRS3AION3ceky3cE4xHudvjXtozXiPOvxw7ieTZ+ofPsuz
         LbIA==
X-Gm-Message-State: AOJu0Yz7Q8nwrYUucpZwEe/yuLaj4PiUd4VK/3nlKuTNCQMnWRCyfQT8
	kWPgGaIkx73GyDjnfjfP1SxZW5YJKQ4h/CbWuahTf1uZnWaZdGNqEcgDy8KvGDrYj5gOJEJkxYI
	56YD5hTkcdw==
X-Gm-Gg: AY/fxX5SCCLzR3siOp1XgjTUdAZQ90b/eK+Ey3p5H7kPcU3SzvJbxhV2sB1aTIFmYDm
	bGbDQTgt+x6DJYh/VtYKeKI/kNTZ821S5Gyp8uIcynEXX5a0WXZWvMYkEhCw053qnxDRv8W3eFo
	2V2ZFeAD26cSQ6s0gShgxo64ljVH2vNVRtTe7mGk3tyfSTfgQTcbYw1FR0svp4UV/T2DfLpDV/Z
	4LcJGgUuUBbbREtQ4GwqmHd3H8ynpxIPbS3PDN3VipEheywc92+xwnSvNacZc8wSOU4jnmu85XZ
	fY3HxNq2JuOVh1mLacr8iZDBYokh3/C2XpD8TrkWDF8weuqYHa0oIn3rdlOsF6Ev/t5Nct/DFK8
	qMR/Mn8/hg7el+irNhSeXGpX3pUgkgo1nrJ1os2XfvzKkl/fqXJ58Z2LUlzHubFaPQuhzfKTUlI
	UbwRXZJJH4WX9SKFu1rV2IkHZ4dnd0PbtAARI0qyt4sybeshcqYKrBCmddfnLQtXShVfZov59x3
	P3/ystkvqLocEA2RfJJWUQhSpKEUUQKz8ybvSLZk0eYqEu8aX2pkQHnWT7Jun2x2Nk9vjYKaOQq
	GjJEbKCbMY0oaQ==
X-Google-Smtp-Source: AGHT+IHYLoCAXSGxI1ciqDw5eC+Y2P9U5m1lQZFRKz/SVbyFwWyNrBqeZBo/5sog6mMZpxzN+nffDQ==
X-Received: by 2002:a05:600c:a406:b0:477:7bca:8b34 with SMTP id 5b1f17b1804b1-47d85bf0627mr30464245e9.6.1767805340477;
        Wed, 07 Jan 2026 09:02:20 -0800 (PST)
Received: from FRSMI24-BLUE.example.com (2a01cb000301bd00d0605e902e807ddb.ipv6.abo.wanadoo.fr. [2a01:cb00:301:bd00:d060:5e90:2e80:7ddb])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f6f0e15sm103054015e9.10.2026.01.07.09.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 09:02:20 -0800 (PST)
From: pierre-loup.gosse@smile.fr
To: docs@lists.yoctoproject.org
Cc: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
Subject: [PATCH 1/2] ref-manual/variables.rst: document UBOOT_INITIAL_ENV_BINARY variables
Date: Wed,  7 Jan 2026 18:01:52 +0100
Message-Id: <20260107170153.760421-1-pierre-loup.gosse@smile.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 07 Jan 2026 17:02:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8413

From: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>

Added by commit cf11b14a4cfc ("u-boot: make initial environment binary
image") in OE-Core.

Signed-off-by: Pierre-Loup GOSSE <pierre-loup.gosse@smile.fr>
---
 documentation/ref-manual/variables.rst | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index ee776c110..01bf346fc 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10974,6 +10974,44 @@ system and gives an overview of their function and contents.
 
       See the :ref:`ref-classes-uboot-sign` class for details.
 
+   :term:`UBOOT_INITIAL_ENV_BINARY`
+      This variable enables the generation of the U-Boot initial environment in
+      binary format. The binary size must be specified using
+      :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`.
+
+      Its default value is "0", set it to "1" to enable this functionality::
+
+         UBOOT_INITIAL_ENV_BINARY = "1"
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
+      The resulting binary can be flashed using WIC or any other flashing
+      method at the environment offset, overriding any existing environment if
+      one is present. Below is an example of a WKS file to flash the binary::
+
+         part --source rawcopy --sourceparams="file=u-boot-initial-env-sd.bin" --ondisk sda --no-table --offset 4096k
+
+      In this example, the U-Boot initial environment binary
+      `u-boot-initial-env-sd.bin` is flashed at offset 4096 kibibyte.
+
+   :term:`UBOOT_INITIAL_ENV_BINARY_REDUND`
+      When using redundant U-Boot environment, this variable must be enabled to
+      support the multiple copies layout. Enable it as follows::
+
+         UBOOT_INITIAL_ENV_BINARY_REDUND = "1"
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
+
+   :term:`UBOOT_INITIAL_ENV_BINARY_SIZE`
+      This variable sets the binary size (in bytes) of the U-Boot initial
+      environment. Both hexadecimal and decimal values are supported and can be
+      set as follows::
+
+         UBOOT_INITIAL_ENV_BINARY_SIZE = "0x4000"
+
+      This variable is used in the :ref:`ref-classes-uboot-config` class.
+
    :term:`UBOOT_LOADADDRESS`
       Specifies the load address for the U-Boot image. During U-Boot image
       creation, the :term:`UBOOT_LOADADDRESS` variable is passed as a
-- 
2.34.1


