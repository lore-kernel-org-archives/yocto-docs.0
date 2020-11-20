Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web11.22670.1605860258808588216
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Nov 2020 00:17:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=M4/zTOMT;
 spf=pass (domain: linaro.org, ip: 209.85.221.43, mailfrom: nicolas.dechesne@linaro.org)
Received: by mail-wr1-f43.google.com with SMTP id k2so9145948wrx.2
        for <docs@lists.yoctoproject.org>; Fri, 20 Nov 2020 00:17:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hck0DcGXe5IPKvrcpoNQHTOVXvay1YokJ+dgai1DCFo=;
        b=M4/zTOMTTsTL8B3MKoloCvr8g065zvWaMLqfdph/y+6C4KYM+MSDoIigN1fL2idRkX
         XaDAhDWi+gen4G+hpB/PMXj6X5ICqGcCqVVEULieH8ou0JCli0p91drVILsRQ69mFWUg
         3sQpqKvZc2tNiAxXMOSV1fSUwdfg0ovuDYXGm16HlEwBXF+vp54J4oXVaOgMM1ZMcNVa
         G71CNGCYyWjSJWl5XXRd9g41G2WrUVjQa6OTLsBkmzhHm5pX7a3HXuZTsg+NvM6gYXd+
         s7OxHifl5bV7GbH7Ff0qw+uxhNEjChtVWcwT2MRpOKyRzjL647UXXJSxBYoJwizvmc2s
         VyMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hck0DcGXe5IPKvrcpoNQHTOVXvay1YokJ+dgai1DCFo=;
        b=q67f5y/oH8Uh8oohtPgfm0LglRYrcZpiPCpfrsmxW6XQb6RA8fpjIWfVWpLEjahQcS
         m6jnn9rqyGc2CS9jnO6eFgicz7fo88+pMGPr75iemz4lCmeRWME6Wv2Iik2A5zM5BMiB
         8VEHO6WTfvk5+2vK8mm8Afra4GR/m3OHOT6Rm4aKv7+YgQ/s6B/ZBT8pYDdcb0zF1E2N
         semVJ6f7ZuB6UQ4HeGQpO4ORrMpwq47wOsW2VFEPd7kxw9tpY2b908E+ZxYcfKtGFYbN
         Qu3+rI0rOj89k0lEODZMB66hRCUZg60ZksLiyFyMue8F3VF8gBhXyao5kJQPJzhNNpzv
         avrA==
X-Gm-Message-State: AOAM530Vk03mcgNknxvEOHoFB8EPzn7Sg4PerlXs5JGX11sZzZTkd4dN
	1AYY4rVZOvY5DEoUe9NX7xIcja8Qs1pdzg8PO/g=
X-Google-Smtp-Source: ABdhPJzJCt2gjl7V/BvdQQaxuS+PHtKI4Ue+uhBR/AqonI5Ot+Uzvi+AzrmGr8sLlisD4RTIJwmppw==
X-Received: by 2002:adf:f882:: with SMTP id u2mr9301801wrp.271.1605860256989;
        Fri, 20 Nov 2020 00:17:36 -0800 (PST)
Return-Path: <nicolas.dechesne@linaro.org>
Received: from matterhorn.localdomain ([2a01:e0a:1b9:3e10:6883:56ff:2b71:f8a3])
        by smtp.gmail.com with ESMTPSA id b73sm35302849wmb.0.2020.11.20.00.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 00:17:36 -0800 (PST)
From: "Nicolas Dechesne" <nicolas.dechesne@linaro.org>
To: docs@lists.yoctoproject.org
Cc: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: [PATCH] Makefile: enable parallel build
Date: Fri, 20 Nov 2020 09:17:23 +0100
Message-Id: <20201120081723.331706-1-nicolas.dechesne@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From sphinx-build man page:

-j N     build in parallel with N processes where possible
         (special value "auto" will set N to cpu-count)

Signed-off-by: Nicolas Dechesne <nicolas.dechesne@linaro.org>
---
 documentation/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/Makefile b/documentation/Makefile
index 4d721d30f..d40f390e2 100644
--- a/documentation/Makefile
+++ b/documentation/Makefile
@@ -3,7 +3,7 @@
 
 # You can set these variables from the command line, and also
 # from the environment for the first two.
-SPHINXOPTS    ?=
+SPHINXOPTS    ?= -j auto
 SPHINXBUILD   ?= sphinx-build
 SOURCEDIR     = .
 BUILDDIR      = _build
-- 
2.29.2

