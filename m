Return-Path: <yoann.congal@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01E57C64EC7
	for <webhook@archiver.kernel.org>; Tue, 28 Feb 2023 22:14:23 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web10.7090.1677622454988873826
 for <docs@lists.yoctoproject.org>;
 Tue, 28 Feb 2023 14:14:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile-fr.20210112.gappssmtp.com header.s=20210112 header.b=WE9hREk9;
 spf=pass (domain: smile.fr, ip: 209.85.221.44, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f44.google.com with SMTP id bx12so8171036wrb.11
        for <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 14:14:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112; t=1677622453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=co/0rb9ddgRfCOkT2eeWkA7pn7iDQ3zrUv2GtP9wSLg=;
        b=WE9hREk9RcfO4XROGdLKCsrhOdnEYwv8O6j4f7MCl+eapl4zh0OaFHUtdLnjD8wdh/
         2Hh8LHyFXk34fmUv3E7EAB+SsLttctcyH879PFukmpdZz0d/O6Q6A+gF8FXn7Cl9EQMH
         womLg6btDababu+sp197OH0hiXYx+cVu4RfZWlU4vU4RE/2TebWvxcTE+q2AlWG3kSCj
         EOFOm7Zi3KWQivdeB6RrLmOJiyFDf+gl7HBNt5Einy0dN4da1uHmTV+5+WMxGRgMXUdE
         YPsH0Ocr7wziab6H1Det/s5gC0EbcLpM5yjKVVJsPcEHkPPXzr1IgB7oYx0Z7/0roIy2
         AMTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677622453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=co/0rb9ddgRfCOkT2eeWkA7pn7iDQ3zrUv2GtP9wSLg=;
        b=qYSTizLRI5+6GyEKIDOIEgBq2tmJHlJe+oZDoa+GOWiQxB1sk+oJZQO4D6DH/kbO9P
         rjkNSfTxuZv+L59kU1RKZsg9vDTaywopQ5EjgyL9a9IVw0kVNl7EC44+rl6v3ZievG1K
         imTgXS8eORjXAIJ3EYtf/AXIaDRnuAUP73sCqCsqegBK6T3MpgwSZJTWVbntX3XZDyNL
         7IOjvBKj5zJqH/9VUAlgaKaSbJKAnp60IZV0GD+Vj7TiaP0VBREBg6e+0hvxg90+vI/E
         h4bbKFLJc+pOLtSdIAI0+NA8aX+IDOaadqCJsRBTr3bKfiDCX+hTZFTMu7BraP1NKRGn
         V/3w==
X-Gm-Message-State: AO0yUKUpZAHCaOAWfuelF5P75azQ+pimoxI6nylPRl8fuOltO9tdMocm
	3ptu4sC4I2qGzHTK9kwSYOLqMsmZSvMRiA0t
X-Google-Smtp-Source: AK7set8wnmw8KdagxI8opXZAYgN25BFvYRINklRdHC6zJW9HiGYGitYTkpICZ04QD9Ur5uv4dXxd4Q==
X-Received: by 2002:a5d:684f:0:b0:2c7:6bf:16cc with SMTP id o15-20020a5d684f000000b002c706bf16ccmr3345499wrw.32.1677622452993;
        Tue, 28 Feb 2023 14:14:12 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id v16-20020a5d4a50000000b002c5526234d2sm10990366wrs.8.2023.02.28.14.14.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Feb 2023 14:14:12 -0800 (PST)
From: Yoann Congal <yoann.congal@smile.fr>
To: docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>,
	Yoann Congal <yoann.congal@smile.fr>
Subject: [PATCH 1/1] ref-manual: Add info on "mixin" layers
Date: Tue, 28 Feb 2023 23:13:09 +0100
Message-Id: <20230228221309.82156-2-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230228221309.82156-1-yoann.congal@smile.fr>
References: <20230228221309.82156-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 28 Feb 2023 22:14:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3761

This is heavily inspired from:
https://wiki.yoctoproject.org/wiki/index.php?title=Stable_Release_and_LTS&oldid=84847#LTS_.E2.80.9CMixin.E2.80.9D_repositories

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 documentation/ref-manual/release-process.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/documentation/ref-manual/release-process.rst b/documentation/ref-manual/release-process.rst
index 19e804063..cc464447f 100644
--- a/documentation/ref-manual/release-process.rst
+++ b/documentation/ref-manual/release-process.rst
@@ -97,6 +97,21 @@ through the same release process as do point releases. You can find more
 information about stable branch maintenance at
 :yocto_wiki:`/Stable_branch_maintenance`.
 
+.. note::
+
+   In some circumstances, a layer can be created by the community in order to
+   add a specific feature or support a new version of some package for an LTS.
+   This is called a "mixin" layer. These are thin and specific purpose layers
+   which can be stacked with an LTS release to "mix" a specific feature into
+   that build. These are created on an as needed basis and maintained by the
+   people who need them. The "mixin" layers are found here :
+   :yocto_git:`/meta-lts-mixins`.
+
+   Policies on testing these layers depends on how widespread their usage is
+   and determined on a case by case basis. Note that there may be other "mixin"
+   layers within the wider community too.
+
+
 Testing and Quality Assurance
 =============================
 
-- 
2.30.2


