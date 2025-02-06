Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBE7EC02194
	for <webhook@archiver.kernel.org>; Thu,  6 Feb 2025 21:57:37 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
 by mx.groups.io with SMTP id smtpd.web11.54854.1738879048284599325
 for <docs@lists.yoctoproject.org>;
 Thu, 06 Feb 2025 13:57:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=l9CC0cgY;
 spf=pass (domain: smile.fr, ip: 209.85.128.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4361b6f9faeso8549055e9.1
        for <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 13:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1738879046; x=1739483846; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=tIcv9mnMozJmU98vJxxjWQXwmEds5SL9q2rGDbhoAs4=;
        b=l9CC0cgYElgCOEVM9RhYiidNrY/l3XFv7pNL8Xp8+9k1f/3af7wWBjirbu3h6OpI0w
         XXeyD4/qMzZP02DJ22pWxVP8833YNhW7gfYvh5qorKFpF4fPnclEbnRMn+VVD/cUCfKy
         6oXw0rqAsZ9oighJzFpJjRHx49f9Red6zvnGg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879046; x=1739483846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tIcv9mnMozJmU98vJxxjWQXwmEds5SL9q2rGDbhoAs4=;
        b=D5P0uzRzNzITfST94bgt+pREaorlvqKby5WTP6dGI1In2hHILzIQ+zuGnZamxueL2y
         w406GBrAQBNzkJm0fvKu81AsKQ/8kUwlrrsA6yiepS5rYfyf1LDAMfuKjALelo6m4wL4
         khwMVFFWH3jxeQBc6MjnPsRxSWh9komom+lgMK6dwD8HTowFilWsL0fECFsMLD5KO2us
         WYu9ex7LAQVFVOw7RqWSv8qjyoN38eGk5+QmeMam9/KT4VYAbCvY7gR61D+q59zTlIXV
         m9Vc/+x0+fUMzVtq4WU0M7Z5EjbPcZTRr/1CO/uHvBUN8Y63lYTAL7u4S9O7IlW9YvGC
         rgJQ==
X-Gm-Message-State: AOJu0YyqWTBA5NExgw5oXAhJMu7c4Ou3t8LuH7aV7WHu5JUn0G+8otYZ
	BLZ9u1b8C5Qr35ql7DH45LLomVvHGEsD66edf28hD8zLw2KhFEojU1JgLME+U+9BC1wZdp3AxbQ
	f
X-Gm-Gg: ASbGnctaFV0V/8WXdBJj0XIpeHhoQQ/kgY7pkGnEavcwFYsPV9k9cBJ2J9YJ+hZn5Vm
	i2QTVtDllK5DbCWCb5/AUPCiYtBGGKr8XasJTGYqDRPkhjp0D4GvmvtrmyBvf54527fSgvlHDYD
	wDID2phUQMK/Se6Xdt+hSfT6MkzXeDIv+8Xi39C34dWBByUqV71wWI3htwytms51UWEE8sGfyvj
	XZwOF0zur32guFxRgmk/mp2q0HRNbhGcBRBLUj2+mpQjVuGrdVUJxQs/CWxkVdKUinMo6R8LZ4j
	DRQ1tuBuQyqk64+72NIiexycQq2GIgjXIPiGwMtcuwjZg1CaLvn/IDxpzxxL4ivt9bwrOzSgnyP
	nxQuGeQ==
X-Google-Smtp-Source: AGHT+IH3Q6wR2GIBDlGsckH0OEngZv1N9HOwkwvckwp2gGfuUUNyF0uhGY6d8JOpeyhoUkmhApv8GA==
X-Received: by 2002:a05:600c:6c01:b0:436:1b77:b5aa with SMTP id 5b1f17b1804b1-43912d22565mr37747525e9.8.1738879046528;
        Thu, 06 Feb 2025 13:57:26 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local (lfbn-idf1-1-865-143.w86-245.abo.wanadoo.fr. [86.245.70.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db11064sm67210855e9.37.2025.02.06.13.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 13:57:26 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v2 1/3] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Thu,  6 Feb 2025 22:57:09 +0100
Message-Id: <20250206215711.154194-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 06 Feb 2025 21:57:37 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6267

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 47d4e814f..32e91b6db 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5802,6 +5802,11 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies. See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

