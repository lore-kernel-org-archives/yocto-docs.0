Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web12.9662.1608631086029646782
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Dec 2020 01:58:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=ZcVdRT/T;
 spf=pass (domain: konsulko.com, ip: 209.85.221.51, mailfrom: pbarker@konsulko.com)
Received: by mail-wr1-f51.google.com with SMTP id a12so13898787wrv.8
        for <docs@lists.yoctoproject.org>; Tue, 22 Dec 2020 01:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ep3D/07jNaOOR5XoduOoOPuSgkCumgcBfAfnoHepXUE=;
        b=ZcVdRT/TZ+WLtj4hqOabAmQuhGh9ni+9x5AdJQTPyqRwKjKp7b1nw4NpqLYrrmvGzT
         tUgXEEHzV8Xv4ELjpiyG4VG9iF3Q0QXLUZAwnqnHj3W2tCtJ1t2hJL5yQ3KvXqAyJOaY
         h1izRcZC7kQpv1pMOPv05Anj477mmTwTL2ONU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ep3D/07jNaOOR5XoduOoOPuSgkCumgcBfAfnoHepXUE=;
        b=fBRL/RA2gTHj9qMMWMf7pTMuLup2cMZpXjOZib+R4Y78XEL16XquqAiG+KU8Dn5Jxl
         NMLR/ZeCtnAkLVNHSBPGmmdO/ijbBiyFUbZbrrqcXX8QKG4qqxDABJut+qkgbx3uCGL3
         tTZENesP3OsD8bzsuTekKQNrcAQ91z4lkofDZ+Yle8punscNDjvr4fQytVzgCFSgahkV
         iFI6YIADmlFsdoTb/tkR3s0+ugPVaGfnnNB8+z1BGuYub9yZjaXb1e0nyF/6LJuZ1LCm
         KfwHiPrhM9y1qRcPDHVPt2wuF2TqPQVR0p0EJ4pLUr7ZwGO6VecxVTRTm4IDgrnV9GNV
         QgKQ==
X-Gm-Message-State: AOAM530b/00hR9yq3fycxgK1+URsay3o+qd0kfBWcbH3Gdg2lwnqMytP
	jtGPe1dhjINsT+ntkXxKZp5igYijHWO1Ug==
X-Google-Smtp-Source: ABdhPJx7VydX45vIG9q2pOIJsQDz5kEf9MF/3qMS0zH42LSXZodX0OJ+haoPLaI7huHgKmF7Y7dIHA==
X-Received: by 2002:adf:f60b:: with SMTP id t11mr23486601wrp.401.1608631084440;
        Tue, 22 Dec 2020 01:58:04 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id o125sm27291772wmo.30.2020.12.22.01.58.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Dec 2020 01:58:03 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: docs@lists.yoctoproject.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH v2 4/6] profile-manual: Simplify yocto_bugs link
Date: Tue, 22 Dec 2020 09:57:56 +0000
Message-Id: <20201222095758.7411-5-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201222095758.7411-1-pbarker@konsulko.com>
References: <20201222095758.7411-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Barker <pbarker@konsulko.com>
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

