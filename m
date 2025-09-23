Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0F4BCAC5A7
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 12:14:42 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web10.15346.1758629673680250239
 for <docs@lists.yoctoproject.org>;
 Tue, 23 Sep 2025 05:14:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=TlaP9kS6;
 spf=pass (domain: gmail.com, ip: 209.85.218.46, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b07d4d24d09so930388666b.2
        for <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 05:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758629672; x=1759234472; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lsnlqfoIXIcg9gipeaMj/wqkMgVFQzbBAA2NUw5Cf7A=;
        b=TlaP9kS6r7x/N/3Czz/V83VWgkXgAkH+HWPLjsit0jPmPbTFjdqrISIjV50j4rVtz2
         HEhFpD2vjvXTc0h4a0tyB4rHodfJxCzwhS9CPCF2JBYivdw6ObGKfPEjbukEGXO2jX+N
         NTgRYy2pevdaYXHGVKCxuPgL4l+WCNu0H5ZYApNyFWfdnNXVaV+4U+KvGXbn2rWdDDXt
         X6S/X2yGGXLnLhtCXy/cbhGcSskQ9sfMY9HDPHQHjXGO3g6mkdgF3/SbCShnB56kbJqL
         CWFNKqeFQxWkW8piXuXGFppoASHTSqIajXnSyhesrvjejeX1X6GtR0ms92s14WizAXXb
         UqBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758629672; x=1759234472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lsnlqfoIXIcg9gipeaMj/wqkMgVFQzbBAA2NUw5Cf7A=;
        b=SVcMm/ACrwaY0gwKkBWckkuWwszXsT+fzi+cuCrgpUr2Z+ZZq3Ahu7Ev3o+Ei3YXnm
         Yfaa9GIn6d9SOxnXH0EXq/qimX12Z0XPnI7ct8EsZEuDpfrLRbFWvJwoN7plM/10oQut
         z5wefVR3W07wW6iQjs3YS5kY1L9gM3cdR/2HOfVcDLyrdTtTFkarv0btUKbvKKIfABlP
         iGGvd5+EjRzrdLcd7YFut/IB9TfIpC4m8wUTcw9e3WTHS5oT0W0Da00KzE5k/PuNEJ67
         LvfCvNQMaCUWDt9nsMKdFvqOWAQoy/ICgfdUM9TxpXPBK6NLH+mLJbVWGzJvKwDwZX66
         m5ug==
X-Gm-Message-State: AOJu0Yzc601Yri42qRZpERpJ1/C7EdA74QOcYe90w8gQlvik/vNfD7Vj
	sXfe5VXeYkB/e25PmqJRpe/K09Xm4yHA/G6qWqstXP8DUSnrx2opgmSJxqI1QQ==
X-Gm-Gg: ASbGncs4vsylwB03ZgLWTvRJ1qlGfkloiVHtw4wd1+Hv14Nh/rXM6l/VwM8ErXA/KBO
	V/zobQlRaQAFZFp4h12y0s7Q/T8eQhsPF3NIJVwDdJRqXWF80ynsqCevKIUWxW0UHckW8BXMfyf
	1DrRaCX0J0jatUE24EN2D1GOYjmPNrUv6kZR1iJrzWY5gy3AwrulTRBbZUvUg2sHU3TL0czjA9L
	VK4A3f7k7rCFe6bdbsDuLpzoEqLSwdfabvjT0Eklt8jdN7Jf00Vi/s7YYyBJJwsKzQvJTsqYHFk
	tK3A6Ws3Oxq8aMhyss5fSyqM3Orum8+8f9m8QgkF/VG2qsYfJPC63r/kahMd4SAeqBsQgdkp/Ol
	v8rbg1ZyAoNu4FjzyY/WSy8gvYY5UdcDvwZEgjbCKX2pIKXlbdQOiCQ==
X-Google-Smtp-Source: AGHT+IFWvq0cXuFaT/curkazWwc3+BEz9YmF9vzcHw4g7u3k/tmg+QYAvFmZhUMF0gVpV6yyZnMIwA==
X-Received: by 2002:a17:906:2744:b0:b1f:ecda:b79f with SMTP id a640c23a62f3a-b302b5104demr204127366b.38.1758629671854;
        Tue, 23 Sep 2025 05:14:31 -0700 (PDT)
Received: from localhost.localdomain ([2a02:a312:c8a8:7a00:b152:c504:c01e:e617])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b31a562fe38sm19852466b.45.2025.09.23.05.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 05:14:31 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
Subject: [PATCH 2/2] ref-manual/variables.rst: fix the description of KBUILD_DEFCONFIG
Date: Tue, 23 Sep 2025 14:14:22 +0200
Message-ID: <20250923121422.24593-3-adam.blank.g@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250923121422.24593-1-adam.blank.g@gmail.com>
References: <20250923121422.24593-1-adam.blank.g@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 23 Sep 2025 12:14:42 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7582

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

