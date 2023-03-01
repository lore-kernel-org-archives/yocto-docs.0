Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A9F6C7EE2F
	for <webhook@archiver.kernel.org>; Wed,  1 Mar 2023 16:48:50 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web11.28066.1677689326681954084
 for <docs@lists.yoctoproject.org>;
 Wed, 01 Mar 2023 08:48:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=mtgt9M+4;
 spf=pass (domain: smile.fr, ip: 209.85.221.45, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f45.google.com with SMTP id e13so2402734wro.10
        for <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 08:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677689325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mZGd9qGB5izx/1puqekB8w79JHXg63Pvb2TkRsDztxk=;
        b=mtgt9M+410nMVnTyb6j17V33QDJKGCZH7u1g3Xi1BlChDQ0d4Ue0BW3JkPydix66vC
         lHRs2JKB2iisYI6MDBih11Rtlk50pCO2G3hsGBOnvchd2e8wC3xEMF/8CQvvig4UEQzs
         6g1pwH312NreTJwXUR2kMaCoivq18FapEliiwrDtMoIOX6zItUAp5uRZ9k1ZAWtOY09F
         c0wGJdS9/PaW4iFUjHYwnLppcG2QLvCtuwkOUPyzDHh1U3W0ZFvmaV960EtitpUx9K9I
         r85A4FQQWxfBiyT+yxeno73bPgrdojCfvYhSNOgJVGp6DLEfmNfAtAERKT2tk7iRPK9U
         Uymw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677689325;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZGd9qGB5izx/1puqekB8w79JHXg63Pvb2TkRsDztxk=;
        b=Kq+IqI43vmlsjfk7XUMrWEXK8eQaP3U56eaC1R+YU3PNeDb3QBhYU2+e0HzepnyQyf
         IKL1Moejc+AaOEYfgqA264ZX7Et9daYI0EKyiz3KxL0h9B2iE8CE5oDQAXTw3luLzssU
         rtdMdbouPlnJQm3ceLvaskSmB1/yAxdCRZrBrb1M+qhlGCee5W9uEwp+loGiChnYpyGP
         j43YVEK04WD8kbbpoIFlRRLVayh98/xJca3Z7SQcd5+x5VRXSmSC6qhpSkWeZRRaIuL7
         SqmcddnMr72UyEWfOCGxoigqp/lSP6KNlZXyTvum0VrHBC9MRUQ4VDIWZsvR25Vy5qZg
         4O8w==
X-Gm-Message-State: AO0yUKXY2Wc++ylEoU5Zrt/0ZTZXfsFUHGo5zk9lIcbIYDEmxWCYjd6u
	LYEWa34PaPh1hbIpxjO0Ykdk6HiQAbWXKiZ6
X-Google-Smtp-Source: AK7set+MdDNDvPFp1K5PqEOLJe1d77Ydv8bb0O88IaS15+fKFNpIdDk0mk2BxwPxjj8JjEo/rVKrWg==
X-Received: by 2002:a5d:6207:0:b0:2c9:e34e:7d1 with SMTP id y7-20020a5d6207000000b002c9e34e07d1mr5462917wru.6.1677689324702;
        Wed, 01 Mar 2023 08:48:44 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d5585000000b002c569acab1esm13146775wrv.73.2023.03.01.08.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Mar 2023 08:48:44 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH v2 1/1] ref-manual: Add info on "mixin" layers
Date: Wed,  1 Mar 2023 17:48:15 +0100
Message-Id: <20230301164815.208527-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230301164815.208527-1-yoann.congal@smile.fr>
References: <20230301164815.208527-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 01 Mar 2023 16:48:50 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3771

This is heavily inspired from:
https://wiki.yoctoproject.org/wiki/index.php?title=Stable_Release_and_LTS&oldid=84847#LTS_.E2.80.9CMixin.E2.80.9D_repositories

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/ref-manual/release-process.rst | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 19e804063..fa057e055 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -97,6 +97,23 @@ through the same release process as do point releases. You can find more
 information about stable branch maintenance at
 :yocto_wiki:`/Stable_branch_maintenance`.
 
+.. note::
+
+   In some circumstances, a layer can be created by the community in order to
+   add a specific feature or support a new version of some package for an LTS
+   release.  This is called a "mixin" layer. These are thin and specific
+   purpose layers which can be stacked with an LTS release to "mix" a specific
+   feature into that build. These are created on an as-needed basis and
+   maintained by the people who need them.
+
+   Policies on testing these layers depend on how widespread their usage is and
+   determined on a case-by-case basis. You can find some "mixin" layers in the
+   :yocto_git:`meta-lts-mixins </meta-lts-mixins>` repository. While the Yocto
+   Project provides hosting for those repositories, it does not provides
+   testing on them. Other "mixin" layers may be released elsewhere by the wider
+   community.
+
+
 Testing and Quality Assurance
 =============================
 
-- 
2.30.2


