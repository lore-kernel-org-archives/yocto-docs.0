Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B42DC3ABC3
	for <webhook@archiver.kernel.org>; Tue, 13 May 2025 16:59:03 +0000 (UTC)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
 by mx.groups.io with SMTP id smtpd.web10.81367.1747155534559793828
 for <docs@lists.yoctoproject.org>;
 Tue, 13 May 2025 09:58:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Dl6ATudl;
 spf=pass (domain: gmail.com, ip: 209.85.210.52, mailfrom: twoerner@gmail.com)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-72c47631b4cso3611820a34.1
        for <docs@lists.yoctoproject.org>; Tue, 13 May 2025 09:58:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747155533; x=1747760333; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g8EuVc+DUvCuKDK4qx2Whvnx7SXX+yaHdhu/2wUthGQ=;
        b=Dl6ATudlod7tSITAcnvRNlpB8iOQGcK3oqIFVWEHbkvkxMYACrb4nVG9aYUxxO819/
         x5/LRuH+EyBkzr6UOTvt8+CU1lJ0/TRFcU5NfMVcBy46a/UQxVCfLYgVpgvuNO0UT/9l
         Ar7ij2EUPFqu+AUUZ4ReriBKmorpKk4yEst4tzeJPF/hgVNUdTJCVpaN9P+vlPSmJ/WT
         kwD5oX5sVo9iwQHKvMriFCgh9LZmgI9psFwrUL0RyM2thM/duOpmPkxZF2E3Ck65DgGg
         3qA4tz32h4s62TJZmTQOmUsere9/YeV67yFrqIQmljNut3b0MLpSU4riorHMLzOL16u0
         4OJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155533; x=1747760333;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g8EuVc+DUvCuKDK4qx2Whvnx7SXX+yaHdhu/2wUthGQ=;
        b=o7A/YfI7jTBEcbvJSy0PrKYZymVAfalMuyTPPGPIUuBa10hZqtCt9J8xHKYPLbWRyp
         9tb5+q0+75HDFFZLzYcohr8TuJoAwr9IKLHmi9VIOJVB5M+FzXrayHXUzq4D3tz9Okvg
         U7p555KTWyyg+j0usYYoHBspDXvh4lpPtkpuCAXWXa2VjH4MLbu0S8i9GUDJUrHQ0MvX
         G0ff2LpsP6feuVOlZ5nmL9eyUkH+CVvtvZWfd0frNXcidlKsGIO45RBgayjbqojJDj+/
         rrfT/IBF5R3UgTojlXfsJxyICbVMVtdMgb5ZC6sctM1CUm95tlcqWgn2CDQpdHaWN9kQ
         cg8Q==
X-Gm-Message-State: AOJu0Yysx3onlNiMzlR3tDNp72FC3OJlQ3iGqpxnaP0ZLTppo4bwnMLf
	HLarfHaS7KwxoIeDFiuKxxIkUi4mwk8xERY2uTwVorIrDz9pCvKsgKuKBQ==
X-Gm-Gg: ASbGncvxfNlj1whLUs23s/5hA96qCQyMFOaiJTpgF3X5VUXwBKWyZOS2CYEg6Yy97W+
	kEa+Uzm1dH+/2i+XAATD12DoJdkgtNeA1WZSUsBA6RsRlYze8QwekcDCXln1Cu9xZLAzAqIsniW
	2vHmBm1N+Z/r17EPQWG147iqKJbYxN5AzkB+tjLlCGwOcTQKNLFiKDGWQ6UJOoOfvar4fT6DE+d
	LGi62eMoTiXP0B2mK/i7pxanSbp4na9TEOb25tABJKSWVD2I7v7BsE7q40ma+AKsvR010FsjZ1t
	n9rqnVJT7zXGl+OkjnCoCLFQBioKhIwMSEUUqprYwzU9fSUlX6/LvaBahEyYn/e3hBMLLYrYIR+
	fzLhoWQNQ1lJS9yXEDHk=
X-Google-Smtp-Source: AGHT+IHqlk9Ye6YTV5OblKLFOAVEIE25QWTBSsBGIni13rWE4naWSf6/0CrbeAfiGVZSKHh8RZvl6A==
X-Received: by 2002:ad4:5f08:0:b0:6ea:d604:9e5b with SMTP id 6a1803df08f44-6f896e1833amr2145096d6.2.1747155522769;
        Tue, 13 May 2025 09:58:42 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f6e3a5249bsm69023666d6.99.2025.05.13.09.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 09:58:42 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Quentin Schulz <quentin.schulz@cherry.de>
Subject: [PATCH v4] ref-manual/variables.rst: document WIC_CREATE_EXTRA_ARGS
Date: Tue, 13 May 2025 12:58:38 -0400
Message-ID: <20250513165839.31473-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 13 May 2025 16:59:03 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6823

Fixes [YOCTO #15509]

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
changes in v4:
- added collected git tags
- add self-referencing :term: link for the term being defined

changes in v3:
- add tickquotes for -D and --debug

changes in v2:
- link the phrase "Wic image" to the dev manual's section on creating wic
  images instead of providing a paragraph at the end to include the link
- remove any reference to a bbclass
- reduce the number of "`wic create`" phrases
---
 documentation/ref-manual/variables.rst | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index d17f81036b7d..a10c5e009623 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10942,6 +10942,20 @@ system and gives an overview of their function and contents.
       Specifies the timeout in seconds used by the ``watchdog-config`` recipe
       and also by ``systemd`` during reboot. The default is 60 seconds.
 
+   :term:`WIC_CREATE_EXTRA_ARGS`
+      If the :term:`IMAGE_FSTYPES` variable contains "wic", the build
+      will generate a
+      :ref:`Wic image <dev-manual/wic:creating partitioned images using wic>`
+      automatically when BitBake builds an image recipe. As part of
+      this process BitBake will invoke the "`wic create`" command. The
+      :term:`WIC_CREATE_EXTRA_ARGS` variable is placed at the end of this
+      command which allows the user to supply additional arguments.
+
+      One such useful purpose for this mechanism is to add the `-D` (or
+      `--debug`) argument to the "`wic create`" command. This increases the
+      amount of debugging information written out to the Wic log during the
+      Wic creation process.
+
    :term:`WIC_SECTOR_SIZE`
       The variable :term:`WIC_SECTOR_SIZE` controls the sector size of Wic
       images. In the background, this controls the value of the
-- 
2.44.0.501.g19981daefd7c


