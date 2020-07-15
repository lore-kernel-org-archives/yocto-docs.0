Received: from mail-il1-f196.google.com (mail-il1-f196.google.com [209.85.166.196])
 by mx.groups.io with SMTP id smtpd.web12.2668.1594850017531987577
 for <docs@lists.yoctoproject.org>;
 Wed, 15 Jul 2020 14:53:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7ibdp7B;
 spf=pass (domain: gmail.com, ip: 209.85.166.196, mailfrom: jpewhacker@gmail.com)
Received: by mail-il1-f196.google.com with SMTP id h16so3324888ilj.11
        for <docs@lists.yoctoproject.org>; Wed, 15 Jul 2020 14:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x/VU8NNek1SOIOmo8eVZt9ZFG6yq4kWJGtA76ijF41Q=;
        b=N7ibdp7BF3sV23J7LpLAnlQA5b82y4s/aaMx9Z+d7ccd7La+Y8RfEuO11oB+9DEx4o
         +/BLvrqWepvCyY5/9qT4gaW1NLLImDitM4Y2mqRAnR4isWgCxBLNNmNR93S3QHqwc23i
         QNuQPIa62CiPmRVAkdLLiN2GkLO4RTbE/6ToyQJ++GIgSiHV6ACgN76P9jvCcykUCyOD
         W0NKAWHAJADpD1RO3efcYOMv9gQlh0a4hBua1SsrtkDUVm1zBVgwDbVr/At0yFif0D3o
         Pj7lpaR5NfVYXHeIKQCxVnnNb2/JQP+z0NUK+WKrtE3cH/Rdp+y0MjY2MrVJftSY2TIP
         w/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=x/VU8NNek1SOIOmo8eVZt9ZFG6yq4kWJGtA76ijF41Q=;
        b=SUQ9JuKvzcU6WA0fz8aSHFbPYtIQvoFWpbaqujdZKHjvIUZ6OcxoB5qvufMlIJLQvi
         ovWShYpdKBejbe1+ew0n/DnKKho5gBmyMAeI6V1ioas+iEXu/DSVGm+naaemDTl2hWol
         yqKTivafH8oH/Z1U3R+Jxmv80LxJP9u6qdyFvLrabC7WtQETQyzl1erhrQJAVudB7yef
         AncYOQckuyI9+gBduSKz7vzp6WgvU5c2jfMqZWIcq8Z2esOs/Ia7qbqniJWlmnPDSG1j
         SGy/p/ewo+moVw9mFXkTVSq2lQ574UEr+knP4FWjsEB4fp0aCLo0R/urpuA8hStq844c
         U7Qg==
X-Gm-Message-State: AOAM533HwXz190KrOVDR4XgAL/ewxOsW7+gZrWTCDjbB2FD1Yv0/lRIL
	fFLjlmeZfizFPtCYf9mRhGVtIHITXK8=
X-Google-Smtp-Source: ABdhPJxkNzBq2Bo6q4eZe3FMCHZZj0ak5zKrqhxjdAltQPXkMse7JMFdLitAm53ul4LDr7bhrO6rAw==
X-Received: by 2002:a92:d6d2:: with SMTP id z18mr1531272ilp.272.1594850016716;
        Wed, 15 Jul 2020 14:53:36 -0700 (PDT)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2605:a601:ac3d:c100:a8de:37f6:bed5:6e4c])
        by smtp.gmail.com with ESMTPSA id a11sm1846983iow.26.2020.07.15.14.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2020 14:53:36 -0700 (PDT)
From: "Joshua Watt" <JPEWhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [docs][PATCH] virtual/libgbm is the provider of gbm.pc
Date: Wed, 15 Jul 2020 16:53:30 -0500
Message-Id: <20200715215330.16840-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Providers of libgbm (including mesa) have move to the "virtual/libgbm"
name to provide this functionality. Update the documentation to prevent
confusion.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 documentation/dev-manual/dev-manual-common-tasks.xml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.xml b/documentation/dev-manual/dev-manual-common-tasks.xml
index d29fe6262d..1f24c73434 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.xml
+++ b/documentation/dev-manual/dev-manual-common-tasks.xml
@@ -3190,7 +3190,7 @@
                         building an image.
                         </para></listitem>
                     <listitem><para>
-                        <filename>virtual/mesa</filename>:
+                        <filename>virtual/libgbm</filename>:
                         Provides <filename>gbm.pc</filename>.
                         </para></listitem>
                     <listitem><para>
-- 
2.27.0

