Return-Path: <bhstalel@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 039F0CDB474
	for <webhook@archiver.kernel.org>; Fri, 20 Oct 2023 09:41:57 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web11.50767.1697794909849579325
 for <docs@lists.yoctoproject.org>;
 Fri, 20 Oct 2023 02:41:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=bSu4jhIk;
 spf=pass (domain: gmail.com, ip: 209.85.128.42, mailfrom: bhstalel@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40842752c6eso5198315e9.1
        for <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 02:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697794908; x=1698399708; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fAnv5pMiCSCSlZ3rzutkJ/WP7wLEoDNDn1ElL8BBTHQ=;
        b=bSu4jhIkyyQK/rbsOhMatgpho9Shov82H0cCUI2H1BBgjsOaRvafNDLpdM7ilN7d7e
         n0s06oll5mAh8f5zhQ6iKxuZcOq3l2NkC7M1/FdI6/cIm1B4Ixqsk+MZZWgw4A+1QR8B
         PTjRPD9FF/16SkQJSeb6FdSiaMkblNUIz+6rg56QRJmJ53AcIeHeSz6lsqv0Qk65AKrQ
         BOgRBz9sWP0rJwjbcczfCZmwBlpHyW+FHtjnOdK+BAJov0U/xDd6eSb5OQUIypIyIlue
         MNlD3KBOBiF2cJJW7yatYvHY/loQAbffbm70DwgeAtjG7CGQ2JDPHc0cH8JO2F2iHY+s
         UpEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697794908; x=1698399708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fAnv5pMiCSCSlZ3rzutkJ/WP7wLEoDNDn1ElL8BBTHQ=;
        b=MmJdcNc5pklZlRmP7WzNVEbZEPODMbbOXRJgy/q7FU4GvpLw9XCxU1mW1B7RBvYVsn
         LGjC8acJxwQph+xES+SkWT178h32gDQQi5biob+vTaM068UYo0Ak+JL1tRe+H20+kRPT
         UESpB+VRFOd1nV8rT1M9DtHHM88SQGfFYrtdNY+wdc2yM3fj8SY0ZlA1nKF5cMfPBBIP
         WBtzuGYnbKH7h3RWQU+MGMLp1NY1K/HiaNzr/RtVLqpdRGU0pXcXCJ9ZKaYRqJnxZsEu
         uwWIjopJFDY+PgMk7vKFa4xzbK/0yHIs5raDiN6yodgn2wlL836m6aFEndM4ZkvmVFhE
         ZGSA==
X-Gm-Message-State: AOJu0YxeaiCFXhBnt2nCSL6Xm/THU4s03a6FX4vfPh8XgKp3rv4F4AiD
	rtv5fw5kyrWtZpvXZ3TrSJ+x9K/tRf0=
X-Google-Smtp-Source: AGHT+IEm04q/aqKF91UjXAe7O1m7b3yD195a1e2Cz1QboZTGoVTuRQv5Jm5YrgcCiArH/sOO0kwEWw==
X-Received: by 2002:a05:600c:3555:b0:402:d72:bee5 with SMTP id i21-20020a05600c355500b004020d72bee5mr966190wmq.21.1697794907917;
        Fri, 20 Oct 2023 02:41:47 -0700 (PDT)
Received: from talel.sofia.local ([41.225.25.106])
        by smtp.gmail.com with ESMTPSA id 1-20020a05600c228100b0040596352951sm6433452wmf.5.2023.10.20.02.41.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Oct 2023 02:41:47 -0700 (PDT)
From: Talel BELHAJSALEM <bhstalel@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Talel BELHAJSALEM <bhstalel@gmail.com>
Subject: [PATCH 2/3] ref-manual: variables: Add TOOLCHAIN_OPTIONS variable
Date: Fri, 20 Oct 2023 10:41:01 +0100
Message-Id: <20231020094102.414940-2-bhstalel@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20231020094102.414940-1-bhstalel@gmail.com>
References: <20231020094102.414940-1-bhstalel@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 20 Oct 2023 09:41:57 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4438

Signed-off-by: Talel BELHAJSALEM <bhstalel@gmail.com>
---
 documentation/ref-manual/variables.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b00445946..1fca913e2 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -9135,6 +9135,16 @@ system and gives an overview of their function and contents.
       portion of an eSDK. This is similar to :term:`TOOLCHAIN_HOST_TASK`
       applying to SDKs.
 
+   :term:`TOOLCHAIN_OPTIONS`
+      This variable holds extra options passed to the compiler and the linker
+      for non ``-native`` recipes as they have to point to their custom
+      ``sysroot`` folder pointed to by :term:`RECIPE_SYSROOT`::
+
+         TOOLCHAIN_OPTIONS = " --sysroot=${RECIPE_SYSROOT}"
+
+      Native recipes don't need this variable to be set, as they are
+      built for the host machine with the native compiler.
+
    :term:`TOOLCHAIN_OUTPUTNAME`
       This variable defines the name used for the toolchain output. The
       :ref:`populate_sdk_base <ref-classes-populate-sdk-*>` class sets
-- 
2.25.1


