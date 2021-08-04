Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.web12.6807.1628070437308647004
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 02:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=cwvP78IG;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.53, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f53.google.com with SMTP id j2so1502786wrx.9
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wdxMfx2fEbwbo+bt9f5ydpN0Ph1zrLtmlWEuhkzIC8=;
        b=cwvP78IGBa2Y/t4DYwdNfgaOikijQUarJ1eE4ThVnK76jqmwJi1/JsyJbLOzp5fCxC
         LAR5k7sO3U0SFTCAXBDhsuiUygflrzvT+3if3wYhA3QlKnHUot89VMBk6eEEWB1xwRdd
         5bK/+R/GN0ZGAC82TkkhfG6d7EsUag1znCgLM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5wdxMfx2fEbwbo+bt9f5ydpN0Ph1zrLtmlWEuhkzIC8=;
        b=NB1Pd0eFetURXwwqPSuNLPzsf87BizqAeQN8OpTssXIsp04QueRYBIJBLrlU1g3ebJ
         VR6QormHASd0QhMfDj8kDaa87I29IyTfMPlm1hLZiwXSHotMS2Gz7L2rhl9QB1g8IyOX
         IXamuXpWrvlPLAVMVXRkzZUDn2P2HFLccgvwohECV9rRFPqvxD+bWCkLKxpLrKZ3xsH7
         pIfJOURelt0utHVwxWOXZwNp2/k6T32PL/axudp+WwLxmFlVL5xT3JZHHbxLvA2jP+hF
         JygMlEVZl7hHftrkVqqXycERLsqNvfmfrFiHVxEBl2S/f4kpMUPgZWhAiiUvTvLCsr3k
         jA7Q==
X-Gm-Message-State: AOAM530FbkREQubQLCz0AOyZgt/Xy8cr8yndnCZEwar+HmhspBU0m7k1
	61BsBkVcfm5NiepiXkvfIB9MeDOxNmQ4zw==
X-Google-Smtp-Source: ABdhPJyhgACXyh5w8fw7e2p2nCGDaIFWtmxSRc4vPiVoU4nOI6mmwdE0T/QOkGd+Jq8a1CkXDUrX+g==
X-Received: by 2002:a5d:5111:: with SMTP id s17mr27267269wrt.227.1628070435633;
        Wed, 04 Aug 2021 02:47:15 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id d16sm1826834wrx.76.2021.08.04.02.47.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 02:47:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/2] test-manual: Add extra detail to YP Compatible section
Date: Wed,  4 Aug 2021 10:47:13 +0100
Message-Id: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add a note about documenting where a layer doesn't support 'core'
functionality.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/test-manual/yocto-project-compatible.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/test-manual/yocto-project-compatible.rst b/documentation/test-manual/yocto-project-compatible.rst
index a7897469f..b83a0f12b 100644
--- a/documentation/test-manual/yocto-project-compatible.rst
+++ b/documentation/test-manual/yocto-project-compatible.rst
@@ -115,6 +115,11 @@ Here are key best practices the program tries to encourage:
    user changes a configuration setting to activate the layer, by selecting
    a :term:`MACHINE`, a :term:`DISTRO` or a :term:`DISTRO_FEATURES` setting.
 
+-  Layers should be documenting where they don’t support normal 'core'
+   functionality such as where debug symbols are disabled or missing, where
+   development headers and on-target library usage may not work or where
+   functionality like the SDK/eSDK would not be execpted to work.
+
 The project does test the compatibility status of the core project layers on
 its :doc:`Autobuilder </test-manual/understand-autobuilder>`.
 
-- 
2.30.2

