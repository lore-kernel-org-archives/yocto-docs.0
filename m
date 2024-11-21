Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2B7D6ED30
	for <webhook@archiver.kernel.org>; Thu, 21 Nov 2024 13:30:33 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web11.10597.1732195830875721077
 for <docs@lists.yoctoproject.org>;
 Thu, 21 Nov 2024 05:30:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Kx8Syaql;
 spf=pass (domain: gmail.com, ip: 209.85.221.49, mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382296631f1so617254f8f.3
        for <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 05:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732195829; x=1732800629; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWwlcNwLt71eSyL7K+Qla9ULZX0dz4v4csjaJ3vMUGo=;
        b=Kx8Syaql1zRQH5xcwcA1jvr8oJ1BAowVZitF5tJ5lizx+DOm9jinA3ULhOxtSsYl71
         mpHQneZN9+Xo1cEGHflgDZC7KgOS5fySXFFau6EaFki9tz6F+yuw8tyN+nh0kZqTo1h8
         YG8M0aiQcrRx6Ekqa2giFtn1O3d9xf5lBlsQ97mq5Nmnzd2KlWOUY/LuKsgbSjp2lZGL
         M6zMd9JWnXo6szA9GE2ctfBRFJhLRbNha5pAcGZk7rULI+ng45Ya5R75t+t2cLhsHzQc
         ZNiWQJNurNiNkQd8gd7CJdWE5qRvk5CHqVm429mwlSt3FTaZKG9jFH2lT+dUHPqkrWwf
         Bo+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732195829; x=1732800629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWwlcNwLt71eSyL7K+Qla9ULZX0dz4v4csjaJ3vMUGo=;
        b=FASqzlbKeKqgGoe5zCwe2l6Cpw6vtJ/hNRpvuvgksgIPVjV5xU18v2itgKMl2kk/Mr
         xCnjHLSnR30jK/fFA1ie20LL1hBMtbgqE4TNNw0YBbpes8jtlP3KdS3O0bIBOMoWwJq0
         KI+UuqYUY8rHhnAS6tmXabDGuy5+Iie9/NVozp4dyWNgKXqAhptCSBkc664gmlUoJ8Jz
         dEVaRBS8kp6aZ3Fp6WY2eU5YUEbvkM4FPCS3h/iGswgUvLQ/Tc0NoNnIU9F3nEix2Df+
         Ex6lUb4KhkHgjlVtf4x+64PB0htK5UW2o2Mwnl/DSbNqeVLxK1R8J7trMEgtxPI5emnf
         AUzQ==
X-Gm-Message-State: AOJu0YwlI/7ZX6ou4n6351R+Yo1U/Yx/VLZk15+/M+z12PZUVBlKErR4
	jVRwE4yhgeovGKKJ6xQjezjB3N274h7bVT8yInBpREHqy/V+Tydm820SZQ==
X-Gm-Gg: ASbGnctwk30osayVhtkgPBl92iL/saoX/iwLOq1AzubkoFbv4e/n8fInPUPkghpY9sv
	qhBl6iADBpOF2iiThYzSG1di+3Lud/+A93ff2ZUijJRJvEqu9brW7TW3F587MLARmXuB3s1FFht
	MaDEAwplRc5yzEQTVAXvlOFf1kWIYnjmP6nMBbEebyTYvyHTnhq3zkOwV4FTI4BAyeH47SqSvES
	VAf3ZSV4j9FFExq88CatB8yho6GoCvLotIl9TMshDiLzcYysUHybQprFB8rABGasH7dThqvQ1ZF
	MgVNr9FTvu4=
X-Google-Smtp-Source: AGHT+IEdb1czrVhEd9nCJHNDzqrKYcKfHVFGXmy2FmqVPoKpxeLXCmchI3hcJZbNTxtRP0aadDPoIA==
X-Received: by 2002:a5d:5f94:0:b0:382:30a5:c389 with SMTP id ffacd0b85a97d-38254b1f994mr5822020f8f.53.1732195829004;
        Thu, 21 Nov 2024 05:30:29 -0800 (PST)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de. [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825493e975sm5189415f8f.88.2024.11.21.05.30.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 05:30:28 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: docs@lists.yoctoproject.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH v2 2/3] ref-manual: document ZSTD_COMPRESSION_LEVEL
Date: Thu, 21 Nov 2024 14:30:24 +0100
Message-Id: <20241121133025.1064006-2-alex@linutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241121133025.1064006-1-alex@linutronix.de>
References: <20241121133025.1064006-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 21 Nov 2024 13:30:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5787

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 30887f12c..ec4d7ab73 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10247,6 +10247,11 @@ system and gives an overview of their function and contents.
       memory and become problematic with parallelism elsewhere in the build.
       "50%" has been found to be a good value.
 
+   :term:`ZSTD_COMPRESSION_LEVEL`
+      Specifies the compression level to be used with ZStandard compression
+      (from ``1`` to ``19``, set to ``3`` by default, following upstream choice).
+      Higher levels produce smaller files, but take longer to complete.
+
    :term:`ZSTD_THREADS`
       Specifies the number of parallel threads that should be used when
       using ZStandard compression.
-- 
2.39.5


