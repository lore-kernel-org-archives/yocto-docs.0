Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web10.43750.1597672429475046556
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Aug 2020 06:53:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=kjIOqXHh;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: vvavrychuk@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id o18so17830979eje.7
        for <docs@lists.yoctoproject.org>; Mon, 17 Aug 2020 06:53:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ELa0anplrMLOjg9ydNrBmqEmGxjMU2EgnT/yO+K4ogE=;
        b=kjIOqXHhzuDjmiRsmsILqWAHd7tt0xD+SeB2lVQ9+K9DqebOhoGn+wjKsTFzVOKXFU
         LNDX5NzVlZ2QaWmI206bYjLwGDBLAL8Dm7Brt1ZeH6eQ1+z3HmxvueMvvLRYzo4AZGT0
         7vAqIjQ55EfY79eDj6nvX5JsZ6ClKjJeh97SMMeu5hTEK+tcdEPkSuJtfOfpb1ILgAFO
         Jnoo5Z4CuEU9Bq9caP0ng/4DXQjf4uqOuWFkabs8bZ9xSRDVF7DQrqKL5GbwD8cLMFfI
         GoJNeRMk+sjzSOVpeFJfzFrJHZbfU+smSf82b0Ag7fwgmXUbDdFi1jQmDKgVi+pF7cfr
         HDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ELa0anplrMLOjg9ydNrBmqEmGxjMU2EgnT/yO+K4ogE=;
        b=PO8o0fqAep7s0NJPSty9MR9LApIFs+7A49sGP8t2w8srbnnrSmBjMF8KLFadiGKFWp
         8NQJaE8DAUck4NkLR35wYxOJhJOXsrePtvGWrL8SeRzjFGgQVPT3f87Op3J9qA48RNf0
         iu5cPvpCRYJpmH2gaakqWL3/vD/2yjaQ+CcqHJO4DuXgKrZw12+WAkCatEmpydF7SovX
         p3WEW2/vlt++QiV47zFs+51iSA83KNuZgQ2dY6P1qyd17UgWVJzbry7IfoLvq6mb6grR
         8jjG0Y+2mJlFto3M+2UeAFbRuubHKvkjOsVIDgNMYRVokyYsJGoGK39+V86PKIzga+cg
         s/Gg==
X-Gm-Message-State: AOAM531TSXYajG6Fs2NtLyFyCKnYr1V/rFI3zHFyEJ2juluVTIQ7Naz5
	Oz/TBGqI5MYJpaoeNpomH9f86y+FubeHkw==
X-Google-Smtp-Source: ABdhPJxbAtL2Kph89nHv5YD6DhUjIwzV7w2kuqgVOnXvg5AO1spSOYlbFvVklI1WIdrgIrg+ahwS2A==
X-Received: by 2002:a17:906:d78c:: with SMTP id pj12mr14969818ejb.179.1597672427689;
        Mon, 17 Aug 2020 06:53:47 -0700 (PDT)
Return-Path: <vvavrychuk@gmail.com>
Received: from glva-laptop.open-synergy.com ([213.174.19.120])
        by smtp.gmail.com with ESMTPSA id x96sm13664387ede.17.2020.08.17.06.53.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 06:53:46 -0700 (PDT)
From: "Vasyl Vavrychuk" <vvavrychuk@gmail.com>
To: docs@lists.yoctoproject.org
Cc: Vasyl Vavrychuk <vvavrychuk@gmail.com>
Subject: [PATCH 2/2] ref-manual: Mention that staging class is enabled by default.
Date: Mon, 17 Aug 2020 16:53:42 +0300
Message-Id: <20200817135342.18570-2-vvavrychuk@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200817135342.18570-1-vvavrychuk@gmail.com>
References: <20200817135342.18570-1-vvavrychuk@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This information is present for all other classes inherited by base class.

Previously it was mentioned for staging class to but then it was gonne.

Signed-off-by: Vasyl Vavrychuk <vvavrychuk@gmail.com>
---
 documentation/ref-manual/ref-classes.xml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-manual/ref-classes.xml
index 1f353b3c30..4d7baff430 100644
--- a/documentation/ref-manual/ref-classes.xml
+++ b/documentation/ref-manual/ref-classes.xml
@@ -3386,6 +3386,11 @@ This check was removed for YP 2.3 release
                 </para></listitem>
         </itemizedlist>
     </para>
+
+    <para>
+        This class is enabled by default since it is inherited by
+        the <filename>base</filename> class.
+    </para>
 </section>
 
 <section id='ref-classes-syslinux'>
-- 
2.23.0

