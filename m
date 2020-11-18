Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web08.22013.1605694031589164885
 for <docs@lists.yoctoproject.org>;
 Wed, 18 Nov 2020 02:07:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=BeDYxm+H;
 spf=pass (domain: konsulko.com, ip: 209.85.221.45, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f45.google.com with SMTP id s8so1538777wrw.10
        for <docs@lists.yoctoproject.org>; Wed, 18 Nov 2020 02:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VftsvAo892z4h8mmwqzp+nHSnGMJZQxfa3SBlRQw6Uw=;
        b=BeDYxm+HHrMgk9KeTsi7020oJimlDVvL8wKXOOSUzrj/S15s1/mQ6Z0YnpT0XVlU5+
         MY5pfffCbWkGCzJGSYVINwrltgvka0QAKTfOJXPWKv9Ccaonl60YBEFoUGc67LTDlAyA
         nYpWUSQALSd1zlFWVhv3nIJYNyKYlSYIpHU/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=VftsvAo892z4h8mmwqzp+nHSnGMJZQxfa3SBlRQw6Uw=;
        b=qN59UZN3zDrKH3OeHZXt5pVcpo3eLeL6kDSIRAQzW67kN1PP5nOtO/mSM26EyxtYsa
         rK+iiqErk0v93XdUB8KVd3BT6ojwuumJ0Q23o3VH1cJdl6IiItkUs+Qu44ij2K8ZAp8g
         fr3YQI3XMe4U53NZtIlvb5ssyDZsJklrlhwG1ennfE2S70RlZ6Fj6mtCmZ2G/N3REa2z
         bSYyhdXz1NQXItOt8VQz0zB9pDTnTwHAMjvH7bkHq64fYlFqDSSJtO2olei+YvD4eDM0
         /cZ2FdMhefkLGFRpluVz8nzp/KX+5P8PHCTq5dV/y79n/CdYZeSdBweWG4Ke2r9Xomrx
         2L+w==
X-Gm-Message-State: AOAM533Lwe0QcDAWD4pv/x06C7p17JqNOUBk1JCbXtgmMtSWUU6nS1Ak
	XF0onrpiT8abm1FkqAiXtooVQxClCa/6Og==
X-Google-Smtp-Source: ABdhPJzWHAk9arYtMyaW5qdRsNRJn0rkSBwV5NaM0tDQmy19/tSyGQVUAncA36ALqK/NwA8SDyBq5w==
X-Received: by 2002:adf:82f5:: with SMTP id 108mr4139782wrc.269.1605694029399;
        Wed, 18 Nov 2020 02:07:09 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id a128sm3013391wmf.5.2020.11.18.02.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 02:07:08 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 1/9] conf.py: Add oe_git directive
Date: Wed, 18 Nov 2020 10:06:57 +0000
Message-Id: <20201118100705.3656-1-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This simplifies linking to git repositories on openembedded.org.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/conf.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/documentation/conf.py b/documentation/conf.py
index a8df6e8f8..96118abec 100644
--- a/documentation/conf.py
+++ b/documentation/conf.py
@@ -78,6 +78,7 @@ extlinks = {
     'yocto_git': ('https://git.yoctoproject.org%s', None),
     'oe_home': ('https://www.openembedded.org%s', None),
     'oe_lists': ('https://lists.openembedded.org%s', None),
+    'oe_git': ('https://git.openembedded.org%s', None),
 }
 
 # Intersphinx config to use cross reference with Bitbake user manual
-- 
2.20.1

