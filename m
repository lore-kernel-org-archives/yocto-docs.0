Return-Path: <maxin.john@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 503CDC3DA6E
	for <webhook@archiver.kernel.org>; Wed,  3 Jan 2024 07:44:23 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.13138.1704267858354673930
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Jan 2024 23:44:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SJiI8i6G;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: maxin.john@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2ccae380df2so87303021fa.1
        for <docs@lists.yoctoproject.org>; Tue, 02 Jan 2024 23:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704267856; x=1704872656; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=1OXuPztv3/O8oR0BM4hRlL6bg7N5dK8qDrlU01HgRmQ=;
        b=SJiI8i6GMuO6JQFqQkzPQM72+tNi45W3POLsVzRvhaUOdJziPia33sBiarDfPrOo34
         XO3c+BsTmRZiWX9SGs4KwXz+gG6dD5f4e08cXMjXVGBG/Rie6CwjwTQGKXU5hKeBT+g1
         AVJOJxqS5rOyHAhZOuFg4SmS9kLn47K2u7DIvmCioBXjgnIhNph39PkrUvcoZ859Ghgn
         CXRXp4abeuiGBPx+iUSSdjXf1dNMVyA5h5pC6TChUjBG0mQBJCCJ3q4Hq7YWBW6I9/di
         t5HT2oWc5VRtir4mzgYfX+vnRVaiC0CVf9SP9Egf3/ZK0Sj2Q1/X8FixzzUlkqbHPG7q
         3MCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704267856; x=1704872656;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1OXuPztv3/O8oR0BM4hRlL6bg7N5dK8qDrlU01HgRmQ=;
        b=ePl0tHJEMEgzeRS0FWEgXGB4vAw6vCGGjCwA09+HIU3TFJze66hghC9CUFCrjZfcxN
         1vUrnNbhvMpI3bLJYq0/SeaKnW2UW6KluoI5P5T8e22WPpVWgaqg4XFD1ZJdpV4CDtmm
         izxRcEqDTkBe3FrapImXV/Ci0TdC6CYPdVkSY4KQ5AMV7R7IzfhvIhQY5SzPRdOsivvB
         K0JgpG7I4IO1hoIlKJ1YWzM1r87lawtNO6nO15zrtoWLVjlp0mR8W9760wsn6B8l8mDg
         wdQpXcBd+ot5Z2ETdRam2BkbNjLuadMESf6PAUc7ZKqDV2uOfA5yrX2+XqqIno9NdYzk
         Aw3Q==
X-Gm-Message-State: AOJu0Yysca0Y3pmccm/lxzfYibSdrwMDkQME1n5JyMHp+7IvjAFjfP4g
	JTKMYJfmAR7R5stxGwCyrDIOXlULrnQ=
X-Google-Smtp-Source: AGHT+IHJ8G/YL1ChwyNsBivjDrV2pT4Nu/cnIfcz3cU2yDpwqGDWtxpgU5Tb05t/UoHahe/8RJIy8A==
X-Received: by 2002:a2e:9b52:0:b0:2cd:cf7:9b4a with SMTP id o18-20020a2e9b52000000b002cd0cf79b4amr994392ljj.73.1704267856409;
        Tue, 02 Jan 2024 23:44:16 -0800 (PST)
Received: from Thor.lan (81-197-102-119.elisa-laajakaista.fi. [81.197.102.119])
        by smtp.gmail.com with ESMTPSA id j18-20020a2ea912000000b002cca250d5b8sm5326697ljq.38.2024.01.02.23.44.16
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 23:44:16 -0800 (PST)
From: Maxin John <maxin.john@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] ref-manual: classes: remove insserv bbclass
Date: Wed,  3 Jan 2024 09:44:15 +0200
Message-Id: <20240103074415.6097-1-maxin.john@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 03 Jan 2024 07:44:23 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4742

insserv.bbclass was removed from oe-core:

commit e6bb5dbb62257a7de730ea9085dfd89520f3e47d
Author: Richard Purdie <richard.purdie@linuxfoundation.org>
Date:   Sun May 10 12:30:49 2015 +0100

insserv: Remove

Signed-off-by: Maxin John <maxin.john@gmail.com>
---
 documentation/ref-manual/classes.rst | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/documentation/ref-manual/classes.rst b/documentation/ref-manual/classes.rst
index a8afe9f2dcb6..8d8bea47147c 100644
--- a/documentation/ref-manual/classes.rst
+++ b/documentation/ref-manual/classes.rst
@@ -1538,16 +1538,6 @@ Here are the tests you can list with the :term:`WARN_QA` and
    automatically get these versions. Consequently, you should only need
    to explicitly add dependencies to binary driver recipes.
 
-.. _ref-classes-insserv:
-
-``insserv``
-===========
-
-The :ref:`ref-classes-insserv` class uses the ``insserv`` utility to update the order
-of symbolic links in ``/etc/rc?.d/`` within an image based on
-dependencies specified by LSB headers in the ``init.d`` scripts
-themselves.
-
 .. _ref-classes-kernel:
 
 ``kernel``
-- 
2.39.2


