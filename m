Return-Path: <ticotimo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA484C433FE
	for <webhook@archiver.kernel.org>; Tue,  1 Mar 2022 16:36:38 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web09.10445.1646152598526187735
 for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=L8rk1wVS;
 spf=pass (domain: gmail.com, ip: 209.85.210.170,
 mailfrom: ticotimo@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id y11so14733471pfa.6
        for <docs@lists.yoctoproject.org>;
 Tue, 01 Mar 2022 08:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/1saGrQX7YeS/tasA2+M7ZwCXzQEnWxKKHLx/DHYqBw=;
        b=L8rk1wVS1bJSoq6ckHKU+wOfqrHkd6srjL28iMc/XID0rmAJOrakNa6MWdCch0do8x
         32ERnOXtFDKQkJr8jMnKp+iT2i/VXaja21nl38LDQSmkSvB7PzguHiUiFy9/826ZK3Fh
         NvaAHZr6hDMdQqvZcrCeK/MQ099rCfL00HymTaKj8yeLZaEKhVhMCQNfRCrBlAk8r1Gs
         voo2OX00oeFe3hqHh1v5dak0lqBQv+NHfbFG9zWHKPXJmzDDMcAltKgAcc4hJBEf5q22
         3Zbfiw3f3iWuoMSGpNG0dprDWxsF23tOJR3j32sGB99IlS8UYy0pNTrrwT1NcmfuN6Tn
         qEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/1saGrQX7YeS/tasA2+M7ZwCXzQEnWxKKHLx/DHYqBw=;
        b=cAn6Yx7PhTS2hAk2lHvaQT2abzMjp09WxHrda/uWOezpSB2HW/Ma07q+r/4/QLkZHt
         oQiBzispbrNEA3eSb2X20pp/m8q9ZpqjR8dl920KgiM7Y1R2AfeWCLBFup8tU8oV8csY
         Mdzl/ggvUYr3210MDnvbWQDz1deOi0I0EPXMe0/Dly8eLUMv4IM+aDfWGQxabjHK5AeD
         vjCkFHXj0eR1UO/GOWBZRtDPgBiDxFUXjxXe0HDauntA+SHn7eu8i1VOgFSp57kS8wcG
         /PXQHNjsk5cKns6jL0RD4mJ1JVzBPA+sW+vPJh6kWJIQgaG3gMPzgfC9zqO6LUXWtl/O
         u4og==
X-Gm-Message-State: AOAM530iK3nuoZmwyOq+f+hGbbFLj9PHttQvETqbubO+/WxPciYuAdqb
	EQcy7wg5fruZwYfnKRsalBVVB+QXebU=
X-Google-Smtp-Source: 
 ABdhPJzW7kW81Hu7emsaWD/O5gh86kLRU/tjFkk9VYiahxMYs4Td35tM4wjmmokHXF9TA9UGgD6u/Q==
X-Received: by 2002:a63:6406:0:b0:373:b73e:ad4e with SMTP id
 y6-20020a636406000000b00373b73ead4emr22940089pgb.465.1646152597570;
        Tue, 01 Mar 2022 08:36:37 -0800 (PST)
Received: from nereus.hsd1.or.comcast.net
 ([2601:1c0:6000:1b20:b4e2:b3d2:f012:52ea])
        by smtp.gmail.com with ESMTPSA id
 j11-20020a63230b000000b00372a08b584asm13450461pgj.47.2022.03.01.08.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Mar 2022 08:36:37 -0800 (PST)
From: Tim Orling <ticotimo@gmail.com>
X-Google-Original-From: Tim Orling <tim.orling@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH v2 5/5] docs: migration-3.3 drop distutils labels, terms
Date: Tue,  1 Mar 2022 08:36:17 -0800
Message-Id: <20220301163617.1543257-5-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220301163617.1543257-1-tim.orling@konsulko.com>
References: <20220301163617.1543257-1-tim.orling@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 01 Mar 2022 16:36:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2521

The distutils* classes and DISUTILS* terms are no longer defined so
replace their usage with ``text``.

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 documentation/migration-guides/migration-3.3.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/documentation/migration-guides/migration-3.3.rst b/documentation/migration-guides/migration-3.3.rst
index f982b1c80..1eb494c28 100644
--- a/documentation/migration-guides/migration-3.3.rst
+++ b/documentation/migration-guides/migration-3.3.rst
@@ -90,17 +90,17 @@ example::
 
 then in ``setup.py`` it works with source code in a relative fashion, such
 as ``../../src``. This causes pseudo to fail as it isn't able to track
-the paths properly. This release introduces a new :term:`DISTUTILS_SETUP_PATH`
+the paths properly. This release introduces a new ``DISTUTILS_SETUP_PATH``
 variable so that recipes can specify it explicitly, for example::
 
    S = "${WORKDIR}/git"
    DISTUTILS_SETUP_PATH = "${S}/python/pythonmodule"
 
-Recipes that inherit from :ref:`distutils3 <ref-classes-distutils3>` (or
+Recipes that inherit from ``distutils3`` (or
 :ref:`setuptools3 <ref-classes-setuptools3>` which itself inherits
-:ref:`distutils3 <ref-classes-distutils3>`) that also set :term:`S` to
+``distutils3``) that also set :term:`S` to
 point to a Python module within a subdirectory in the aforementioned
-manner should be changed to set :term:`DISTUTILS_SETUP_PATH` instead.
+manner should be changed to set ``DISTUTILS_SETUP_PATH`` instead.
 
 
 .. _migration-3.3-bitbake:
-- 
2.30.2


