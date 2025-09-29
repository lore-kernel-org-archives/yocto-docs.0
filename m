Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50EE0CAC5B5
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 07:17:03 +0000 (UTC)
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
 by mx.groups.io with SMTP id smtpd.web10.48067.1759130220646836811
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 00:17:00 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D1/0qv5a;
 spf=pass (domain: gmail.com, ip: 209.85.222.171, mailfrom: adam.blank.g@gmail.com)
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8593bcdd909so454187785a.3
        for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 00:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759130219; x=1759735019; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JgW5N7Ry8t9oybqdrgZARLgcoJulYk4uLYo3NhUaW0Q=;
        b=D1/0qv5aTqJUB8JCfoOzWB5hnRoty44+Vcv5+D2zUTYNV/ufDNDK8PG9SX8d660bBu
         C1V2ZdHxM5X3zLkul9e3YHWL3z+q3vmCiS+LlUlcRFVYmpDpn4SxZIAdkav2T2dU+jC0
         BZOK1U8GsF6LN4SI/TGg7XGRVGbv7W1I1RHAfJSuoIFvkvvRqb5bWEJuv0dhpHhYOkS0
         avmc9ay26PWbLdxvXjC0LSypm+uOBG9M62kxOprRsmSWlDq3QC4mio89lTlFE3QaLfmO
         Wn9h+NLrYdohlX2fLpPZNRu0y+Q7wk0LzUzbPr7EUiGOQoa0WHXuE3H9rG6TXk+MFu0s
         YNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759130219; x=1759735019;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JgW5N7Ry8t9oybqdrgZARLgcoJulYk4uLYo3NhUaW0Q=;
        b=rqFJxyH2u456WjHJjkTV4hAYoNbSA2fsiiRp8LlmuSpHIa7hBMcxIY8HGurxixLH3c
         K6K3UZIzscOa7aZez2kJZ1WdnnP11oGPF7qMu3xrdL8tjGK3iZuo1HCG4Odw+7UKJDHX
         0SQV0ppCr9Z/4R40RTlW315up9LPwS/Y2QDFGTpbrcU56w/WgYHahJ66bREeyAngry6R
         mO53i7LaVgaM61usxEKwJQ9fiCx6BSynP4h0QSFv78e3pawz142T81zS7HgulJDcbe+j
         f3W9gTSC5ipzu20vnvo18UAvSeYGyyVATG2bfVPTKCtWlhFAYIwRCh7ZVK4CIOlXhas3
         8tZg==
X-Gm-Message-State: AOJu0YyMruEuhLX4LG0g25kPPbsAd7q0hrMPvaIwerZ6g+B5eca2aeBK
	eYMWfY4dXaa4Mk0qBNBtNIkSK4rzpiVt0d2yiqMG0qhp/OEPjGuoBjMCJ8KSnqsV
X-Gm-Gg: ASbGncvPtYy8QM0AbjiT2Czrn1JILh1NeBryWEozRP33lm/jCCBxe+rH0Sl4dbzeNuN
	p8w2QnOSvPuQkPuMjXDgNBNxTb14Fa6OTZR6DQUlYKvmxjt9RXuQeksa4B3OsF5qdWGqbBtMJee
	xGatdv23OgFior8RhLpxoamTJxoycaRmuR0uWFBgg3GhcTcqH0BccM3JmLAtlb9ssjAWX3LfdDV
	IBKRhxPVEOBfVqnUF85AydXpuFN/LqnBnWuVd3NIC68i+IWUahkCTY2y4n1ERn5/LR4MxoUUHfV
	MxcurRz5Sypo8brbog/hV13Lowi5KKYJsGIyHa0AZQDmxMW7SKGj8XXEDK9FhdChHiK/QTT8jAA
	ciZtZn3se8CRSwRbr92Fa0RlJs7O6jSQ5uwz+1CTJRQ==
X-Google-Smtp-Source: AGHT+IG/tJtxJ8exTe8Hza95ihhiUeN3Rdml6ZUCZFOPTdTNLTaBgwAH1tJcGR2xmBgSv20dxklF3A==
X-Received: by 2002:ad4:5c8c:0:b0:72b:5e10:55bb with SMTP id 6a1803df08f44-7fc49fb7f89mr209278216d6.48.1759130219473;
        Mon, 29 Sep 2025 00:16:59 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:6a55:de09:15b1:22e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-84d21f6b4e3sm20620036d6.48.2025.09.29.00.16.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:16:59 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 0/2] Fix KBUILD_DEFCONFIG documentation
Date: Mon, 29 Sep 2025 09:16:32 +0200
Message-ID: <20250929071634.25670-1-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 07:17:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7626

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
Changes in v2:
- Reword and simplify

---
Adam Blank (2):
  kernel-dev/common.rst: fix the in-tree defconfig description
  ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG

 documentation/kernel-dev/common.rst    | 10 +++-------
 documentation/ref-manual/variables.rst |  3 +--
 2 files changed, 4 insertions(+), 9 deletions(-)

