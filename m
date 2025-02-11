Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DBFBC021A1
	for <webhook@archiver.kernel.org>; Tue, 11 Feb 2025 23:48:02 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.3037.1739317676247605401
 for <docs@lists.yoctoproject.org>;
 Tue, 11 Feb 2025 15:47:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=eJNyiBtt;
 spf=pass (domain: smile.fr, ip: 209.85.221.49, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38dc33931d3so2743785f8f.1
        for <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 15:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1739317674; x=1739922474; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ie9mp6FIcNY1leTHXreYjSi90CnEtcZSna6RZmGeuSo=;
        b=eJNyiBttSsBJrV8ZFDxTkMQjNJCt1SYCoz0dhHOziQlU/0Wu/+CZMF4+S2Noo0QRHe
         zw5iurESVQGtmM/7GLeQCsi041tCFvkTmFqgnYuWyev9+n8rYsO730L9iWaEfUPvYmp8
         ATvoK6cQGe3ozVqxqCQLSbjJ4cz1kG09J9sNc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739317674; x=1739922474;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ie9mp6FIcNY1leTHXreYjSi90CnEtcZSna6RZmGeuSo=;
        b=QTaIfuIVf2xHnF7rxWx4rnbu8J8Rfgc5a2D90TlcAwDiSi4yrua0+tOGD7I0MSPv1S
         7wAKjQnEfYNzAThoC/YhbQ/l8OaTvpJV41P95gsGnVthzcLb+b16gSjbGkkDhKA1Z3H5
         lqEk4xmWn9QoKL5AKkgFN4cQXoMpeHjAaLQlP/zapbMgWBBfoGnb8HnEx2POS/vLhczV
         9RribMJSDdNt09C6ds3CUkm9tMpka6lOF8ODs46uxKpKkb0YTSlnDzrcUxGGETQh5GZ0
         NSZCCb/1e/9H0OHuoax8AvtAi8WiZxj9qvi+VvXdA+UDi1twowazMJbiluFruRHVuIGP
         +wmw==
X-Gm-Message-State: AOJu0Yy4vOkkapuRwp7VYBH6AmZXm3HoesMqtqR77N4vzQ3v7gqk3NKw
	BHJSg4j672MbT1fIsa0YUG69zkHSwRswXlftKNYyiux1u4OyyFlm9OJy9XimPAFKEPDc4dMRWXy
	9
X-Gm-Gg: ASbGncv8UD9s7gp46K1qeSxjBAYTX3wPOTCAncVN6UkE23Kw+jhlvNDPTb/0BdXcFaU
	0gAHcBDw4hIUVaMqLJHoCCNyRvj7epZUBCFV8LZEUmogFuhYXxG+Tod0eeKL2JlVR2UNpLduKYV
	dvlH4Kjw9kYbVNDsvCJl5sCuYw3FWJMT+KBr3CTAK0S86V6dgslD+xyiz0r6ExcCFRkuN/iNtjV
	EhRGfoScEt0s2K179Csf1pNiuDOVU6k0CV3st80xrQWPl2hFJOdtfMCCirby1vTKFrYBkOde97H
	yOLtcNZMEdodEcOTPAtEpCN6p3hV7hzzSdYZ
X-Google-Smtp-Source: AGHT+IE5OTEyjM0cAR09F/YdMaRgdyzY4MkhfUgCf3iF3TZ5BIUqaj887q/2T3nGMISW23iPzt31mg==
X-Received: by 2002:a5d:44c8:0:b0:38d:e61a:bc7 with SMTP id ffacd0b85a97d-38dea2cb8b3mr539586f8f.40.1739317672017;
        Tue, 11 Feb 2025 15:47:52 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.local ([2a01:e0a:c04:ba00:b2b1:fd05:9faf:4037])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4395a1b8397sm2413455e9.36.2025.02.11.15.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 15:47:51 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Yoann Congal <yoann.congal@smile.fr>,
	Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
Subject: [PATCH v5 1/4] ref-manual/variables: document OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS
Date: Wed, 12 Feb 2025 00:47:35 +0100
Message-Id: <20250211234738.2633971-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 11 Feb 2025 23:48:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6345

From: Yoann Congal <yoann.congal@smile.fr>

This documents the variable used in the "automate testing a single
recipe's reproducibility" feature [YOCTO #15701]

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
Reviewed-by: Guillaume Swaenepoel <guillaume.swaenepoel@smile.fr>
---
v3->v4:
Quentin's Review
* make missing dependencies more explicit
Guillaume's Reviewed-By
v2->v3: Quentin's review:
* s/target/target(s)/
* Removed Guillaume Reviewed-by (given privately)
---
 documentation/ref-manual/variables.rst | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index adbef69d8..d56eee3bb 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -5807,6 +5807,13 @@ system and gives an overview of their function and contents.
       For additional information on how this variable is used, see the
       initialization script.
 
+   :term:`OEQA_REPRODUCIBLE_TEST_LEAF_TARGETS`
+      Set build target(s) for build reproducibility testing but activate
+      :ref:`shared state <overview-manual/concepts:shared state cache>` build
+      for most dependencies (i.e. the ones explicitly listed in DEPENDS, which
+      may not be all dependencies, c.f. [depends] varflags, PACKAGE_DEPENDS and
+      other implementations). See :doc:`/test-manual/reproducible-builds`.
+
    :term:`OEQA_REPRODUCIBLE_TEST_PACKAGE`
       Set the package manager(s) for build reproducibility testing.
       See :yocto_git:`reproducible.py </poky/tree/meta/lib/oeqa/selftest/cases/reproducible.py>`

