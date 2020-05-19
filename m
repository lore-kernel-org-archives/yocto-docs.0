Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
 by mx.groups.io with SMTP id smtpd.web11.2065.1589909503546227071
 for <docs@lists.yoctoproject.org>;
 Tue, 19 May 2020 10:31:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=CqZCSVIO;
 spf=pass (domain: gmail.com, ip: 209.85.214.194, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f194.google.com with SMTP id q16so188899plr.2
        for <docs@lists.yoctoproject.org>; Tue, 19 May 2020 10:31:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:subject:date:message-id;
        bh=0YFS5kSuxk9CCImYklM5Sbp/CvpJqjcAcYfVqgX4kO8=;
        b=CqZCSVIODuoiyFME9Y/dKPHUIYtonQnJfxUsSOG9otH0yjSq8/87O9OKPdUy8CNDn7
         xM0EUivxHB0gdyjQCGUfapapMMzEniIdhWKGzrpaNYtPb8I249oS1XKSDVdw52LoVZpA
         tlAm8Ob88st4vHiTmnIwofyR+tdI1u4qyQFIMmKuJRDbg+XaavGgoH9mmZPel1UYd1LH
         /hOrgpLkw7B4BHD0Ly9vSk6O0Rn6lOtqEznrlT0S6gddxhYWgD15aJbWvVVKkzY5mvIg
         C9ZqvrzAgzFENHqe3OXk3nqvZbNkDNEWYideA52OjWZKkonHvJkHd9N+95APG+A7VRhQ
         DGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=0YFS5kSuxk9CCImYklM5Sbp/CvpJqjcAcYfVqgX4kO8=;
        b=Wq7NiyqTDvw7U/gX1JNWr4BrNGMD04ei+Z5VMtQYJ8HzukA6W4nPTCV3YIkIpHaVAO
         3BZ2GUoQY9DnfdrXpss+/BHcQ6EHoZiCanbly/DfiPl5Jv9D+sbxM/pe8eChH+QtsRg9
         hspd02AJKr3xjjUFHkmv2gQjZDqZTZl8r+rNYFhZGz0pIIx+ybISp47Vi2ojk8315Hxa
         1oySU3mZ8sOMAHGpoTiOI0Ufu1c1zhnqFChDQh6nNx2z5/0bxqCsRNx72H+S816cHaIZ
         WDx/mg08G0ZO/mDe4nNOm+BYOwiI5VSEtaULaApna7HfyFoLQJjBtRBwLt+XKxD26fzG
         Z4nw==
X-Gm-Message-State: AOAM531kvhfcU27WeHOh6BmCSDJi9ZGlZoze/ZwB6//XQ7iAz6kpBIY/
	768L1c7M4yelEyiIulQwoqguF+34
X-Google-Smtp-Source: ABdhPJxi+E/S3nslYnRkXDBvYa9O4At7IPBdDbsyxulZKgQTxo8NgIhxYi06GJJK/dN0YGVUDJS2oQ==
X-Received: by 2002:a17:902:d70f:: with SMTP id w15mr569320ply.55.1589909502719;
        Tue, 19 May 2020 10:31:42 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from akuster-ThinkPad-T460s.mvista.com ([2601:202:4180:a5c0:9de6:6921:ec78:716d])
        by smtp.gmail.com with ESMTPSA id t21sm90112pgu.39.2020.05.19.10.31.41
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 10:31:42 -0700 (PDT)
From: "akuster" <akuster808@gmail.com>
To: docs@lists.yoctoproject.org
Subject: [PATCH] poky.ent: Update OPENSUSE_HOST_PACKAGES_ESSENTIAL to include mesa-dri-devel
Date: Tue, 19 May 2020 10:31:41 -0700
Message-Id: <20200519173141.20686-1-akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 documentation/poky.ent | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/documentation/poky.ent b/documentation/poky.ent
index a54793911a..fd8c335868 100755
--- a/documentation/poky.ent
+++ b/documentation/poky.ent
@@ -70,7 +70,7 @@
      python3-jinja2 SDL-devel xterm rpcgen">
 <!ENTITY OPENSUSE_HOST_PACKAGES_ESSENTIAL "python gcc gcc-c++ git chrpath make wget python-xml \
      diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
-     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen
+     python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen mesa-dri-devel
      $ sudo pip3 install GitPython">
 <!ENTITY CENTOS7_HOST_PACKAGES_ESSENTIAL "-y epel-release
      $ sudo yum makecache
-- 
2.17.1

