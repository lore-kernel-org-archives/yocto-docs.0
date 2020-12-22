Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.12625.1608651040022033248
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 07:30:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=RLgtmPJU;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id m5so14883439wrx.9
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 07:30:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Bx1rORSa9c0lwgHuvVFs1LfCfLmranBJtP2mH4e6jOk=;
        b=RLgtmPJU11/jDmnjBHn5PdSbsyaYcpOp1DxTYlyV9BaLSB7y+ZtY5SQg2L6CGoSO6P
         T4+qG7C4hO7OVXcXBn3m1b23TgmiUGZ43K6K7CnZRn3LobclG9Vyk+FEtz6XXzGB4wsh
         0FtBFjUHvFTitN7Lal6UvnFAZwR6mkFPxowfg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Bx1rORSa9c0lwgHuvVFs1LfCfLmranBJtP2mH4e6jOk=;
        b=uFTCzuV5XAwfhdRr6rVYpGfd+lWfH47eTb/Nz0OLm+NFA8kML3M0qwhjptgaFDZQSx
         b4310d5NHNCd/Q7cvsMdLXJbQs0UUMraI55urU6buToXlsVm5e5CpCP8GOsk++T/XG/o
         tklAGucRQEi8COEsKhQ5DZqw1replGp0RZxhOcXzXtveeMZCD65ZIrA4rxooepZ0J7iQ
         o5OBC7oHTsBgBkSqaskjtOj81mKvZ7sxfxrO9acS51bAvcXTCDW+7UqLywhCqLS6kNku
         ZjvCn6Zk2CIQD875aBNeVn8ZbPiGKtsh/7nXOHGMwP0U8EWqRUetU46LJ5atZRD5C4Y8
         X6gA==
X-Gm-Message-State: AOAM533DQkuUgiB7KoM3hIMp5bNnY0+ilRHksmfXnKJDIMsPcN7wchIi
	q+QaDsXHn+aUv9OVA7XkcQMkYe5Ek7+mSA==
X-Google-Smtp-Source: ABdhPJxqMkjKBEtopD2iU7zTNepadyIN6gEpKEdaiolW/xE3g0+5zCg9hi/UWmMZ8G1iXye/yO92UQ==
X-Received: by 2002:adf:fbd2:: with SMTP id d18mr24969585wrs.222.1608651038406;
        Tue, 22 Dec 2020 07:30:38 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id g192sm27808276wme.48.2020.12.22.07.30.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 07:30:37 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [PATCH v3 4/6] profile-manual: Simplify yocto_bugs link
Date: Tue, 22 Dec 2020 15:30:30 +0000
Message-Id: <20201222153032.6909-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222153032.6909-1-pbarker@konsulko.com>
References: <20201222153032.6909-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 documentation/profile-manual/usage.rst | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/documentation/profile-manual/usage.rst b/documentation/profile-manual/usage.rst
index 418f4e993..0da408443 100644
--- a/documentation/profile-manual/usage.rst
+++ b/documentation/profile-manual/usage.rst
@@ -1159,9 +1159,8 @@ e.g. 'perf help' or 'perf help record'.
 
 However, by default Yocto doesn't install man pages, but perf invokes
 the man pages for most help functionality. This is a bug and is being
-addressed by a Yocto bug: `Bug 3388 - perf: enable man pages for basic
-'help'
-functionality <https://bugzilla.yoctoproject.org/show_bug.cgi?id=3388>`__.
+addressed by a Yocto bug: :yocto_bugs:`Bug 3388 - perf: enable man pages for
+basic 'help' functionality </show_bug.cgi?id=3388>`.
 
 The man pages in text form, along with some other files, such as a set
 of examples, can be found in the 'perf' directory of the kernel tree: ::
-- 
2.26.2

