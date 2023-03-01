Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F21FC6FA9D
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 16:48:50 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web11.28065.1677689321895555254
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 08:48:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=uSNpdyX2;
 spf=pass (domain: smile.fr, ip: 209.85.221.41, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f41.google.com with SMTP id l25so13939476wrb.3
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 08:48:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677689320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3HyAGneLnbIoUmXEdhL/3bDyGKJ9ebmmRRHeZnRBZqQ=;
        b=uSNpdyX2V+AA63FJTbt9mLHwratEmRTLVCsWCcqEy5dOOJUJ9X9qFVCDscS+T4sx9P
         JECkLF+TPdoKIn2IolWaplYtUYCfjZsZMd0jSKlFJR08YuCyIl0q0EiaxVwqdwVfNdfk
         UMi4AunGVEUe+au/nBZ/Ldw4aZLghSmdXpZpUtHhzVcmB2stBiQOV3wp5Pt0+0M9katH
         QghrTIEE2KUTC9j8p+SYacIwXadc836gjOl1KOSBfk0SgUHTL29/9zteTrQ6BiTjMW3t
         dwfG3E+H/Xb9msIJ9bGzidoDdg1Mk5QT2skWLCQZSXWEaXfiMtNxxfb0/tYl4D55o0e3
         uCBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677689320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3HyAGneLnbIoUmXEdhL/3bDyGKJ9ebmmRRHeZnRBZqQ=;
        b=ORjpxaSu6E4kPGv/OymXeZPc9KNzRNvbiQMnxPH/XUZpscdQpr0mopPlIeQK21zWPl
         1LgMn121iOwQ0IvT3WcmzDWJjy1q43o3p+b6gmuu7El4nkCF/p95p+QopcgmFENDFwZK
         3sBBh0rqU45CBQUamJ2liVX6ccjp6wJ3FLoXecdhio1hA+NApbgXhftrqaioC0E+g5Zn
         ts83HHkBp2TgOCstVFQZmf+SdDCaB6OaRmWVMkX7jb92mwZG7lPVo+gbkwq/POxStG0J
         hwDgNanSb+FQupLHx2SO3D+0jKy+HOWWYqT9+YHhBjsuuMdqoLIXMlySsLdUjRuqfvNh
         +G1A==
X-Gm-Message-State: AO0yUKUtERjN5VPy6+umN8rtvNt0Kzo1Dn/5OwQbSu/zmGxLPC74dNo3
	S2zGXJjm/d4z9RrlimacRZ4/2cvKlgNlJitR
X-Google-Smtp-Source: AK7set/TCug6DwirW5or6no9JVd87n8Q0s5cDHc+mdLMbQkdDDOdOF35Q8b3lfSTezWEfMZMX5GIcw==
X-Received: by 2002:a05:6000:1f10:b0:2c7:e48:8c87 with SMTP id bv16-20020a0560001f1000b002c70e488c87mr10201612wrb.25.1677689320204;
        Wed, 01 Mar 2023 08:48:40 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d5585000000b002c569acab1esm13146775wrv.73.2023.03.01.08.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 08:48:39 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 0/1] ref-manual: Add info on "mixin" layers
Date: Wed,  1 Mar 2023 17:48:14 +0100
Message-Id: <20230301164815.208527-1-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 16:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3770

Hi list, hi Michael,

During today's "Yocto Project Technical Team Meeting / Engineering
Sync", we spoke about "mixin" layers. Those are not documented. This
patch is my attempt at adding the missing doc...

Changes v1->v2:
* LTS -> LTS release
* depends -> depend
* as needed/case by case -> as-needed/case-by-case
* Added info on mixin layers hosted on git.yoctoproject.org

Best regards,

Yoann Congal (1):
  ref-manual: Add info on "mixin" layers

 documentation/ref-manual/release-process.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

-- 
2.30.2


