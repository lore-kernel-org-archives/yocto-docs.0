Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
 by mx.groups.io with SMTP id smtpd.web11.6783.1628070437440902691
 for <docs@lists.yoctoproject.org>;
 Wed, 04 Aug 2021 02:47:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=fFEVIoV5;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.46, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f46.google.com with SMTP id n12so1530868wrr.2
        for <docs@lists.yoctoproject.org>; Wed, 04 Aug 2021 02:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=XFBae2w13uMpvZ1UqO5N0RwL5WykdjkKEK09ULlFJCk=;
        b=fFEVIoV5aRaHV5vXyYeZ2Rmv1ysd0VNOiJ4xZSbGqLfoDqphvrslNDAu6KdyjGLfAD
         bOT6QIa4mWYuP2/dXTjgT3TgctjszJXeyX+z5mf0G9yCZd9Owq7CsqcAWn06JkQiqJcs
         A43qmszBtwUR5Erh1BPacb5vM5W5DgVGngHpg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XFBae2w13uMpvZ1UqO5N0RwL5WykdjkKEK09ULlFJCk=;
        b=MY5NPAdw6YnfOOBgEfOqw+VKU3uBJnhXwFBqR7vfTG6JxOnbSoNxVyEtQ9xgWmqg6L
         FoN/XvYp/aaziGJsJlMzg0ztOdcYhdaf7lsD26jxsXkHUkz5M+IYRRJsHAb/arwEl/NC
         1f9Pc59fcOGdhNCa3JvOQgZzgTUEYOH8/LMkQnmPvZbBRiWv4o8UcRDroiLVZAZ/ORWK
         dv1cPW7m4Ft0ZMKGjv1rG7RMbfgd5MhI5r7Z/tNCjo0yLwGBDPuwmqywkrZZBy+7kz8F
         pnIP+tlihiLTv13V/7bY3VqdwKy5T6JAkSwEf3gacbYomc8P35ZmMpdwsKgbwxanxV8K
         y+Qg==
X-Gm-Message-State: AOAM532CNiSTjFCy3MCFixziwy42qoIjt0fRAGtd16FJicBE5KWgh565
	u+SApz47Mx2OUUz/JnA6StQELozn09iGkw==
X-Google-Smtp-Source: ABdhPJxRgp43v3ZYuAKyzg1d+Kc3lbtraX+BlUWds4GInECKbjHZokyo08gAXJg+ci3qWSB5aK5ctg==
X-Received: by 2002:adf:ebc6:: with SMTP id v6mr27369895wrn.398.1628070436023;
        Wed, 04 Aug 2021 02:47:16 -0700 (PDT)
Return-Path: <richard.purdie@linuxfoundation.org>
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:895b:15d0:6c2e:72fa])
        by smtp.gmail.com with ESMTPSA id d16sm1826834wrx.76.2021.08.04.02.47.15
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Aug 2021 02:47:15 -0700 (PDT)
From: "Richard Purdie" <richard.purdie@linuxfoundation.org>
To: docs@lists.yoctoproject.org
Subject: [PATCH 2/2] migration-3.4: Add extra notes to override sytnax changes
Date: Wed,  4 Aug 2021 10:47:14 +0100
Message-Id: <20210804094714.3500323-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
References: <20210804094714.3500323-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/migration-guides/migration-3.4.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
index 6fa1ab20c..d42ee8851 100644
--- a/documentation/migration-guides/migration-3.4.rst
+++ b/documentation/migration-guides/migration-3.4.rst
@@ -56,6 +56,12 @@ context being specific tasks in that case. Tune overrides are another special
 case where some code does use them as overrides but some does not. We plan to try
 and make the tune code use overrides more consistently in the future.
 
+There are some variables which do not use override syntax which include the
+suffix to variables in layer.conf files such as BBFILE_PATTERN, :term:`SRCREV`_xxx
+where xxx is a name from :term:`SRC_URI` and PREFERRED_VERSION_xxx. In particular,
+layer.conf suffixes may be the same as a :term:`DISTRO` override causing some
+confusion. We do plan to try and improve consistency as these issues are identified.
+
 To help with migration of layers there is a script in OE-Core. Once configured
 with the overrides used by a layer, this can be run as::
 
-- 
2.30.2

