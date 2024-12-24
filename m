Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11814E77188
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 14:03:14 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.33686.1735048992844055548
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Dec 2024 06:03:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=lqPm4943;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43626213fffso37375635e9.1
        for <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 06:03:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735048991; x=1735653791; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9PId356bY6gFFUNmSD8n8li+HAjEo2d73HBvadglZNI=;
        b=lqPm4943nrQpbJjZ1+qEdXuY0QCydFHLTauIP5ve3els2knjaluZBQlrgTnMhz5gh6
         zEoSNqhHYYelisbrN9TQ5h3SBBZD1Kcly/aEO/CPyy1kAqtycVgmGro3KSg4iHeKDBPd
         xAgXP3JIcfaRTiB9NnSdaC/1lF0Gc6yX9GDnaaKsv67DUuWUQzktGGlEvQXc53ZqmBOP
         2cLBKfgdySZQGB8VfNdYlCiMljA5PEJn0tR7Gr728VqY+G6Yvv0xmOgnCJYADS5ftruy
         T+qiCiywSJKovIvDXRQKhFkUQce7BUfZpGXNs6U+wOjqxVZr8dzrSY83+uqnC8yo2MJ+
         V4qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735048991; x=1735653791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9PId356bY6gFFUNmSD8n8li+HAjEo2d73HBvadglZNI=;
        b=osMsrDRambuq7ZrX0z/gDdlmGOQkjHSdcFpoT81xTUnIY7plNRxRIW48yubmSf3vur
         CeYHys5Vw95z2XNlGM/kOHL6gCX8QFqJpLKhIMT8hsY2sifRBaQ1PJTkm7S20gPE0fiV
         zvXsB622rDxJegks4OqzhfAeWueZAr4LGaxtas8qt8i1Grux828s/gwZx7WGyUPe6RDb
         fPmjA9xPhd1lx8vLLAipn8Z6ymFgiScQUa5z8pVgRs0IEQnxVXNoanlRQV2JQNWWEepp
         TGu9atw4oemZeAVknX0qPQyqS0i4KWzOK7sr3O9QpHXAFIth3EoGKLOptXDKDlUVRvs1
         6Hzg==
X-Gm-Message-State: AOJu0Yz93YpqHig9gqlewoT4TE7N1tguljjjaTkbp9+2H+gOWUgKKlLK
	EataYNU1YTo1olnpFFLXZ6VGvG7lEPjz/cpC8ZlYgxPt+KEBG87ry14v0w==
X-Gm-Gg: ASbGncsQOIYgiAVXgq/Bzqjx1oPqcydd21QcJIElJToU694HqTqKD+h+n6xaAyrUMpF
	RMgJ5fZzgPTs1N7H1LYG0AhzR/hVVoH4dZI+OhFBkYlNeEQhIqUoeWEVnudW7DmkNmwyHoBIIh2
	Qpe1ozIJwu4saJKtZ50WcsxH+rEDvRqsP9lCxQtLetq8QJgsh07jjaSROID6KTCAZsLDkYNDJfB
	yTCOHxLTPx/elbsycZgRprgP02ZYaffYIQVbiA5lyX/hj9tqNyqJ3W0W6qQJ6mB2JhNmuM3U/eo
	49D6
X-Google-Smtp-Source: AGHT+IFiPuD0na1ItDSFfja7A6SWM1Vzc20pm8eZ/V4uRFvD6CEhRnM/Mf7yjnrV162MHw13dbe9IA==
X-Received: by 2002:a05:6000:4a0d:b0:382:4b69:9ca4 with SMTP id ffacd0b85a97d-38a22a65bdfmr12819957f8f.26.1735048989156;
        Tue, 24 Dec 2024 06:03:09 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c847214sm14204033f8f.46.2024.12.24.06.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Dec 2024 06:03:08 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH 3/3] sdk-manual: extensible.rst: remove confusing post-install-logging
Date: Tue, 24 Dec 2024 15:02:16 +0100
Message-ID: <20241224140251.24389-4-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241224140251.24389-1-adrian.freihofer@siemens.com>
References: <20241224140251.24389-1-adrian.freihofer@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Dec 2024 14:03:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6023

This is a fix for 22dc5b3be3b1fbdb9447999b71f79db055271826, which has
completely replaced debug-tweaks. But in the context of devtool ide-sdk
and the comment in the example, the post-install-logging-image feature
doesn't really make much sense. Therefore, remove it.

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/sdk-manual/extensible.rst | 1 -
 1 file changed, 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index 3733997fa..1cb1bb47c 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -658,7 +658,6 @@ The extensible SDK supports two different development modes.
          allow-empty-password \
          allow-root-login \
          empty-root-password \
-         post-install-logging \
       "
 
       # Remote debugging needs gdbserver on the target device
-- 
2.47.1


