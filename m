Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 331CCCAC5BD
	for <webhook@archiver.kernel.org>; Mon, 29 Sep 2025 07:17:13 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web11.47947.1759130231850719515
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Sep 2025 00:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=En4MsnvZ;
 spf=pass (domain: gmail.com, ip: 209.85.222.180, mailfrom: adam.blank.g@gmail.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-86420079b01so219207485a.1
        for <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759130231; x=1759735031; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsnlqfoIXIcg9gipeaMj/wqkMgVFQzbBAA2NUw5Cf7A=;
        b=En4MsnvZq70zJ0dEtMoPehihqtxulCXSkrD4Atmc0Z1I+mtf8K58Xvno+FPrbNDtVu
         w2cIMeQmvTVVRtZVibgxQ0njIUM2yRkvVbaerEHvhNfcRbQK3GX7zwiDtneHhqv2+/G7
         LDHJXyPqxf+SOewcGkkIUGPtabEu9o0wSXHwC6E7jn1JO1W/osJwUZDpEgaiAR6U8HS+
         Xx57Asb5CdxNZHqPxH081eI6+ZN3BBgbWG6dLuKGulBVl3vWI8eGC38NkhmbdBxa6N+H
         qcNvVUR/3BMOFQrZYJ858UaQB4J6mLTYj0/6EQNYJV1CQARQ9sEELKkxfr1eRHBQ5J9s
         K2DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759130231; x=1759735031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsnlqfoIXIcg9gipeaMj/wqkMgVFQzbBAA2NUw5Cf7A=;
        b=qtVpmn2IIxWi4RbCVyO2JAI3FiV/nu4XwLAN18FHQ2VOZL59fESY9YaX642bn01sTf
         wBnvEnHsI+UEH2pZ7PsA+N3kaIt0AjbfHxLkU7aDA1l0zA/3WkduQWeb6uiNtSobcxMH
         LcPoAyWnkY9gUWQ3vea3v0il8PwtpPuPB8Ab42rcGDwul9ntMbNV5sGFp652MPliyhIh
         Qdo2XI4SwZtrSejkGGSWSCMHi8rSjJi0gZbiM/nr5BQzxy/LJrFkllJgI9BYrqGnOReM
         Jpj59WDDXlyV3+xKwYPWPlT2TtJ91B0ISL8ElYPrLceiXCpFtVeJcbJzuap/qOax/vdu
         0MgQ==
X-Gm-Message-State: AOJu0Yy9nSpi89Yngv7ZIm94zv8+ZREuUOv2Cxc6a9rV+xiaRIEMPmrx
	UkPZ4rCmNRFYvAYikVuugHFCdC2w64N7PkFdcyIMoD80k4jjp3sgag8YOlZLmgj3
X-Gm-Gg: ASbGncuBIBEu+TXLot8dVXtMFMTuRysy6uxFz4UV+5Dz4+4p9FgV1mkcE0z6+++ptHr
	SOM9/n40TCncO5gnKp11JQcDFUTRYbZjFx6SfP7k6YtCA/CuIi9BPldKjVO9ovpccJOmXQcUZV+
	8w0IFNiIwTtyklmDXA6pZfkbPvYB5JvJ8Gp7p2PSiFrrlRtvvfi2e4z+ZAo1SiwH9hcjln2mJPm
	xUnnN6tF5/nk2oUj7JhsDaZbnC03os8td7H7KCmXU1IO28mkZKLRzUKIATLwycBc//+fVo+dc1+
	2Pl9Yau9tkr9h4mSOZrmi6Rgh2d00TuFf8+u5/k3UQdW+zXEX1IUYJhj+GTZ2gCB9CmEkKV+fZr
	OD+LuyzmFEac7u1qvlrZZ5UJc2dhiEIROxK93oSJ8X0kL1w5j29Ax
X-Google-Smtp-Source: AGHT+IF1kZRmH+/0IwtLvDGw8kbZw0SAzLsHTgd5jL4GDk1xHQBu5T7r6Bni5CbjMCoaITXcqNhhsw==
X-Received: by 2002:a0c:f102:0:b0:72e:d34:573f with SMTP id 6a1803df08f44-7fc3c34feafmr197747996d6.39.1759130230033;
        Mon, 29 Sep 2025 00:17:10 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:6a55:de09:15b1:22e])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-84d21f6b4e3sm20620036d6.48.2025.09.29.00.17.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Sep 2025 00:17:09 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH v2 2/2] ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG
Date: Mon, 29 Sep 2025 09:16:34 +0200
Message-ID: <20250929071634.25670-3-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250929071634.25670-1-adam.blank.g@gmail.com>
References: <20250929071634.25670-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 29 Sep 2025 07:17:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7628

Remove some leftover confusing mention of KMACHINE.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 18ead7d04..2f9f1a9d8 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -4892,8 +4892,7 @@ system and gives an overview of their function and contents.
       would place patch files and configuration fragment files (i.e.
       "out-of-tree"). However, if you want to use a ``defconfig`` file that
       is part of the kernel tree (i.e. "in-tree"), you can use the
-      :term:`KBUILD_DEFCONFIG` variable and append the
-      :term:`KMACHINE` variable to point to the
+      :term:`KBUILD_DEFCONFIG` variable to point to the
       ``defconfig`` file.
 
       To use the variable, set it in the append file for your kernel recipe

