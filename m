Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3CBAC021B8
	for <webhook@archiver.kernel.org>; Mon, 24 Feb 2025 23:12:33 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.web10.766.1740438743571198549
 for <docs@lists.yoctoproject.org>;
 Mon, 24 Feb 2025 15:12:23 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=UfZv004l;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4399ca9d338so30193865e9.3
        for <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 15:12:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740438742; x=1741043542; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/c4xZ2cnp/mVDPK+9R3CLlZYYnf9yknFpu5UyaPJNc=;
        b=UfZv004lgQmYXNCMIeprLPsgmv7Nf6ZkhwozBbeHd29zzRy8jLnKnNe/3cM9kZBx3m
         xagKHhWwjFgnh+x/m+vMlMU/7CuhYTkQwa14a35QiJAF35eRwIvaHjIQ502SzA1zdz9O
         9BYiiTtUTJmrNEw2GTbcI7MMdJvgvgbGFgPsHgQWtuCldQE0nAa9g1eSTMDXb3r+7RKz
         i4MCKy90YFKtJSjcMIkQqb0LHp/vO8TYAJzuGXXs7I5t4nJ0pDFP08YjLQxJ0JKkOHLn
         MeivynDjbxLpOp/ctZbX9DMWz1KUPvQHQFkh2amjJOA5SaTJHijHO4dn5FdAENC6W2V5
         BsFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740438742; x=1741043542;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/c4xZ2cnp/mVDPK+9R3CLlZYYnf9yknFpu5UyaPJNc=;
        b=Ge8diXh1LYErsEmIOOPhRpakEqVN4HELFxSxeGEQVYCfVzMLkG84L5mGGEIOgE+sE7
         EqT7nnx1nYx9C4xBgv0NUnrlPRkD+HqaWI4/b8EXNsGswsVsVfVciXoJ4nO4rw+yk4CB
         Qwbl623BvC7esaEv9DLvZuI8ivT2kwItdaoo7BkmHiXpNuNThKMt5KeqLvXrEzQre0n8
         WUU6y/hR/put7sKrTyg25T8vXAjT+I98BGLbdZuyk7Ynvrfeh3JbL4V9y4lPaFhbJf8x
         EL4+/au0USnUg7ld8TEYeeFGil1Qyoax7/orkIs5msK1HG9Gcb6jkA7ZK7xvx5wwsslH
         E9jA==
X-Gm-Message-State: AOJu0Yx72M8T+dJEh084jwjSR8LlcwYWgtneTwygN5IWpopFH09ujBqJ
	dl85UnAayVXExqfOS5KIPe3FEvQQNtykBGcblLb3geFjafsvAcAd5Tudlfr4
X-Gm-Gg: ASbGncvXmIR3UGQ9xckdAlbbCDH4/gfaD6HOt/qldRzt7u9Lb3ZaATgLHXFQkI0XrE2
	r+iCnnAnNPcxMUX7tkJUYh3RiNanwEpweJ9GngbM+4z96HicCPufyc/F3YNjnJDB1B2x3crVgE1
	AaNyqQgKMJWoVGMM9cwcI2RdfNcKS6d8NQAizz0Ztz1EOPAkSOSeB3AQZ3e5OWkWlNR8fokLxiF
	x/dtYKJDCQXmXWmW1H7DWxD57Wn5R+lxIWM7I344Lr8TIBzPcjtYTS/8bsGxp3yJ3STqvKPpwgl
	1Wyja/4/6hLiqtJ5j7+X2ap/4hbI7WzOfhzrqzqf8OfWw4Iz
X-Google-Smtp-Source: AGHT+IETeZbNGQuf+7qk/dYZ8fhFmffFPkZevUEzLO7mlpdojhGTBzY+mKMDNjp5nYA63xZ0O5rVKg==
X-Received: by 2002:a05:600c:1914:b0:439:98ef:5d6 with SMTP id 5b1f17b1804b1-43ab0f6de5bmr7576645e9.22.1740438741459;
        Mon, 24 Feb 2025 15:12:21 -0800 (PST)
Received: from wsadrian16.fritz.box ([2a02:169:59a6:0:55c4:f628:91f3:4287])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ab1532f0asm5450195e9.4.2025.02.24.15.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 15:12:21 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: docs@lists.yoctoproject.org
Cc: marex@denx.de,
	rogerio.borin@toradex.com,
	L.Anderweit@phytec.de,
	quaresma.jose@gmail.com,
	quentin.schulz@cherry.de,
	richard.purdie@linuxfoundation.org,
	seanga2@gmail.com,
	Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [PATCH] ref-manual: variable FIT_SIGN_INDIVIDUAL mix-and-match attacks
Date: Tue, 25 Feb 2025 00:11:47 +0100
Message-ID: <20250224231156.3335643-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 24 Feb 2025 23:12:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6443

Add a warning to the documentation of the FIT_SIGN_INDIVIDUAL variable.

This is a conclusion of this discussion:
https://lists.openembedded.org/g/openembedded-core/topic/111218371

Signed-off-by: Adrian Freihofer <adrian.freihofer@siemens.com>
---
 documentation/ref-manual/variables.rst | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
index b432488a012..de7f0a3b292 100644
--- a/documentation/ref-manual/variables.rst
+++ b/documentation/ref-manual/variables.rst
@@ -3175,6 +3175,27 @@ system and gives an overview of their function and contents.
 
       This variable is set to "0" by default.
 
+      .. note::
+
+         Setting this variable to “0” is recommended for several reasons in
+         particular:
+
+         -  If :term:`UBOOT_SIGN_ENABLE` is set to “1”, all image artifacts
+            contained in the FIT image are signed correctly. This is because
+            the hashes of the image nodes are signed via the corresponding
+            configuration nodes. Signing the individual image nodes is
+            therefore redundant as long as the configuration nodes are properly
+            signed.
+
+         -  Allowing to removing the image nodes from the context of the FIT
+            image comes with a risk of mix-and-match attacks. This means that
+            an attacker could combine different signed images which together
+            have a vulnerability and allow an attack on the device.
+
+         -  Not sure if this feature will be maintained for the long term.
+            It adds complexity for a not obvious benefit. This can be seen as a
+            problem, especially in a security context.
+
    :term:`FIT_SIGN_NUMBITS`
       Size of the private key used in the FIT image, in number of bits.
       The default value for this variable is set to "2048"
-- 
2.47.1


