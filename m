Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
 by mx.groups.io with SMTP id smtpd.web08.28.1617898963434614783
 for <docs@lists.yoctoproject.org>;
 Thu, 08 Apr 2021 09:22:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=pEAmG12V;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.48, mailfrom: steve@sakoman.com)
Received: by mail-ot1-f48.google.com with SMTP id 91-20020a9d08640000b0290237d9c40382so2804421oty.12
        for <docs@lists.yoctoproject.org>; Thu, 08 Apr 2021 09:22:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g7tbMvx7VcEbQ50e5oyFfS19Ia5JmY1KOVXh2Gbbg80=;
        b=pEAmG12VdoPc9uaM0uLPHJNYWUe1lQl1yywixrT+DNlm0pJpGWZStsVXsSyce7hVh7
         ZOqBI3Ike78azhPctDXPvmxdcO9QJq2J2rjhkfW+EHtzDmxdENGb1CuQ1/kOfcbTwnRL
         +YK6I5aqhV/8jZvRI3adP6P5i+/4iYouuex7q7Dz2a5sJw+9H5FmJFCEVarDNjB6n8PS
         +s1sX3LvjbZ0FdlmlQ8e1kogg6B3xY/K3deO0EUEkh7L0rXxjR0uqfKr3P2fm514N/w2
         0Zq+erEOPvYJnHTwOlzzSBW8GZdZ9eQxtWZfHvBapm+ddLpywoSSbeXO9BuPuuW8zGpY
         J7LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g7tbMvx7VcEbQ50e5oyFfS19Ia5JmY1KOVXh2Gbbg80=;
        b=ugMyyLAHTGbbwpvridSoy/cpWX4u3utm66CcFkbdxY1EoL4UsArfUl69ntFrURuFW7
         e8OG1Zh1p/0WtjQnEpfCOOo960UbCKzuJfkJFFXumHYLQ7fYD8gGs+GNSp7M70xzNPzg
         3BvDtpGc2Wbq0Zd4NRvRBKA3GPT+rq43wRgzs/hJXkQ9PpIIYOQ5w5V3OWGx+W0NT1nX
         fccZb0Jh/FEHycG5BylWRAkOOac6xNeo5Zz8LQ/tWrun8vRVgB8pei/kQBh7ymzpxLwa
         NwPANH5mhNBBKninOowi13xuJgxvrKFaQdZscMM2UAAEyGAx3VMOCgHGhmav5FH1dBRU
         P7qA==
X-Gm-Message-State: AOAM532MVWfxwR9P5J2ym9kfIM4GkSqvHkRnhdbcB136K76K2gaWqU1n
	mH2KLp2kRyxDdmNh5P6mR80w6LReMeAzGcyKeKQ=
X-Google-Smtp-Source: ABdhPJxqA8fBhtg2J970VdcWk4525VILbxLqsEEvWR6m2jHkdGBA5Apm8ZxlITQi4oUdO32lPlv7nQ==
X-Received: by 2002:a9d:748a:: with SMTP id t10mr8507631otk.198.1617898962342;
        Thu, 08 Apr 2021 09:22:42 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from localhost.localdomain ([72.173.249.164])
        by smtp.gmail.com with ESMTPSA id k8sm4932022oig.6.2021.04.08.09.22.38
        for <docs@lists.yoctoproject.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 09:22:41 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: docs@lists.yoctoproject.org
Subject: [yocto-docs][dunfell 0/1] Pull request (cover letter only)
Date: Thu,  8 Apr 2021 06:22:24 -1000
Message-Id: <cover.1617898885.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 660684b1a1ece4bdedfd63b9fc65d14f05c226d5:

  documentation: prepare for 3.1.6 release (2021-02-17 17:35:10 +0000)

are available in the Git repository at:

  git://git.yoctoproject.org/yocto-docs contrib/dunfell-next
  http://git.yoctoproject.org/cgit.cgi/yocto-docs/log/?h=contrib/dunfell-next

Steve Sakoman (1):
  documentation: prepare for 3.1.7 release

 documentation/conf.py                    | 2 +-
 documentation/poky.yaml                  | 8 ++++----
 documentation/releases.rst               | 6 ++++++
 documentation/sphinx-static/switchers.js | 4 ++--
 4 files changed, 13 insertions(+), 7 deletions(-)

-- 
2.25.1

