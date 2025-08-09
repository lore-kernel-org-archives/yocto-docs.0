Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85DFDC87FCB
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 06:26:09 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web11.1693.1754720761926995995
 for <docs@lists.yoctoproject.org>;
 Fri, 08 Aug 2025 23:26:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=HI4sUF6N;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: jan.vermaete@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3b785a69454so1556563f8f.2
        for <docs@lists.yoctoproject.org>; Fri, 08 Aug 2025 23:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754720760; x=1755325560; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pTGTXVHp69ujQu5Jd9oKP/DJ/HQ4avY8Xa0TgiN21JA=;
        b=HI4sUF6NVS7fRbg24gKGY54+RGmGQh2Ua0iT4AVtdURzpJZbq2hPLaLoYIPPVG85QH
         JV4t31c/g0Y4TzC426hJmjUUl9Nl0vqixnESBnILa7Q9coaja/WEHtoW50glNCPA3knj
         7ANzPrNVTrgSYOvz070zF16jYm4M9f7MgPI/Cx8OvVHzAgEyVRbpJ9i0VvqK/G1bCcmY
         1WR/4lK9Q4Ym2asNi+/S0BQwOF0U9TwffpQWeftv0NHQm7uBax7tuX8theqqB+uF8F12
         vL/L0W3n0oCPHyElnmneIpWwQoVScOv0Bk6RLbKuvPUd4Ktf0BMbb4b2bnVGipi3S8IE
         mgng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754720760; x=1755325560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pTGTXVHp69ujQu5Jd9oKP/DJ/HQ4avY8Xa0TgiN21JA=;
        b=kxtGLcGez3cGL6YQAxnSkl7jPYXKGpLUUggwZGROCYicMtAXM0+/JHbs7i8vTRI4iq
         x4oCNVDsPCOxmQuikszZ0zCDyUToiS8gkLyaSJ5p22v4+EZLBUiYuihoHOinWIFzLWHt
         clL6bdmkQWOU1jmU4pWyB9MeSsqPhB7obt0EJjgbO4LXPJ2y6meXjV5wWyopLey8dokN
         3nuC9T8FM6KTQFqS+XkTb1Vs3tDf1gYOIYKi5OLai3mcSUmccIH0lvA9/AiscD1NbN/N
         SzFfZu/+hA81fMQi8XELp80IAl0VUpMklrZHITMXVZcFTeU7pIx12DxU8tnGcLPtgUJ+
         0IAA==
X-Gm-Message-State: AOJu0YyWuHfsyxI8ufuSE0e7FzcmzYfWgOzP87eXENUJSjYLBvmOrHnk
	at3M6iOcnjjrmS9S7dbQdl48aAOiBtPld98/kdYzqsYplRJy9TeizKDzMMaPX++5
X-Gm-Gg: ASbGnct7TUek0mML53jENDxy2zFDZsARaR3cwlsSwCFhEsen9AhSe+1xCmvn9ogZc4X
	RLQx30MyKFu1KCLWGOlfT3tE7KVE/G2F1D8Y9lx5bnHKCJK55rD9LuKVdGBoi7bcVHQzB9Qw9bJ
	vgSIJ4mCv4BI/AguR+7uMIBBGLzpZuvr6Yus0RTzt7oBoT4VGrbaDIVGbh2c+kFoIRda+RqbIyO
	YejlJFMYQqZBTBadVJc7L9jJ34RmlUFk4GYkeQ3SuZFuumnKKAQtvED440YpeNCiqSXX2Vasuej
	ZRvG6wSyUqtTqoh2f54dGk2A3DkL4EExu3u8LmSgxK3VJ3icRXDhPnXW31XOs/rYIleMbRwcaFF
	W9gdAbWaks48iprk8B1xqXlUHpa80GcQXf7OUErpP1Oho4OoKKkC8KPkuI8J1+72UZXoyy+AYsI
	Onp/fWWnKHVKbwxriwERNmgnG5d1uH
X-Google-Smtp-Source: AGHT+IHaRE0iY2SLmDhRsWsjXE8xIHm5gf8FCQIabAWf2ZGA9tqGhq8xcBCqftbZSMdiogLK7bux7w==
X-Received: by 2002:a05:6000:2908:b0:3b8:d082:42a with SMTP id ffacd0b85a97d-3b900b5509amr4539663f8f.45.1754720759741;
        Fri, 08 Aug 2025 23:25:59 -0700 (PDT)
Received: from localhost.localdomain (ptr-fij45qxril34oe3x6dm.18120a2.ip6.access.telenet.be. [2a02:1812:512:2c00:5cba:763c:2ed2:f98a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b8fc28a830sm8389227f8f.16.2025.08.08.23.25.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Aug 2025 23:25:59 -0700 (PDT)
From: Jan Vermaete <jan.vermaete@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Jan Vermaete <jan.vermaete@gmail.com>
Subject: [PATCH v2] sdk: The main in the C example should return an int
Date: Sat,  9 Aug 2025 08:25:47 +0200
Message-Id: <20250809062547.1329444-1-jan.vermaete@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 09 Aug 2025 06:26:09 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7448

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


