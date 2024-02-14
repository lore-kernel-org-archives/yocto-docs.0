Return-Path: <belouargamohamed@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECB8C48BC1
	for <webhook@archiver.kernel.org>; Wed, 14 Feb 2024 21:52:45 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web11.376.1707947561672308665
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Feb 2024 13:52:41 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U8SRsTYd;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: belouargamohamed@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-33aeb088324so76400f8f.2
        for <docs@lists.yoctoproject.org>; Wed, 14 Feb 2024 13:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707947559; x=1708552359; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B9/6HXNruuttvEeW/4v76d5+aftjpU1WNZcYu5qH9pw=;
        b=U8SRsTYdxXffbXaEsirfN7xs3oqh50Lg+Ug6Ket4qeaVK/yBfZSEdSJgXh2ZaS4z7k
         /psi1s3ALvn2kTHj2y/jJhcHxt1a3+fr9ijUbkecd1cC94uHcMYTg/hndV08csQcKHCN
         TYsejyrbdH0KT69HSo9frnsiCYoqN/wbCOMG0owKjKNyje87jzFrl1Yzkd+W/zODWpwW
         Qkh6KF8bn9/woDpjqUJMIEaH2BNWRGV8Oo27AjdS4YtVfN7zDTol+lkfYe3L7mn7wPj2
         5QDBSuA8GfYx8XI4abqOI09xaRmE+/EXEEkln7ZYTcYRPYFabD8vJSpj6cwYzqievrIy
         cKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707947559; x=1708552359;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B9/6HXNruuttvEeW/4v76d5+aftjpU1WNZcYu5qH9pw=;
        b=nl5dynmjed4EMvHQSRgU+EdOEEVrWljHra6/xOWlI6NFWQDLUu8z2bYVczsHO1MJjG
         1nN19vJHl5SiJpoIvSEkAl0vzjNTtrsVH6I1Ul7ANLrAkNKUUsCW98GGzMD6AW40sJkG
         iFxFsMKKk+FM8HZE6Y6mlIU8l/oseBzRq5o6zQMYd8p/D7wPiffqafpCgkWMJIah/lk7
         vmdZV1AaWKNCCJ7v1JIoDinonA9rgxRk1kW62HAYoSsKJls12bwpLbOWYTq8sBXpBw7E
         HqFal/8FuxWPnB1rD4D/5mmsOizR5+9B7nozEDl9+pLvkfcGi2ameKr55EV6RTnRjLRj
         WnMg==
X-Gm-Message-State: AOJu0Yz6vbxEVs0j1TYQbd77I6e2RK1Ke9s8vqWQWy18xGUIuRB6n75w
	R2dX29NiGAh9XTTGtDgvEFXTVK6wug58gta1rLumr7YAFpvzuic08mVqkSIJw5f+ug==
X-Google-Smtp-Source: AGHT+IF94l1jEPpahKpoRtvQy3n2Z/1yLcUhcTgKoPtprB0gfA64ULCNDJPUIowgYqBYxPnp+8dDyQ==
X-Received: by 2002:a5d:65cb:0:b0:33c:e065:992b with SMTP id e11-20020a5d65cb000000b0033ce065992bmr2988302wrw.59.1707947559288;
        Wed, 14 Feb 2024 13:52:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVZlPleDlU0sykK6ZgCMwt3K+WvQoSG/e09ofn8jsT2FM0sJIk1x1bS4lJeZhZ57nBrEGBK3DwI2SsbVEakPzMkxkzKbGNtM8yBsfDhKt08OemSyS+o
Received: from localhost.localdomain ([2a02:842a:10:ba01:9163:853e:e30e:77c6])
        by smtp.gmail.com with ESMTPSA id cl7-20020a5d5f07000000b0033b8881f31dsm7384226wrb.68.2024.02.14.13.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 13:52:38 -0800 (PST)
From: belouargamohamed@gmail.com
X-Google-Original-From: m.belouarga@technologyandstrategy.com
To: docs@lists.yoctoproject.org
Cc: f.lahoudere@technologyandstrategy.com,
	BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
Subject: [PATCH 2/2] documentation: add documentation of the variable SPDX_NAMESPACE_PREFIX
Date: Wed, 14 Feb 2024 22:52:37 +0100
Message-Id: <20240214215237.151434-1-m.belouarga@technologyandstrategy.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Feb 2024 21:52:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4838

From: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>

The documentation of the variable SPDX_NAMESPACE_PREFIX does not exist.
This variable is used to change the prefix of some links in SPDX docs.

[ YOCTO #15398 ]

Signed-off-by: BELOUARGA Mohamed <m.belouarga@technologyandstrategy.com>
---
 documentation/ref-manual/variables.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index 6f7d6ff01e..907575ba82 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -7913,6 +7913,11 @@ system and gives an overview of their function and contents.
       image), compared to just using the :ref:`ref-classes-create-spdx` class
       with no option.
 
+   :term:`SPDX_NAMESPACE_PREFIX`
+      This option could be used in order to change the prefix of ``spdxDocument``
+      and the prefix of ``documentNamespace``. It is set by default to: 
+      ``https://spdx.org/spdxdocs`` .
+
    :term:`SPDX_PRETTY`
       This option makes the SPDX output more human-readable, using
       identation and newlines, instead of the default output in a
-- 
2.25.1


