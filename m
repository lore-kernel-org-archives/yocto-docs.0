Return-Path: <twoerner@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A292C54ED1
	for <webhook@archiver.kernel.org>; Sat, 24 May 2025 01:06:30 +0000 (UTC)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
 by mx.groups.io with SMTP id smtpd.web10.1652.1748048780201695797
 for <docs@lists.yoctoproject.org>;
 Fri, 23 May 2025 18:06:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=VhfDPtGx;
 spf=pass (domain: gmail.com, ip: 209.85.160.171, mailfrom: twoerner@gmail.com)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4766cb762b6so5275821cf.0
        for <docs@lists.yoctoproject.org>; Fri, 23 May 2025 18:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748048778; x=1748653578; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=f+U0j7R/5YOhelDs/USCZlNE+xd6hayQzCRISpHz/lk=;
        b=VhfDPtGxf/6WNc4XK1NJpZF9dCyM+f8cR0HINg4419zsJvki5We5KM0RlWmfcvZ/df
         OlOONVILgmG1UNXV4Bjy6P7BBTVGeW696ydRAbxnJZpXgZKfR+uxaa+3gIMTJAPZUa0F
         kzfZLzgXaOAXDP8RitPcHxIjCDNdazI2yofGNd4AOa1AjpjjSfaFgUevpxANOIt2W7Fi
         gQHqJk/8/vDPncq32kFCHN16VevA0nhzSaTtKQsLtmx+QEFpVepGXL0MggSQxfA4QZ5o
         ds/INadzvBlLmgUfmp4R/r5PC3OklQcopzShB8/sbnw28mywG4pgKlQyD91Cb7QzDcAk
         Nh6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748048778; x=1748653578;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=f+U0j7R/5YOhelDs/USCZlNE+xd6hayQzCRISpHz/lk=;
        b=XwN8Y/CXRgqq+Tfz/h5pWr7t+HhqP50EAhr2OEdMRZeu5d24Mo99BIGpJb2Hqxxh8M
         EV4v0C/S1jgyOxATcUetcIPIsVUyX/w3Cq7n4k7XFhbNdH0ZLOOX5VmL3bzvNEpa9tSk
         y8FN0PM5GG8GM8YbyRyJmpIZingCw8fGmHcwJj7DPqx4JWITztjzAUtf+8JjUrPqklP+
         /oo8qJTMkcEiuQQD8yX3dBe5npm9gM8ESHXy0hG4tdko5TK8JCJeeYn7tBQp2XwFHQAB
         4vhmshlGPNrRwj9s+srbnusCaOqT0KxZA80umFmF0xOeM5MVQyeenWkZ4bD6MSZblg0i
         Pkcw==
X-Gm-Message-State: AOJu0YymRpbSkNr0dN8Rzhx8XYpSXgK41BgFuGc833RgKzZNjIkCsaHk
	pEDvGvl9DmZH4lM5zfC4G3ObRf3OQisNMD/kVxf9HvVXXM7a/SoODlJ0TUFwhA==
X-Gm-Gg: ASbGncvyLeXsLQRfp2VhJ/7qV8jjeBzMAlM6y8/o9ufFbeBgTrRvuULRokAJ3sbAq4Z
	A5QFbJfv6bBOZNht6rjDJJmYl5i5uQecif+RQ9i+4aldj2rSOq73eq7SRdvXykCeGDQn3sMBtJk
	1nygpsBQnZkEcVAUP3nC/l3UqhFMulaoyl30/Tqs7Vs4sKNF8QVcRY1JF4CJZMo01V/ImMx20uW
	zLAYsmsTH4XO9yhArVvuescYF2fAy+QEm3ZcVM+77Mav7DYfKoAzs4LfJ1926WUNGgoFQ3jvwlk
	azzeu849Yddm2wTD11eivqsVzLR/+0swn6EBDVSe3dHPNexGPziNiTZQ9hOHGKXjOjVQg8EpK+w
	o4nAKwoOL1uL0+KMq53Q=
X-Google-Smtp-Source: AGHT+IEeQt2BbyspUMg4cntA7zBf7KpufBUV8wv/hnjRgDceNqLosyzVDsa4YnFf9H+v89H+Hcohig==
X-Received: by 2002:a05:622a:4113:b0:49b:eb1d:18aa with SMTP id d75a77b69052e-49f33175128mr23619241cf.6.1748048778483;
        Fri, 23 May 2025 18:06:18 -0700 (PDT)
Received: from localhost.localdomain (pppoe-209-91-167-254.vianet.ca. [209.91.167.254])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd468e3fe2sm1257624985a.113.2025.05.23.18.06.17
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 18:06:17 -0700 (PDT)
From: Trevor Woerner <twoerner@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH 1/3] sphinx-lint: trailing whitespace
Date: Fri, 23 May 2025 21:06:07 -0400
Message-ID: <20250524010609.40569-1-twoerner@gmail.com>
X-Mailer: git-send-email 2.44.0.501.g19981daefd7c
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Sat, 24 May 2025 01:06:30 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6891

Fix all instances of trailing-whitespace as reported by 'make sphinx-lint'.

Signed-off-by: Trevor Woerner <twoerner@gmail.com>
---
 documentation/sdk-manual/extensible.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/sdk-manual/extensible.rst b/documentation/sdk-manual/extensible.rst
index d8d3858bfee2..a7546e728849 100644
--- a/documentation/sdk-manual/extensible.rst
+++ b/documentation/sdk-manual/extensible.rst
@@ -669,7 +669,7 @@ SDK or eSDK:
    ``devtool build``.
    It also allows to benefit from the very good integration that IDEs like
    VSCode offer for tools like CMake or GDB.
-   
+
    However, supporting many programming languages and multiple
    IDEs is quite an elaborate and constantly evolving thing. Support for IDEs
    is therefore implemented as plugins. Plugins can also be provided by
-- 
2.44.0.501.g19981daefd7c


