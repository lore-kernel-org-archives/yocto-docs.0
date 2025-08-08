Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EC7FC87FCB
	for <webhook@archiver.kernel.org>; Fri,  8 Aug 2025 17:48:41 +0000 (UTC)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
 by mx.groups.io with SMTP id smtpd.web10.28636.1754675315983461026
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 10:48:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gYTODkUO;
 spf=pass (domain: gmail.com, ip: 209.85.128.54, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4589b3e3820so25349275e9.3
        for <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 10:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754675314; x=1755280114; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTGTXVHp69ujQu5Jd9oKP/DJ/HQ4avY8Xa0TgiN21JA=;
        b=gYTODkUOnDCX6ny/EbwhbZ3xCpaLWp69fa3oiolNZPm0DrFWzkf1EpM/RhYsnG8OB/
         x7LUO90WQ8OheJ+ETak+UTGbazlTyxIZLMl8SAorPVi4uAMJzOmBg9yMx/70AcJ71q4J
         +I8Cf/vGO1XBaidMFihaNtd8mQfr3taJlSrC/eLxChJqG5t0qzhNVq54kO/4TlJjc51c
         PhkZ5HaiseSemKvu986gNjRX0UEfytAJd/HgOeCtcTD4i4iPRNIxw4JhLzlBaPEAEdRJ
         UyMlo3m5CG7/7EczD01X3GfXX/lmb0E2uHs2EzrdFFVNM/b/O7lKi9iSUXC9UbzeCRj0
         zuZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754675314; x=1755280114;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTGTXVHp69ujQu5Jd9oKP/DJ/HQ4avY8Xa0TgiN21JA=;
        b=AcJAgGE6dgsrDAEMkjFFhVUODuquzcz0HOQJ+b5Yvb4SrfKD2Kyh8G57jLpx5Rc3t3
         tsCrTjL6PuwueCvKQc3NdDgvLP7E0ScZBXM0ZbhhSy+Xvz2+0+nCHSRQI00EMphCZbYh
         ApG6ukZbq7bCYuESgBiNG3OYVHDBvoeM729Ite5KGweLEM/vg1K00zcFv/RxAguV/vir
         PZEXhlvhox7vjSew5x0aKbTf9Q+7xIS8a5IZi2PaJ5WUNPqzp0tuvTStCQ+amn+1g6aI
         tmxD3RSNeUUFy92cu3sUoJ4P/FySTfUC8fcF2fXvPKviUb89ap6Hi8GlqrGpEd2LWjcg
         SiZw==
X-Gm-Message-State: AOJu0Yzxcfs5AwZ9lgM06d7I8u+U8AIObk570NN5pgZGamNThNCXNyO/
	zK+/rdKNGrFFihqBIqL31Rsj1RZDmHyk+B0Iqtdi1HjvW4uJkEqrnEvOIu6ZteVb
X-Gm-Gg: ASbGncuhIQWXEpH3dLtO9NfzYq/Evf2fbOS5FTBrtQRJR/GR3LcMXRVpDmmebF+mhVZ
	KIFtOjapy1xXXvoIxfsNRwZVCkAHkrULLLhBuzLuPMgeehQtuar3Hlh49MlzaoouaHfq4GnARa3
	oqcYXLIa5cnAhkOUpxR2w/Bj6UMNMoTUIlAqme10kxbajo/XKHum+GYUuGknYPu01HPDb8SdlMV
	2Q435e+PJ/3pILu2642inT5Nda0OCPLxgToMlt4OI1oo07jAOT/1jFnbhPkps+LNgbLjaRlzi7z
	t0z01VDxrXFE55uEQinG1PC/61hOb7glduQUL0H8aWCnjy8bx1dlX3cWDTJjxD2UX0oF2mp/aVc
	ZLmkaeMAvjp0k/O85bm6n3W3caUBlDgd+YhVUQpIV5T8NpUMius05MYQ8tTa1Ztoseo7xjUijrC
	XeHVX1GEkQbY1hdiZaOWAP0ZlmkmgH
X-Google-Smtp-Source: AGHT+IHhpfNt0a+3k2BFal8bBJEAllYtVa0Yf5E5Ey9PNPCpJPJLIgtzYjX6+Q2qpJSJPYPX7E7yqA==
X-Received: by 2002:a05:600c:154d:b0:459:d780:3604 with SMTP id 5b1f17b1804b1-459f4f3cf5dmr41589865e9.3.1754675314002;
        Fri, 08 Aug 2025 10:48:34 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-459e5e99e04sm142041595e9.11.2025.08.08.10.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 10:48:33 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH] sdk: The main in the C example should return an int
Date: Fri,  8 Aug 2025 19:48:28 +0200
Message-Id: <20250808174828.236218-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 17:48:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7446

see C17 (ISO/IEC 9899:2018)

Signed-off-by: Jan Vermaete <jan.vermaete@gmail.com>
---
 documentation/sdk-manual/working-projects.rst | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/working-projects.rst b/documentation/sdk-manual/working-projects.rst
index 4236bcec2..7df73b1b1 100644
--- a/documentation/sdk-manual/working-projects.rst
+++ b/documentation/sdk-manual/working-projects.rst
@@ -56,9 +56,10 @@ project:
 
          #include <stdio.h>
 
-         main()
+         int main()
              {
                  printf("Hello World!\n");
+                 return 0;
              }
 
    -  ``configure.ac``::
-- 
2.39.5


