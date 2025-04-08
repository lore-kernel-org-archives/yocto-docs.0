Return-Path: <algonell@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BABDCC36010
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 11:31:39 +0000 (UTC)
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.web10.72954.1744111894626795453
 for <docs@lists.yoctoproject.org>;
 Tue, 08 Apr 2025 04:31:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=EtJZCR8H;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: algonell@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c30d9085aso3217111f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 04:31:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744111892; x=1744716692; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pwtfI34gqZJUUPfvtaPji0DYBty+QsnbkClKZMbf5/M=;
        b=EtJZCR8HKHuo6iWLh4cq8vXGz+WHVtDI4HMu5MKWMJEb9oUOiVPeb+nhDH8FCra/fQ
         ytrsPry5XCXI7xni945l2V1f2aDBU7ch2GZyinuSFm4aRdpFeWvAsffZhO6kqNBuezT/
         rXzicXxwnGg/cFb5P9hdxaVzRvq/WWNrqwVQUvO5CN6/yIruAO9UapJYphH1KdMfHZ6S
         6X3X0brL/tG1qP3x7BkOnZ7+EyiLKfGKEktqyhBQ49f/haQuTMuwWu0NZ+NG+K+YVOen
         UdEPFLOCdpm68jKi2AIHnqWr7jSjSR0BUyzPPANYtTvSZaCSc6G3LMNRg719u+Iiwuik
         Hkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744111892; x=1744716692;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pwtfI34gqZJUUPfvtaPji0DYBty+QsnbkClKZMbf5/M=;
        b=SKmBnyF/p7gp6n1QH7/nWKh1RNNL0CtYRynHHLWXgIX/NvPZd7vCZIcyKlQVv/8q35
         t/FW47h38p4seHQSto8YPaywqsxtPgexO17CCjKZx50bJ9nulCb+fsRYiRRIQHRkmDIo
         9la0lHoeqnC6CPbMhQwkxeUSD6pUzQf8QYNzHvNPKa8X277n7j2Ug3W9cZri12dMxHu8
         1UvE2yPWMw0v2bUpsOfyB6Dh0pddK3h7Zonsc7NQ5+1UN9Y0T8i8jUfD/GENghPQI08F
         U8rfjiriIeU4sYoDMywxdZP4GIhUQfXW7MqAEdVUltJO0DiZPc0kjV3O8WP70FOdR1Y/
         WaRQ==
X-Gm-Message-State: AOJu0YwU1mBTj3q/hUgu3hsS4xtRTZvmIL+nJflBHMNf4onYQbacPF+G
	61NhO/Qzul4Vz9ZbCIDjWACk2rCmPNXghmdeJPgv1U4NNrSppHsFmHBAVA==
X-Gm-Gg: ASbGncsToAn8u9wSADIipi/8smSlYF9lwlNRlUzzEuIpmD477nHD9fdv2HiaO7RtAs5
	njdd5rKZLWPr8NNfuEEVpuJ+xOzsPdDOGEDF8M9Cupka0mum2jW7wzw0SI6iw48z5LE3gtfXjPY
	NPPodQTBygrUJJRPTgT5BoVEloiK0sRhhNPLHLch2YUc6DDplzp/cleVn79HlpFV/ZdekiNYo8Q
	hSXvoVqvNfDdQPIKUfUtFSLBRFUVlHVz7Gag9brooEe+9389P/YpKm/Du9UXPMOL0+6W0XX2Ate
	OcbTtlqkWQlKLfUMnbdoSroG8/IJNpL9+kfQtR2bB/HvzRKrupzFeXPQUWs0
X-Google-Smtp-Source: AGHT+IGLekkSn7Fsx61r5tjUO92K2ng+uoE5rFcvGMJs/PjzdblYqpm6TQO/3U3Tm4NFQj/5oBU4rQ==
X-Received: by 2002:a05:6000:4313:b0:39c:2669:d786 with SMTP id ffacd0b85a97d-39cb359830amr12766391f8f.19.1744111892310;
        Tue, 08 Apr 2025 04:31:32 -0700 (PDT)
Received: from localhost.localdomain ([2a00:a041:e0d5:e200:b092:b876:fdf5:980c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d75335591sm8389920f8f.1.2025.04.08.04.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 04:31:31 -0700 (PDT)
From: Andrew Kreimer <algonell@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] manuals: remove repeated word
Date: Tue,  8 Apr 2025 14:31:26 +0300
Message-ID: <20250408113128.12973-1-algonell@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 08 Apr 2025 11:31:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6716

The word "modern" appears twice, remove the extra one.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 documentation/brief-yoctoprojectqs/index.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/brief-yoctoprojectqs/index.rst b/documentation/brief-yoctoprojectqs/index.rst
index 3d249eefa..2f6e4cf02 100644
--- a/documentation/brief-yoctoprojectqs/index.rst
+++ b/documentation/brief-yoctoprojectqs/index.rst
@@ -44,7 +44,7 @@ following requirements:
    much more will help to run multiple builds and increase
    performance by reusing build artifacts.
 
--  At least &MIN_RAM; Gbytes of RAM, though a modern modern build host with as
+-  At least &MIN_RAM; Gbytes of RAM, though a modern build host with as
    much RAM and as many CPU cores as possible is strongly recommended to
    maximize build performance.
 
-- 
2.49.0


