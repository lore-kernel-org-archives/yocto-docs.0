Return-Path: <simon.eu@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B00C0218D
	for <webhook@archiver.kernel.org>; Tue, 28 Jan 2025 11:37:57 +0000 (UTC)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web10.15641.1738064263143829421
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Jan 2025 03:37:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=dkA4h6SX;
 spf=pass (domain: gmail.com, ip: 209.85.221.46, mailfrom: simon.eu@gmail.com)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862d6d5765so3262191f8f.3
        for <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 03:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738064261; x=1738669061; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uus84HZobQ/URsooTdPAVcz3oUCCZKKEq4PWcdsCVxI=;
        b=dkA4h6SX5gZxWxzKcmw3EpIMQy5u+NxNz9njL8Ie3GqPz/jAXJZbrpItNW8A5MrPUv
         5sfrg2vKGzYu9VtINDqxqbZjnR4WJAVwZyM1iOcKR8disW5I1MTWHwUUrAJednmfvxPj
         WMOgSja3CHRl8jidcVU0pWNJgfyaaUkQt70d3HSSQ/8oulolu3mqQW0FBpLMJv+QG5bv
         HI+ckOF7G+SBI/rE+7RbYmEtH6JjUs2tDnD35p7gS2KoeVDg5dfz/GX0VC7U5JDXdu35
         o7BQzOs3pYWEJcyd/zJYcEPeRJ92lXCT+qxXdrQ3MPCDc5EFHijpPgqwJNA1qmBmfIbE
         OGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738064261; x=1738669061;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uus84HZobQ/URsooTdPAVcz3oUCCZKKEq4PWcdsCVxI=;
        b=M8JUrfBSTYRDvplSEDGZWFE/7V9DSucdFinfDpTUEX61oT15wvH6LoXNevnuoQn+3Y
         Xb+73W1SIPZbBatkGKgKnEXLmwiFXiJdGDr0wFrTRuNYxGFKGIlkb2mDbNBmAXVcVC4d
         G2DLgpCU8OkJP6l8UVWAkNfAoLj74vaR1nkHMw4eXgqdEdZpzYOBHs0Rqe4+cn4FHs2s
         beSI59FmLDgnFgEH3zQ934ISKGhJI0z1mQglloYPNTtQZl8qRmjpKdQ3bXyI8Jcch8Uo
         yCIy6M+GIqku8USrLJDOE+rhDWZMoJXt5EY6n+3jYE7A4EEGnqKEWRJjEFJMVLOojSr7
         XK/g==
X-Gm-Message-State: AOJu0YyxFBhZR8XUWLLYPbwbOcRi4Re545SHpwsMaWt6wDMJHDtkn94g
	CdM1ewM2Cc/GdshW2SNOEf0sNCbn4ieYDTtS9S0aXC7cLV0Y/sNVoVxiSA==
X-Gm-Gg: ASbGncuxuPOfVZhmUPCX/pzAz3tam8VQpkyOXORTq0ezbUyx7vh23L1XKfuSs5RmAxR
	AjNKkV49FJShenV74Iga/Aumd4TJDQ1DHiiVJV2Lh1khDKUFiCmJT60FnlRmwasJ6uzlfJRDQjy
	yTueHefBGWmIHeoNgbl+YFZx89LISaqWL7Q6iUGrYoAAjEJnRQo27jajvuIhxiBU4iB9MLWhXzH
	rrx+LSKHEy/C0bHaZ8K0RSOOwlyA3cxWsceXJIWB0LOjnmd7h2Ge0oz3rpGXE3QNQPq/KuSS1G9
	eg1AqwHrK9uJMxsb0sI=
X-Google-Smtp-Source: AGHT+IH/oOx/jtxFJxyxGNU/FAczGjvxvUbcdl3GfVjm4/OcB5SuM3j7GI/fjV8Mlj/gj5BMbd8HIA==
X-Received: by 2002:adf:a3ce:0:b0:387:86cf:4e87 with SMTP id ffacd0b85a97d-38bf5685126mr34550173f8f.15.1738064260717;
        Tue, 28 Jan 2025 03:37:40 -0800 (PST)
Received: from simon-T14-4TB.. ([46.140.188.244])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38c2a188689sm13828584f8f.48.2025.01.28.03.37.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 03:37:40 -0800 (PST)
From: "Simon A. Eugster" <simon.eu@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Simon A. Eugster" <simon.eu@gmail.com>
Subject: [PATCH] documentation: Fix typo in standards.md
Date: Tue, 28 Jan 2025 12:37:35 +0100
Message-ID: <20250128113735.52229-1-simon.eu@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Jan 2025 11:37:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6207

Signed-off-by: Simon A. Eugster <simon.eu@gmail.com>
---
 documentation/standards.md | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/standards.md b/documentation/standards.md
index bc403e393e..1ef999cc79 100644
--- a/documentation/standards.md
+++ b/documentation/standards.md
@@ -1,6 +1,6 @@
 # Standards for contributing to Yocto Project documentation
 
-This document attemps to standardize the way the Yocto Project
+This document attempts to standardize the way the Yocto Project
 documentation is created.
 
 It is currently a work in progress.
-- 
2.43.0


