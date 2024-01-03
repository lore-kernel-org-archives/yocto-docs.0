Return-Path: <iillyyaa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F27FEC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 19:25:46 +0000 (UTC)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
 by mx.groups.io with SMTP id smtpd.web10.26487.1704309940166461651
 for <docs@lists.yoctoproject.org>;
 Wed, 03 Jan 2024 11:25:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bM4uuakv;
 spf=pass (domain: gmail.com, ip: 209.85.222.172, mailfrom: iillyyaa@gmail.com)
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7810827e54eso1000591785a.2
        for <docs@lists.yoctoproject.org>; Wed, 03 Jan 2024 11:25:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704309938; x=1704914738; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ePM2QFEf84jkQjXi4mMoaN4mv2SRUP4BRJFpeeTOD5g=;
        b=bM4uuakvsC66A7/W8PS02htqpIZyMXPyeRuSIxFKQ36XJ6gUozFTaJ5hxSRNtBpm3g
         PWa82eRxk7/I+xN6T+0miEzjaoQmNVZnbJS+VpHA3VwKEbSbkok1Fir0rz79bzehSi+O
         ZmmxOTS15AFYKm7gP09cveqxB1Vy2PH86Eo72gTHvUhuqiOeVaxq07IcZRoRO1RrlwHB
         brLkglWoyuP32YBowi83YxBtBwhBLRF1sq60zUGJQYb0awO62dQL4SjT/DlmoUlt4tzo
         oA0F9qWzCpOFg2ynyF+/xsPtJIxc+zXVF/daFgnUQ9qFynd1cQai2iSWyYur9tvS3ETq
         bFJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704309938; x=1704914738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ePM2QFEf84jkQjXi4mMoaN4mv2SRUP4BRJFpeeTOD5g=;
        b=k3RPAdybj4peNExxTCNsATwu2ZQOFle9psQ3Yah2BwFtJ5vGfKKp3QqyZ2TmTyFQj3
         d6r3ayIlSqtxoiUr24vNqSekAjjPwX4SBJ6EzNef6Yab17q6dMDcXpvgpjCyW3g9d/08
         xPSowfGvo8gx05mGSri5jL+x+EFPI/1f4GlZS/txpZjANCoHcM/UFIJ9Nvak2GsdMzOL
         TDGLZ1yR5rwHDXB/kLYM/NDC3hM56oamWU/o+2QIYsjL7pRs8m1mYjdq7oW+tooiiJBw
         SxRhLWb57BGVA8BzhMwHXyJE/wWNwSO1bJewcV/orBWiyV43HGeEm9MWlLUq06aBtM3j
         6VPw==
X-Gm-Message-State: AOJu0YyiKbQzCzETcEa2IGwcEd7CPS57eZ86DVUspHPipxw7D7FdwKQc
	5QvJbwD0u40qTJH5qAeY3MVELNsVH8s=
X-Google-Smtp-Source: AGHT+IGS0PcVME947xX6VyKKuQm9QrQr2NLhGTj9tYsxlSHBSE2RYEzJiwrKFs6gJDXqdIisZNNbrw==
X-Received: by 2002:a05:620a:f:b0:781:4319:dc88 with SMTP id j15-20020a05620a000f00b007814319dc88mr19060073qki.41.1704309938416;
        Wed, 03 Jan 2024 11:25:38 -0800 (PST)
Received: from palpot.eng.veobot.io ([50.239.151.2])
        by smtp.gmail.com with ESMTPSA id l19-20020a05620a28d300b0078119f89f44sm10386659qkp.33.2024.01.03.11.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 11:25:38 -0800 (PST)
From: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
To: docs@lists.yoctoproject.org
Cc: "Ilya A. Kriveshko" <iillyyaa@gmail.com>
Subject: [PATCH] dev-manual: update license manifest path
Date: Wed,  3 Jan 2024 14:25:35 -0500
Message-Id: <20240103192535.1129768-1-iillyyaa@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jan 2024 19:25:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4743

After changes in openembedded-core@1a4ab9f, image licenses moved one
directory down into ${SSTATE_PKGARCH} subdir.

Signed-off-by: Ilya A. Kriveshko <iillyyaa@gmail.com>
---
 documentation/dev-manual/licenses.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/dev-manual/licenses.rst b/documentation/dev-manual/licenses.rst
index 3b9190d47..57713effa 100644
--- a/documentation/dev-manual/licenses.rst
+++ b/documentation/dev-manual/licenses.rst
@@ -330,11 +330,11 @@ completeness.
 
 .. note::
 
    The Yocto Project generates a license manifest during image creation
    that is located in
-   ``${DEPLOY_DIR}/licenses/<image-name>-<machine>.rootfs-<datestamp>/``
+   ``${DEPLOY_DIR}/licenses/${SSTATE_PKGARCH}/<image-name>-<machine>.rootfs-<datestamp>/``
    to assist with any audits.
 
 Providing the Source Code
 -------------------------
 
-- 
2.39.0


