Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A13AC54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 20:06:46 +0000 (UTC)
Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
 by mx.groups.io with SMTP id smtpd.web11.13629.1748117199985377129
 for <docs@lists.yoctoproject.org>;
 Sat, 24 May 2025 13:06:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=k8pCYGzv;
 spf=pass (domain: gmail.com, ip: 209.85.222.173, mailfrom: twoerner@gmail.com)
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7c597760323so87831385a.3
        for <docs@lists.yoctoproject.org>; Sat, 24 May 2025 13:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748117198; x=1748721998; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Sh1B5LAyCSnmp6kp6F2NvQAejLYnkB/uFmyY9uK8LUc=;
        b=k8pCYGzvZu3Plo+5m5d65mdE3R6EYhyG82cvbkK9ox/Z3lyBGxLuCDb3R0kW8KUX6H
         VdSrb4Bh4fveWzzwrLfXQPzAuEk7S1pLKyOysI79qlCPR6pmqlbYHbV7aAHZj1v4WBCE
         Ubu1J4yzmPYrFqsLJIqGf4tm7TutR5yHojq07DxZzWPU2Pr6IYJClr/TPI4p87ncIulw
         mQDsnxtXCdLo/V1EApIPibZwPuVPl5D6PLnLTS90R/syF3Zdnd4UucNCscXteEuqgwPq
         cMdIlObY8p9gQVSFCJLHM6P/zguYtKiJZca2gy53s5Prm2I/ECnST8cJ1BbkspH6lK5c
         CtkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748117198; x=1748721998;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sh1B5LAyCSnmp6kp6F2NvQAejLYnkB/uFmyY9uK8LUc=;
        b=Y7UPNxkTvD7pTHqkJyMF22KE6iTwebVOE/XCULmSJ5wMyZhLcMx+HfuLpFk8W2FIel
         16fGnNLj7Gxi8kU2tudLoXlIKBBo8nUUhVprAiIlT65zq4bWe452lWUF03HWe5w9PfgX
         IEqOLaeoehBJUfD6AC958+GllZeZL/ZmYVz/5sWtdbnWcOrh5qFmSfkHKouisUf5gR+t
         gWIMB5LB8iLa44AVGmYrLW8ysRWVSTmYOFRI8pCMcCg9BuCoPiDnfKyDKgrDFcDJhP8t
         949hkAxACiB7nf5E84gQy2RuiHemCuqr2STZ4ZuFB5BFkeUXfrxiWuxmyJXhxp0iRwhs
         NUQg==
X-Gm-Message-State: AOJu0YyZjQwQVRJE808EMjLrHCgjKNmHMgTypB42Eigj2QUTs6AqOzx+
	WB3qgieEYUelCVmy+SupEKXSEQLFcsOfJ6p69M3MM+CXF205FyeClWPCIlKt8w==
X-Gm-Gg: ASbGnctNIO+iBewzPrGAP3TbvqRu0lBh6uVsEpW9xYftYYat6F9tPkq2xlDDACx9jtt
	YoZyLzdbT0UY8yeOfV7qf+pzN8m7172DW2YuBuOU0PNzDzECTBxV160gKh0Obhv6SNHxqmf2KyE
	IGNjr03B+dkHerqalqKdacK6tk/cV+gR//g5kQUWjj/b1vXcPWnZ8PR3CM2YiQA5qZuc8yrMYRJ
	u7HvAlaRhnw+ARRVYTuJpbcHbw5OQc2nAwoUXlUlG/KAdod60lQXXM31SyZv1STBmzL9U/TWSMc
	LGM1JGIe9bjioWc3sHPXha/XyEue51nxmOM53fO8Fjf5usJG2M8GeTUsz07+waNAxpy5fAn/6fM
	5XkxmyTo3/4oJx2dIuos=
X-Google-Smtp-Source: AGHT+IE0/TFLTHwcvuTKbMzhfiXjtY+khtF7dH4PhSKDREBViF7DDdhVWzv4YzA8qXsbz2BdZ3VNZg==
X-Received: by 2002:a05:620a:3945:b0:7c5:4194:bbcc with SMTP id af79cd13be357-7ceecbe43famr532701085a.29.1748117198474;
        Sat, 24 May 2025 13:06:38 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467edc16sm1364274685a.50.2025.05.24.13.06.36
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 13:06:37 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH][kirkstone 2/3] sphinx-lint: role missing opening tag colon
Date: Sat, 24 May 2025 16:06:29 -0400
Message-ID: <20250524200630.4299-2-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
In-Reply-To: <20250524200630.4299-1-twoerner@gmail.com>
References: <20250524200630.4299-1-twoerner@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 20:06:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6900

Fix all instances missing-space-before-role as reported by 'make sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/ref-manual/variables.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 83fda05fc665..019285f360af 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -8909,7 +8909,7 @@ system and gives an overview of their function and contents.
       :doc:`/sdk-manual/index` manual.
 
       Note that this variable applies to building an SDK, not an eSDK,
-      in which case the term:`TOOLCHAIN_HOST_TASK_ESDK` setting should be
+      in which case the :term:`TOOLCHAIN_HOST_TASK_ESDK` setting should be
       used instead.
 
    :term:`TOOLCHAIN_HOST_TASK_ESDK`
-- 
2.44.0.501.g19981daefd7c


