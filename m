Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31C1ACAC5B0
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 07:17:13 +0000 (UTC)
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
 by mx.groups.io with SMTP id smtpd.web10.48071.1759130223998737802
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 00:17:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=m3CJpjik;
 spf=pass (domain: gmail.com, ip: 209.85.219.51, mailfrom: adam.blank.g@gmail.com)
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-71b9d805f2fso37542496d6.0
        for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 00:17:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759130223; x=1759735023; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=77piYU1doPy/SQQxfc/cbCi6OYh56GRSyV2Qf6KYnQs=;
        b=m3CJpjikNaxyF32UgFZgMrMHGPC6YcUMetgglJ/JxAzSKBMspTfxQn9++yCz966eNq
         V7cT0QJpfsL16HrK1Y3PrLg417r2Wh+MveiJUSN49imYf3G7Inn2IB3w0UZwYQjgRqe4
         +xdYCm/29r2P4gQsjkQmZlZK7kH9ggI9nJfy3YaGp4wYPadxPEM+tYl3sfRJAcyy1BlG
         eaCBiVDR7Sv+ZC+x5nKMC+fqSHZdTH4/MNqzX6x+GBdTLfQhmSL038J0EKF0q4L1l1Gj
         imStYA3h17OoS3CPHFM95r56mxQhAIhrviDREYzYNeTYjSlB7m20XqdZFnV+wnbihiVI
         ZVxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759130223; x=1759735023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77piYU1doPy/SQQxfc/cbCi6OYh56GRSyV2Qf6KYnQs=;
        b=TwLKrawBZP2+xxTqQ1UWrD2mR3C91Sux/QiHzIt7k2O+hwFNgxtWA+pVMLWBiOGKPx
         ehYFNksmlPRFU+CW8xWN1muHuXY8Y1YNO7Tu1VBxd3gzEjykJxeFS5ibzszA2f6zLj7x
         bSJZah1V3K1/zopANQIMxUrJdd3mhNjOWgpbZVUCUaxe59Oy31REjwsFUQhlA94Ph5z1
         cLWIn0N/RxICascnuvmt2/V8c6q0gEEbzMIJsXMyJqEgIFhro7i/MHIonOZ64L4gU7mj
         NAQXCjMWMTU6Sos8k5UXCB8TExo0yXtjpt94mqQZMaeG+z7FSZi/M1SEAuG/E0rU3502
         7s9w==
X-Gm-Message-State: AOJu0YyuFO05Mdz+NH73Oy308bhtc03tOgh7cID8cWoNXAXhX/VWdhfn
	swno0wevrBZc/lcJkEZueT13W/k1nJns85HqgYdaV0uTBMX67/VoiYoo9YjE4fbR
X-Gm-Gg: ASbGncsvQB5RX/gIya1IoYM94GsBhz9iHQ8yiNOLTQJaNIu2wTro2hwHlxrCmjXAS8G
	z2GhdNnsNkIarl9E3GznZ4RRUhDU909iPR76wh7J/xi9O+EXtLLtZwsFT6u3valR61W1YxaERUZ
	P0+mo9G5i1kA4GU5hLI6KLGInW613XSqaEUlqOCk8M9rf7d2Kzku9PchodoCkqqYfkVJlJT2iJH
	Lpm6JrDPSOleEs7QMd5AB5WUeO7F6Am8DzaqFie4ax3T5nb9QiOmueYm1WIxWcuIlFzjXyBIw9z
	7LSgVU+IGCswKN6i2vwhv3sAKhgpXUSIUOIcjmQp5AZECE4yNuiI5vkPRpBEnRYIt6AqAzuzUKK
	80IyXh3fNqXq3T6ggj5oUiLpsweUfcFIRW7GgQtcCMg==
X-Google-Smtp-Source: AGHT+IGA7UBCduWIMoZ3ckC7vBtsfJLcTqX3Dugof6oMdrMWtJt4FPndUi/Y/4czKclUsbPMpLGr9A==
X-Received: by 2002:ad4:5aa1:0:b0:7f8:6791:171f with SMTP id 6a1803df08f44-7fc2bd251cbmr243127766d6.19.1759130222935;
        Mon, 29 Sep 2025 00:17:02 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:6a55:de09:15b1:22e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-84d21f6b4e3sm20620036d6.48.2025.09.29.00.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:17:02 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 1/2] kernel-dev/common.rst: fix the in-tree defconfig description
Date: Mon, 29 Sep 2025 09:16:33 +0200
Message-ID: <20250929071634.25670-2-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929071634.25670-1-adam.blank.g@gmail.com>
References: <20250929071634.25670-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 07:17:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7627

The description of the relation between KBUILD_DEFCONFIG and
SRC_URI is reversed. In fact it is the SRC_URI provided
defconfig which will be dropped by the kernel-yocto class
if both are provided.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/kernel-dev/common.rst | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)

diff --git a/documentation/kernel-dev/common.rst b/documentation/kernel-dev/common.rst
index 654c4e0a0..bd6c3fb2c 100644
--- a/documentation/kernel-dev/common.rst
+++ b/documentation/kernel-dev/common.rst
@@ -650,13 +650,9 @@ the Broadcom 2708/2709 chipset::
 
    KBUILD_DEFCONFIG:raspberrypi2 ?= "bcm2709_defconfig"
 
-Aside from modifying your kernel recipe and providing your own
-``defconfig`` file, you need to be sure no files or statements set
-:term:`SRC_URI` to use a ``defconfig`` other than your "in-tree" file (e.g.
-a kernel's ``linux-``\ `machine`\ ``.inc`` file). In other words, if the
-build system detects a statement that identifies an "out-of-tree"
-``defconfig`` file, that statement will override your
-:term:`KBUILD_DEFCONFIG` variable.
+If the build system detects a statement that identifies an "out-of-tree"
+``defconfig`` file, your :term:`KBUILD_DEFCONFIG` variable will take precedence
+over it.
 
 See the
 :term:`KBUILD_DEFCONFIG`

