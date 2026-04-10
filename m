Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11E7FF44847
	for <webhook@archiver.kernel.org>; Fri, 10 Apr 2026 12:18:02 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.155081.1775823476555996611
 for <docs@lists.yoctoproject.org>;
 Fri, 10 Apr 2026 05:17:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YoziP/rJ;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-66c24b42efbso2886442a12.2
        for <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 05:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775823475; x=1776428275; darn=lists.yoctoproject.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y6L0CD0rqjxKLPvTBGy4ZTY8/Q+q0fVfM6vRvARI3hk=;
        b=YoziP/rJZxK+tEA/emk1foOvlpYTTjeKSaDkh3p9QplSjaqTc1XDN2k8wcmTYWXhfE
         o8ODiJeQTMcK9i6wcS08UMOZVblArHJzzX5zn01erUii3ee/yxQwiwVB34X9O5WhDHVd
         v3mMzLDhC30UPSoZl4e3Ej25CdFbmn27ky+Rd3yOzvLPj/O3xAC2VAM6rj9+IGk967KH
         PG3n2DO50oDIlvcH8mVQaluB7Cy5k6pmhsTHVkRgbfkYFHCqjo+XNEmu8MT+zFq1U85r
         m7Qpr1VBs93mciabJ5er+mfYUVNr47NI2Oc6iOAZBzddO5UyCTa3fH1ACcKCJko/tnQJ
         vPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775823475; x=1776428275;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Y6L0CD0rqjxKLPvTBGy4ZTY8/Q+q0fVfM6vRvARI3hk=;
        b=WfOiOLay3jCzG69Oap+37KYz44KHhKkZD5dz9FdXfe+SsmpPbb53aPmcDEKTJWd6gJ
         CY2ENyrF6Z+Y5Ol3dvgvu1ClrjvtjywlkAw98/NJlWl66HWHZ5Ri4XmYSmqDxtMG4GsO
         e0A/g4d6qACG36FNOvpfkTUdsLjgrTOtSqxP408fWjaVb5U+peg7R3rCvfRFs2GB7JVQ
         Tc/8OIfiDUBuU6nMUO7l2Yi2P5bl+3LNlbXP/HwwL9BS2rBbfH7K8YWL0j29DeVYyknt
         ZJO8nqpYroVae5MyPWv/HlCTB1WZOdgTYGJ02xc2Qn7REyjwakHCgaJBmEzkAlqgT4WL
         GpPw==
X-Gm-Message-State: AOJu0Yzj4tpe+NuhTcc1ETMKHTA+A+fhtnYFxswUs5lejWYM+r6XEsr9
	di/HD35cQlCDO6FeYVwd0dAC4rYGrHxxvGlklr+ryhEfIEsFNMp49B9Q
X-Gm-Gg: AeBDiev07BYLisR5VexlOCGvXGfBZcj/bktMlQjUkmDjP+LSqxE8It52LD2z6UrmYgG
	CBfXf0MpripZwlT039+0t/3pHmWdhjqF6569DB29BH99el0SbQnRoWpUj1ExeBqvpJEuxqHfYyh
	lr8TH29vTv+nrzuaxsX/pQxhPhgdSm+j7q0uOVQjGn4LAUYZlwxg48b/aittlH9MT/NxX76wa9C
	0xEShjDtVb9VD2SBjsWfxQ9IOHYRND6KHKrDUD/pF2R28kCWj+oSHGNPQqLysV6y+SqCe8z11Qf
	5Gj2KRBzeBH95dVxPilOsEoFoBtLyn0IXXbHDp2ZlEjM9xNmpsmRioJHTF/fjDzh3Z4lyLQ9QKK
	esE9PLhqyMFT0NImt4d3ZhkcZLcdVCcyvYV9Lk2SWcDJfnbx2yiF5EUoe2Rn+AEXkpZ90MniYo/
	j+yL2Rn79zDuKIhwDfoom+6urIPdj1hQ==
X-Received: by 2002:a17:906:5184:20b0:b98:36cd:7e11 with SMTP id a640c23a62f3a-b9d7277c0c4mr139788666b.45.1775823474643;
        Fri, 10 Apr 2026 05:17:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:5694:dea1:688f:6eee])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6de8d69fsm74881666b.4.2026.04.10.05.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 05:17:54 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Fri, 10 Apr 2026 14:17:44 +0200
Subject: [PATCH v2 1/6] ref-manual/variables.rst: update STAGING_DIR's
 description
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-staging_and_packaging_vars-v2-1-211bce1349b1@gmail.com>
References: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
In-Reply-To: <20260410-staging_and_packaging_vars-v2-0-211bce1349b1@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775823472; l=1015;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=MT/BfAKvz2rlUNxLC6mMQKXBEG8Bs5PDOc93u5ajsTs=;
 b=/wHCf73qnrC0RZpIHE7MA1GpZjogrq7qgOujSy0/Fzs6+OW2rIGXuBW8JkjxbjWWsIynORQ+W
 DTYMnQMpEn7BxW50jwjl2SVUm+y1TPXPrdxIX+SsooVZA/us1OyJhzg
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 10 Apr 2026 12:18:02 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9224

STAGING_DIR is not in direct relation to recipe-sysroot*
directries. Also it does not participate in packaging, but rather
in staging and sharing files among recipes.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 documentation/ref-manual/variables.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 60e608c0c..7f19723ed 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -10160,8 +10160,7 @@ system and gives an overview of their function and contents.
       directory for the build host.
 
    :term:`STAGING_DIR`
-      Helps construct the ``recipe-sysroot*`` directories, which are used
-      during packaging.
+      Used for constructing directory trees used during staging.
 
       For information on how staging for recipe-specific sysroots occurs,
       see the :ref:`ref-tasks-populate_sysroot`

-- 
2.43.0


