Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com [209.85.221.65])
 by mx.groups.io with SMTP id smtpd.web12.39246.1606154548069562964
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Nov 2020 10:02:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=OuF9vexb;
 spf=pass (domain: konsulko.com, ip: 209.85.221.65, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f65.google.com with SMTP id g14so4301973wrm.13
        for <docs@lists.yoctoproject.org>; Mon, 23 Nov 2020 10:02:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JrLCK2oXgOsju6X9tbnnbZmsZ8rf7UnHl20YiPoBv5Y=;
        b=OuF9vexbE8B2cy3fFh0//2WGXL62wp9sCwiQwd/ntw58Ajbo83w0n7d4TA3Kv5nqB3
         OWIVzEp5oo67d4gddBiN1Z4b6INzWg6wPu1GBWsGBmUr6Y9+GY1+WX6NKc5Ql5K4gld2
         jFFi6gJcCJPY9x82Vwl6MA8XDh7HXVnbM/SY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JrLCK2oXgOsju6X9tbnnbZmsZ8rf7UnHl20YiPoBv5Y=;
        b=cqjiAX9oRbcM3F5/UCpb4Sy8mFcbs21lQak2nqW7L4eriGCGkDOtGGnELIwTlusjxw
         EzvfBafKmdHWLiXEHAbYBj2N6FAwNq9xXS4hTAIb6hcgtK6oWRZgPyPwyItzmspSOw1L
         +5Mzb0WcBnegxuGP+h1RlYlUZ0x4zVh3xfk9hv/B8Ut/CvMxo5hBujjGGYH0RZB/pheP
         ORsTNlBsWidIHBTqWTtcZJeKRYJ4Dw5Vy8ca2R0tn+PxfngURJKqdkbL6ALfhz49h+GP
         z/VOrPBXQ6ibclixAEZWdQGDcW9RnsO/TJjnGYV5d1UyQt+iMZ2FMJEyCrBz7HqOwKvK
         O8TA==
X-Gm-Message-State: AOAM5325ejaV5QyufJDIMR1ndTBvW+yCCqVnXCBW5oweE4f4zq6HjT23
	rUkwdKyAWNgYpLMAWpWRGP0lzQdQMtBoKQ==
X-Google-Smtp-Source: ABdhPJw0uR0+aGnpjOpeYTuRrhKMHpdkkqqXfsGdy8Xg2huzomJ8qHNRiXnm2+JjW00+U9YpFndjew==
X-Received: by 2002:a5d:534e:: with SMTP id t14mr904474wrv.234.1606154546364;
        Mon, 23 Nov 2020 10:02:26 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from deb10.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id v8sm117315wmg.28.2020.11.23.10.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2020 10:02:25 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v3 4/7] dev-manual-common-tasks: Describe git-send-email accurately
Date: Mon, 23 Nov 2020 18:02:16 +0000
Message-Id: <20201123180219.1966-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201123180219.1966-1-pbarker@konsulko.com>
References: <20201123180219.1966-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 documentation/dev-manual/dev-manual-common-tasks.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/documentation/dev-manual/dev-manual-common-tasks.rst b/documentation/dev-manual/dev-manual-common-tasks.rst
index 2a521905e..1c6d88a93 100644
--- a/documentation/dev-manual/dev-manual-common-tasks.rst
+++ b/documentation/dev-manual/dev-manual-common-tasks.rst
@@ -10939,8 +10939,8 @@ without using the scripts once the steps in
       or to OpenEmbedded, you might consider requesting a contrib area
       and the necessary associated rights.
 
-2. *Import the Files Into Your Mail Client:* Import the files into your
-   mail client by using the ``git send-email`` command.
+2. *Send the patches via email:* Send the patches to the recipients and
+   relevant mailing lists by using the ``git send-email`` command.
 
    .. note::
 
-- 
2.20.1

