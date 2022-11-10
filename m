Return-Path: <atanas.bunchev@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5725FC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 05:51:58 +0000 (UTC)
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
 by mx.groups.io with SMTP id smtpd.web11.3781.1668059508952506470
 for <docs@lists.yoctoproject.org>;
 Wed, 09 Nov 2022 21:51:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=cf6JhM0a;
 spf=pass (domain: konsulko.com, ip: 209.85.208.47, mailfrom: atanas.bunchev@konsulko.com)
Received: by mail-ed1-f47.google.com with SMTP id i21so1450519edj.10
        for <docs@lists.yoctoproject.org>; Wed, 09 Nov 2022 21:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EjA85Msgp8nPu34f8iP6ZaeMXWzXBMnapMOZIw4gFo8=;
        b=cf6JhM0a5KFMKqh5H9UG5wdXqlU+7xaKMr/tOhbDUSjBXGOTSFs0We3pcLS0RRql7t
         gD8hExpNdKiULhHbYPzZcZpINiH1gWkDwszdvXdPqE3eMgqD3uSM1uSEYPyn7kiKRydT
         AJ5E3/w4QaY3tAYGhzt3AtyhfZwyEpYgizS+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EjA85Msgp8nPu34f8iP6ZaeMXWzXBMnapMOZIw4gFo8=;
        b=zsZV1isZBVqXMNaJdqDhjfCGTZimVpcQXdT/HxzIA3dvea6rOootigpz9wktTrxJNX
         Ne4ti7D4Jwh8l6Tofd29mDiQCojiAunTv/lA1cEjBIWHxm/9wv0sF564oQISW73uVod4
         G+xflb17iltkiX9/tJb/ELJyRHD1yzIXCEP4e0UX6pOPGhoTJVAkWtHSVBImRfoNmnF3
         SS39IS3XW7jroKBp8xi1Hq/CrXD+9z4iW6s6hu6a3pZLLOfS4dIimUIH4tvVKPnxj1s/
         EKQDBW+SF4fkx7paXfV+Kb4D2GsqlGPdwfM1ucKlfzgCT8ep23gwjPiDid8YzZj4gg8a
         vg0A==
X-Gm-Message-State: ACrzQf2PamsGBN3CMHGM/gHV64GYMLeVqnVUWzNqV7CMG5L7ym1jyWVy
	8N5ZZJnc6PPm/kptaWPTVk5mRq8O6+d/2W/e
X-Google-Smtp-Source: AMsMyM5eMq0zD4YdNcGp2iP49SNO6KEuNYz/n/e2fmcB2aDRi8boYkOvtKSORJ8OcQ41oH+uHrL8eg==
X-Received: by 2002:a05:6402:3890:b0:451:ef52:8f9e with SMTP id fd16-20020a056402389000b00451ef528f9emr62578922edb.107.1668059507365;
        Wed, 09 Nov 2022 21:51:47 -0800 (PST)
Received: from localhost.localdomain ([195.214.248.20])
        by smtp.gmail.com with ESMTPSA id n21-20020a056402061500b004615f7495e0sm8039820edv.8.2022.11.09.21.51.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Nov 2022 21:51:47 -0800 (PST)
From: Atanas Bunchev <atanas.bunchev@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Atanas Bunchev <atanas.bunchev@konsulko.com>
Subject: [docs] [PATCH v2] qemu.rst: audio: reference to Command-Line options
Date: Thu, 10 Nov 2022 07:53:06 +0200
Message-Id: <20221110055306.6450-1-atanas.bunchev@konsulko.com>
X-Mailer: git-send-email 2.37.4
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 10 Nov 2022 05:51:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3485

The previous statement can cause confusion, because this is the
first time when the `audio` argument is mentioned.

Signed-off-by: Atanas Bunchev <atanas.bunchev@konsulko.com>
---
 documentation/dev-manual/qemu.rst | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/qemu.rst b/documentation/dev-manual/qemu.rst
index 5a4a82ce6..d9b9f69ab 100644
--- a/documentation/dev-manual/qemu.rst
+++ b/documentation/dev-manual/qemu.rst
@@ -125,8 +125,9 @@ available. Follow these general steps to run QEMU:
    -  This example specifies to boot an :term:`Initramfs` image and to
       enable audio in QEMU. For this case, ``runqemu`` sets the internal
       variable ``FSTYPE`` to ``cpio.gz``. Also, for audio to be enabled,
-      an appropriate driver must be installed (see the previous
-      description for the ``audio`` option for more information).
+      an appropriate driver must be installed (see the ``audio`` option
+      in :ref:`dev-manual/qemu:\`\`runqemu\`\` command-line options`
+      for more information).
       ::
 
          $ runqemu qemux86-64 ramfs audio
-- 
2.37.4


