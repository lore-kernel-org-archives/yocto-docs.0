Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F9A7C3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 13:54:02 +0000 (UTC)
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
 by mx.groups.io with SMTP id smtpd.web10.76670.1747144433975244983
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 06:53:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cRuq2x3z;
 spf=pass (domain: gmail.com, ip: 209.85.222.176, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7c559b3eb0bso385093685a.1
        for <docs@lists.yoctoproject.org>; Tue, 13 May 2025 06:53:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747144432; x=1747749232; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=vBEHPOghWQ+KkQmu6Fk8ZrsUZDqPc6/jbnVADx82RxI=;
        b=cRuq2x3zr6MRwA80XugiRdCKNjEwIkfZOs0iLLH3gQg6x6oGd9RBOZhN0TPyJlyMIL
         K+pOaySXpbp7y2FhLfYU9Cptfsd5jP842KrarxpC/C49778eOvbyMqhZhk1cnzmE0/Hj
         /ZbjyhAWGlpCAGpjWOIXKec6pzWO9ogn8+Ijg+oGlwAmqsbrtbb7wq+JBF2/65aLYJ+k
         dYP08XoraFWc/nPYb3rZV18TxwJgosuezjhfuyab8WLS++kutOfpNcsgAHsu1r72PcL8
         7rn0GuUVks8ho9W53jl1duJFXiFDJSjxhToIFJlTm8bibZBlBqAUp7+/AxWDBy7rs9Rc
         lHOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144432; x=1747749232;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vBEHPOghWQ+KkQmu6Fk8ZrsUZDqPc6/jbnVADx82RxI=;
        b=cmDZkhKEnpZ/MfV3bBTxiTB7GJYe0df4X5OnO0vNUZPUN63E1GBZ+sHqt5U3orYzSV
         P6eEYjRK//ifYbTVM80658DEQxGUmf66D+5Vm6WqgKt/lmgZSIOeH46uPC8hEBETz2xf
         NZ4PFyvsRhV0q0xHAN636lc8T31U+ktujK6GSOlsmlamDf3lVCXrmlwOmT+La9O0TGcz
         bjCMAm9Ph299McBt6xg4XNJ5sfksqcZHo5W+uffMosi4YokNkLpwdxohjzSIwXUrjKMh
         e2g0XubEqpU14UItZeLyafjatWjEzQCuym91HkQ5DlNpMNiMTXXxScfKme+nVdEeh3cD
         ziEA==
X-Gm-Message-State: AOJu0YyRI/j09BCJ0rYq9DXptUBupIRvkLrgK/gK4yMTCPL+dqiSSxMp
	kM96mZB8HEJlX6WXnmINd0zmycJdIG7JpNIRUb1P6swl3kot9+eNWYs5lw==
X-Gm-Gg: ASbGnctckJdTDMcvacn3Y8DVVxzEzNJnL9iAoMr9meq9uVU1E9MSRtm4MWz8aaWe5mL
	e3NIoSF5e78IDHnzxJmQpA6B878Eenne4SYQrBUx8euOlHlsNTl40xgWAT0nhrubZNrouAhnb8A
	ZCFprYH4k0+gEzTeLe+WkhLIrIhmwPPOnMFlRL/yl+nZ4sUlLtloT/vndyFgyrnZ2cmeMddOQgQ
	bufRyMBg8MoNG7KYQi4JgOMuybAaZr+0sAcZh1I7XAvGtXPBnxg9eP4j9gHCm6tekSlb7Dl3uMb
	xGmtxsAhqwAUg6wwKj6vlUrn2gkoKTRWFfbleaFuUQuOa+Vub1YM823hc3QKQGqNuvWG3p2pHKA
	obMXGqIzO/1oHScF0rA4=
X-Google-Smtp-Source: AGHT+IFHgQ69xshH1U0NuWkdW9UzcE69leECCMxf7sebXdw8+NnqyXVri7VKHUprKday85u3Gk4S3Q==
X-Received: by 2002:a05:6214:f2c:b0:6f5:41b8:47ed with SMTP id 6a1803df08f44-6f6e470e2fdmr298277646d6.0.1747144432269;
        Tue, 13 May 2025 06:53:52 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e7aa0bf3sm58791826d6.65.2025.05.13.06.53.51
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 06:53:51 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH v2] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
Date: Tue, 13 May 2025 09:53:45 -0400
Message-ID: <20250513135345.38651-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 13:54:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6819

Fixes [YOCTO #15509]

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v2:
- link the phrase "Wic image" to the dev manual's section on creating wic
  images instead of providing a paragraph at the end to include the link
- remove any reference to a bbclass
- reduce the number of "`wic create`" phrases
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7d..1ba687820131 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10942,6 +10942,20 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_CREATE_EXTRA_ARGS`
+      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
+      will generate a
+      :ref:`Wic image <dev-manual/wic:creating partitioned images using wic>`
+      automatically when BitBake builds an image recipe. As part of this
+      process BitBake will invoke the "`wic create`" command.
+      The `WIC_CREATE_EXTRA_ARGS` variable is placed at the end of this
+      command which allows the user to supply additional arguments.
+
+      One such useful purpose for this mechanism is to add the -D (or
+      --debug) argument to the "`wic create`" command. This increases the
+      amount of debugging information written out to the Wic log during the
+      Wic creation process.
+
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
       images. In the background, this controls the value of the
-- 
2.44.0.501.g19981daefd7c


